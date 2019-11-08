package com.yc.damai.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;

import com.yc.damai.bean.Product;

public interface ProductMapper {
	
	@Select("select * from product")
	public List<Product> selectAll();
	
	@Select("select * from product where pid=#{pid}")
	public Product selectByPid(Integer pid);
	
	/**
	 * MyBatis 方法传入多个参数时，要使用 Param 注解标注参数名
	 * @param p
	 * @param i
	 * @return
	 */
	@Results(id="myRM",value={
			@Result( column="market_price", property="marketPrice"),
			@Result( column="shop_price", property="shopPrice"),
			@Result( column="is_hot", property="isHot")
	})
	@Select("select * from product where pname like #{pname} and is_hot=#{isHot}")
	public List<Product> selectByPnameAndIsHot(@Param("pname") String p, 
			@Param("isHot")Integer i);
	
	
	@Select("${sql}")
	public List<Map<String,Object>> selectBySQL(String sql);
	
	
	public List<Product> selectByCondition(@Param("pname")String pname,
			@Param("begin")Timestamp begin,@Param("end")Timestamp end, 
			@Param("priceType")Integer priceType,
			@Param("cidList") Integer[] cidList);
	
	
	
	
	
	
	
	
	
	
	
	

}
