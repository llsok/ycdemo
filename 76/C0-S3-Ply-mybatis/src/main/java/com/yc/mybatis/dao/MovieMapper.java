package com.yc.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yc.mybatis.bean.Movie;

public interface MovieMapper {
	
	@Select("select * from movie")
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
	
	@Insert("insert into movie (name,duration) values (#{name},#{duration})")
	@Options(useGeneratedKeys = true, keyColumn = "id",keyProperty = "id")
	void insert(Movie m);
	
	/**
	 * 根据用户的要求进行排序     order by 字段名        #{}   ==> ? 不可实现
	 * 
	 * 命名语句块，在单参数时，也需要加 @Param 注解
	 * @return
	 */
	List<Movie> selectAllWithOrder(@Param("orders") String orders);
	
	
	
}
