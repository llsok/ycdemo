package com.yc.C76S3PlySpringBoot.dao;

import com.yc.C76S3PlySpringBoot.bean.User;

public interface UserMapper {
	
	public User selectByNameAndPassword(String name , String pwd);

}
