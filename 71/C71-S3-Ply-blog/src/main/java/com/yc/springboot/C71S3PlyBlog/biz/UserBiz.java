package com.yc.springboot.C71S3PlyBlog.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.springboot.C71S3PlyBlog.bean.User;
import com.yc.springboot.C71S3PlyBlog.bean.UserExample;
import com.yc.springboot.C71S3PlyBlog.dao.UserMapper;

@Service
public class UserBiz {
	
	@Resource
	private UserMapper um;
	
	@Resource
	private LogBiz lbiz;

	public User login(User user) throws BizException {
		
		lbiz.log2(user);
		
		lbiz.log(user);
		
		UserExample example = new UserExample();
		
		example.createCriteria()
			.andAccountEqualTo(user.getAccount())
			.andPwdEqualTo(user.getPwd());
		
		List<User> list = um.selectByExample(example);
		
		lbiz.log(user);
		lbiz.log(user);
		lbiz.log(user);
		lbiz.log(user);
		lbiz.log(user);
		
		
		lbiz.log1(user);
		lbiz.log1(user);
		lbiz.log1(user);
		lbiz.log1(user);
		lbiz.log1(user);
		lbiz.log1(user);
		lbiz.log1(user);
		
		if(list.size() == 0){
			throw new BizException("用户名或密码错误！");
		} else {
			return list.get(0);
		}


	}

}
