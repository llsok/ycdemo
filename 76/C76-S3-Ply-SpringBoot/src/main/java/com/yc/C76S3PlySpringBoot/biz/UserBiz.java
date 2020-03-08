package com.yc.C76S3PlySpringBoot.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.C76S3PlySpringBoot.bean.User;
import com.yc.C76S3PlySpringBoot.dao.UserMapper;

@Service
public class UserBiz {
	
	@Resource
	private UserMapper um;
	
	public boolean login(String name, String pwd) {
		User user = um.selectByNameAndPassword(name, pwd);
		return user != null;
	}

}
