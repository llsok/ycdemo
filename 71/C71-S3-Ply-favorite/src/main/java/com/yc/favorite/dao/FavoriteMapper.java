package com.yc.favorite.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import com.yc.favorite.bean.Favorite;

public interface FavoriteMapper {
	
	@Insert("insert into favorite values (null,#{fLabel},#{fUrl},#{fTags},#{fDesc})")
	@Options(useGeneratedKeys=true,keyColumn="f_id",keyProperty="fId")
	int insert(Favorite favorite);

}
