package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;

import com.yc.favorite.bean.Tag;

public interface TagMapper {
	@Insert("insert into tag values(null,#{tName},#{tCount})")
	@Options(useGeneratedKeys = true, keyColumn = "t_id", keyProperty = "tId")
	int insert(Tag tag);

	// 数据库t_name 应该是唯一索引
	// 返回的 int 值就是成功修改数据库的记录的行数
	@Update("update tag set t_count = t_count +1 where t_Name=#{tName}")
	int update(String tag);

	@Results(
			id = "baseMap",
			value = {
					@Result(column="t_name",property="tName"),
					@Result(
					column = "t_name",
					property = "fList", 
					many = @Many(
							select = "com.yc.favorite.dao.FavoriteMapper.selectByTagName"
							 	)
					) 
				}
			)
	@Select("select* from tag")
	List<Tag> selectAll();
	
	@Select("select * from tag where t_name=#{tName}")
	Tag selectByTagName(String tName);
	
	@Select("select t_name,t_count from tag  ORDER BY t_count DESC")
	List<Tag> orderBytCount();

	@Select("select Max(t_count) from tag")
	int maxTags();
	
}
