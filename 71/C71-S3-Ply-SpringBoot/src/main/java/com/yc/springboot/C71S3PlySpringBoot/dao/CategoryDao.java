package com.yc.springboot.C71S3PlySpringBoot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yc.springboot.C71S3PlySpringBoot.bean.Category;

public interface CategoryDao {
	
	@Select("select * from category")
	List<Category> selectAll();

}
