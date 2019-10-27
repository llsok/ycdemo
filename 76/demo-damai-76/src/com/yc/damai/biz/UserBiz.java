package com.yc.damai.biz;

import com.yc.damai.bean.User;
import com.yc.damai.dao.UserDao;

public class UserBiz {
	
	private UserDao dao = new UserDao();
	
	/**
	 * 注册用户
	 * @param user
	 * @throws BizException 
	 */
	public void reg(User user, String repassword) throws BizException{
		
		if(user.getUsername()==null || user.getUsername().trim().isEmpty()){
			throw new BizException("请求输入用户名！");
		}
		
		if(user.getPassword()==null || user.getPassword().trim().isEmpty()){
			throw new BizException("请求输入密码！");
		}
		
		if(user.getPassword().equals(repassword)==false){
			throw new BizException("两次输入的密码不一致！");
		}
		// 邮箱、电话、密码长度、用户名长度、密码复杂度。。。。
		
		dao.insert(user);
		
	}

}
