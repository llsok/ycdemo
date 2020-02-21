package com.yc.spring.common.dao;

import java.util.List;

public abstract class BaseDao<E> {

	public void insert(E e) {

	}

	public void update(E e) {

	}

	public void delete(E e) {

	}

	public E selectById(Object id) {
		return null;
	}

	public List<E> selectByObject(E e) {
		return null;
	}

}
