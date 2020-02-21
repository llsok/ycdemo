package com.yc.spring.bbs.biz;

import java.util.List;

import com.yc.spring.bbs.bean.User;
import com.yc.spring.bbs.dao.UserDao;

public class UserBiz {

	private UserDao dao;

	public void create(User user) {
		dao.insert(user);
	}

	public void modify(User user) {
		dao.update(user);
	}

	public void delete(User user) {
		dao.delete(user);
	}

	public List<User> query(User user) {
		return dao.selectByObject(user);
	}

}
