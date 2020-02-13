package com.yc.mybatis.dao;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.yc.mybatis.bean.Cinema;

public interface CinemaMapper {
	
	@Select("select * from cinema where id = #{id}")
	@Results(id="cimemaMapper",
		value = {
		@Result(column = "id",property = "id"),
		@Result(column = "id",property = "halls",
				many = @Many(select = "com.yc.mybatis.dao.HallMapper.selectByCinemaId",
				fetchType = FetchType.LAZY))
	})
	Cinema selectById(int id);
	
}
