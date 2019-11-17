package com.yc.spring.bbs.dao;

import java.util.List;
/**
 * 泛型Dao接口
 * @author LiaoYan
 *
 * @param <T>
 */
public interface BaseDao<T> {

	void insert(T t);

	void update(T t);

	void delete(T t);
	
	void selectOne(Object id);

	List<T> selectList(T t, Integer page, Integer rows);

	long count(T t);

}
