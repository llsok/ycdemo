package com.yc.favorite.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import com.yc.favorite.bean.Tag;

public interface TagMapper {
	
	@Insert("insert into tag values (null,#{tName},#{tCount})")
	@Options(useGeneratedKeys=true,keyColumn="t_id",keyProperty="tId")
	int insert(Tag tag);

}
