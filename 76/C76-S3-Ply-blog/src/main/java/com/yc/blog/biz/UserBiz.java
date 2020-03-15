package com.yc.blog.biz;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.yc.blog.bean.User;
import com.yc.blog.bean.UserExample;
import com.yc.blog.dao.UserMapper;

@Service
public class UserBiz {

	@Resource
	private UserMapper um;

	public void reg(User user, String repwd) throws BizException {

		UserExample ue = new UserExample();
		ue.createCriteria().andAccountEqualTo(user.getAccount());

		if (user.getPwd().equals(repwd) == false) {
			throw new BizException(101, "pwd", "密码与确认密码不一致!");
		}

		if (um.countByExample(ue) > 0) {
			throw new BizException(102, "name", "该用户名已经被注册!");
		}

		um.insert(user);

	}

	/**
	 * 用户可以根据 用户名, 昵称, 电话, 邮箱进行登录
	 * @param user
	 * @return
	 * @throws BizException 
	 */
	public User login(@Valid User user) throws BizException {
		UserExample ue = new UserExample();
		ue.or().andAccountEqualTo(user.getAccount()).andPwdEqualTo(user.getPwd());
		ue.or().andNameEqualTo(user.getAccount()).andPwdEqualTo(user.getPwd());
		ue.or().andPhoneEqualTo(user.getAccount()).andPwdEqualTo(user.getPwd());
		ue.or().andEmailEqualTo(user.getAccount()).andPwdEqualTo(user.getPwd());

		List<User> list = um.selectByExample(ue);

		if (list.size() == 0) {
			throw new BizException(103, "name", "用户名或密码错误!");
		} else if (list.size() > 1) {
			throw new BizException(104, "name", "存在多个相同的账号信息, 请更换其他登录字段!");
		} else {
			return list.get(0);
		}

	}

	@Resource
	private MailService ms;
	
	public String forget(String account) throws BizException {
		UserExample ue = new UserExample();
		ue.createCriteria().andAccountEqualTo(account);
		List<User> list = um.selectByExample(ue);
		if(list.size() == 1) {
			User user = list.get(0);
			String vcode = System.currentTimeMillis() + "";
			vcode = vcode.substring(vcode.length()-4, vcode.length());
			String content = "您重置密码所需的验证码是: " + vcode;
			ms.sendSimpleMail(user.getEmail(), "重置密码", content);
			return vcode;
		} else {
			throw new BizException(1007, "name", "用户名错误!");
		}
	}

}
