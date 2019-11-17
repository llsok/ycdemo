package com.yc.spring.bbs.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.yc.spring.bbs.bean.User;

@Component
public class  UserDao implements BaseDao<User> {

	@Override
	public void insert(User t) {
	}

	@Override
	public void update(User t) {
	}

	@Override
	public void delete(User t) {
	}

	@Override
	public void selectOne(Object id) {
	}

	@Override
	public List<User> selectList(User t, Integer page, Integer rows) {
		return null;
	}

	@Override
	public long count(User t) {
		return 0;
	}

}
