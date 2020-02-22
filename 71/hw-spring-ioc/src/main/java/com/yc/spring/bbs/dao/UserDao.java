package com.yc.spring.bbs.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.yc.spring.bbs.bean.User;

@Component
public class  UserDao {

	public void insert(User t) {
	}

	public void update(User t) {
	}

	public void delete(User t) {
	}

	public void selectOne(Object id) {
	}

	public List<User> selectList(User t, Integer page, Integer rows) {
		int i= 1/0;
		return new ArrayList<User>();
	}

	public long count(User t) {
		return 0;
	}

}
