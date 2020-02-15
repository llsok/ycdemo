package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yc.favorite.bean.Tag;

public interface TagMapper {
	
	//@Select("select * from tag")
	public List<Tag> selectAll();
	
}
