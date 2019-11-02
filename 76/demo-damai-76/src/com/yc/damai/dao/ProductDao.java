package com.yc.damai.dao;

import java.util.List;
import java.util.Map;

import com.yc.damai.bean.Product;
import com.yc.damai.util.DBHelper;

public class ProductDao {

	public List<Product> selectAll() {
		String sql = "select * from product";
		List<Map<String,Object>> list = DBHelper.selectList(sql);
		return DBHelper.populate(list, Product.class);
	}

}
