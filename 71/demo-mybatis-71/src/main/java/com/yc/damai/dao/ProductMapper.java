package com.yc.damai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.damai.bean.Product;

public interface ProductMapper {
	
	public List<Product> selectAll();
	
	public Product selectByPid(Integer pid);
	
	/**
	 * MyBatis 方法传入多个参数时，要使用 Param 注解标注参数名
	 * @param p
	 * @param i
	 * @return
	 */
	public List<Product> selectByPnameAndIsHot(@Param("pname") String p, @Param("isHot")Integer i);

}
