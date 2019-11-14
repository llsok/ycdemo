package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.yc.favorite.bean.Favorite;
import com.yc.favorite.bean.Tag;

public interface FavoriteMapper {
	@Insert("insert into favorite values(null,#{fLabel},#{fUrl},#{fTags},#{fDesc})")
	@Options(useGeneratedKeys=true ,keyColumn="f_id" ,keyProperty="fId")
	int insert(Favorite favorite);
	
	@Select("select * from favorite where f_tags like concat('%',#{tName},'%')")
	List<Favorite> selectByTagName(String tName);
	
	@Select("select * from favorite")
	List<Favorite> selectAll();
	
	@Select("select * from favorite where f_tags is null")
	List<Favorite> selectByNotClassified();
}
