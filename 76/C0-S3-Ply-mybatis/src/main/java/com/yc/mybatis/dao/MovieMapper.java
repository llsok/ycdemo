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
	
	/**
	 * @CacheNamespace(size = 512)：定义在该命名空间内允许使用内置缓存
	@Options(useCache = true, flushCache = false, timeout = 10000)：一些查询的选项开关
	@Param("id")：全局限定别名，定义查询参数在sql语句中的位置不再是顺序下标0,1,2,3......的形式，而是对应名称，该名称在此处定义。 
	@Results是以@Result为元素的数组，@Result表示单条属性——字段的映射关系，id = true表示该id字段是主键，查询时mybatis会给予必要的优化。
		数组中所有的@Result组成了单个记录的映射关系，而@Results则是单个记录的集合。另外，还有一个非常重要的注解@ResultMap，用于引用@Results
	@Select("查询语句")、@Insert("增加语句")、@Update("更新语句")和@Delete("删除语句")表示对数据进行查询、添加、更新和删除的操作。

	 */
	
}
