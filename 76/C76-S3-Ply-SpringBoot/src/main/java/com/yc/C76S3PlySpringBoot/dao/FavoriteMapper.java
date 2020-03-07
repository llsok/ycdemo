package com.yc.C76S3PlySpringBoot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.yc.C76S3PlySpringBoot.bean.Favorite;

public interface FavoriteMapper {
	
	/**
	 * 根据flag的值做对应的  Favoriate 查询，如果 flag == 1 查全部， 如果 flag==2 查 f_tags == null 的记录
	 * @param flag
	 * @return
	 */
	public List<Favorite> selectByFlag(@Param("flag")String flag);
	
	@Insert("insert into favorite values (null,#{fLabel},#{fUrl},#{fTags},#{fDesc})")
	public void insert(Favorite f);

}
