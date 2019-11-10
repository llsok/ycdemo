package com.yc.favorite.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Update;

import com.yc.favorite.bean.Tag;

public interface TagMapper {
	
	@Insert("insert into tag values (null,#{tName},#{tCount})")
	@Options(useGeneratedKeys=true,keyColumn="t_id",keyProperty="tId")
	int insert(Tag tag);
	
	// 数据库中 t_name 应该是唯一索引
	// 返回的 int 值就是成功修改的数据库的记录的行数
	@Update("update tag set t_count = t_count + 1 where t_name = #{tName}")
	int update(String tag);

}
