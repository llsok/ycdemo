package com.yc.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.mybatis.bean.Movie;

public interface MovieMapper {
	
	List<Movie> selectAll();
	
	/**
	 * 根据 电影的相关属性进“组合条件查询”
	 */
	List<Movie> selectByMovie(Movie m);
	
	/**
	 * 
	 * @param name  电影 name 字段
	 * @param flag  1,2,3,4 如果 flag==1 精确查询，flag==2 模糊查询，flag==3 空值查询  flag==4 非空查询
	 * @return

	 * 在多参数的环境下，必须为每个参数指定名称，否则就必须是用mybatis默认参数名  arg0~argN  或 param1 ~ paramN
	 * 要指定名称，就必须使用  @Param 注解
	 */
	List<Movie> selectByFlag(@Param("name")String n, @Param("flag") String f);
	
	Movie selectById(int id);
	
	void update(Movie m);
	
	List<Movie> selectInLanguage(@Param("languages") String[] languages);
	
	
}
