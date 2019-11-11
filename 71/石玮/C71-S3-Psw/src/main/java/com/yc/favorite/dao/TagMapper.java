package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;

import com.yc.favorite.bean.Tag;

public interface TagMapper {
	@Insert("insert into tag values (null,#{tName},#{tCount})")
	@Options(useGeneratedKeys = true,keyColumn = "t_id",keyProperty = "tId"	)
	int insert(Tag tag);
	
	// ���ݿ��� t_name Ӧ����Ψһ����
		// ���ص� int ֵ���ǳɹ��޸ĵ����ݿ�ļ�¼������
		@Update("update tag set t_count = t_count + 1 where t_name = #{tName}")
		int update(String tag);
		
		@Results(
				id="baseMap",
				value = {
					@Result(column = "t_name",property = "favorites",
							many = @Many(select="com.yc.favorite.dao.FavoriteMapper.selectByTagName",
							fetchType = FetchType.LAZY)),	
					
				@Result(column = "t_name",property = "tName")
						}
				)
		@Select("select * from tag")
		List<Tag> selectAll();
}
