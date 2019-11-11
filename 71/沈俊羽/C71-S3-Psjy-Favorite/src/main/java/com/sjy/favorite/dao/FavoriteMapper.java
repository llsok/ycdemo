package com.sjy.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.sjy.favorite.bean.Favorite;
import com.sjy.favorite.bean.Tag;

public interface FavoriteMapper {

	/**
	 * 添加链接的需求分析
	 * tags  字段  娱乐,军事,购物
	 *  1、判断tag 是否存在
	 *  2、存在+1
	 *  3、不存在 添加
	 *  4、添加链接
	 */
	@Insert("insert into favorite values(null,#{fLabel},#{fUrl},#{fTags},#{fDesc})")
	@Options(useGeneratedKeys=true,keyColumn="f_id",keyProperty="fId")//返回主键序列值
	int insert(Favorite favorite);

	@Select("select * from favorite where f_tags like concat('%',#{tName},'%')")
	List<Favorite> selectByTagName(String tName);
	
	@Select("select * from favorite")
	List<Favorite> selectAll();
	
	@Select("select * from favorite where f_tags is null")
	List<Favorite> selectBynotTagName();
}
