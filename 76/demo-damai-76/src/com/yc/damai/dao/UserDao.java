package com.yc.damai.dao;

import com.yc.damai.bean.User;
import com.yc.damai.util.DBHelper;

public class UserDao {

	public void insert(User user) {
		String sql = "insert into user "+
				"values(null,?,?,?,?,?,?,null,null,null)";
		DBHelper.update(sql,user.getUsername(),
				user.getPassword(),
				user.getName(),
				user.getEmail(),
				user.getPhone(),
				user.getSex());
	}

}
