package com.lzy.damai.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;

import com.lzy.damai.bean.Product;

public interface ProductMapper {
	
	@Select("select * from product")
	public List<Product>selectAll();
	
	@Select("select * from product where pid=#{pid}")
	public Product selectBypid(Integer pid);
	
	@Results(id="myRM",value={
		@Result(column="market_price",property="marketPrice"),
		@Result(column="shop_price",property="shopPrice"),
		@Result(column="is_hot",property="isHot")
	})
	@Select("select * from product where pname like #{pname} and is_hot=#{isHot}")
	public List<Product> selectByPnameAndIsHot(@Param("pname") String pname,@Param("isHot") Integer isHot);
	
	@Select("${sql}")
	public List<Map<String,Object>> selectBySQL(String sql);
	
	public List<Product> selectByCondition(@Param("panme") String pname,
			@Param("from")Timestamp from,@Param("to")Timestamp to,
			@Param("priceType")Double priceType,@Param("image")Double image,
			@Param("isHot")Integer isHot,@Param("cidlist")List<Integer> cidlist
);
}
