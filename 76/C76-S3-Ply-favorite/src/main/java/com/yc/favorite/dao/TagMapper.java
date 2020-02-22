package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yc.favorite.bean.Tag;

public interface TagMapper {
	
	//@Select("select * from tag")
	public List<Tag> selectAll();
	
	@Update("update tag set t_count = t_count + 1 where t_name=#{tName}")
	public int updateCount(String tName);
	
	@Insert("insert into tag values(null, #{tName}, 1)")
	public int insert(String tName);
	
}
