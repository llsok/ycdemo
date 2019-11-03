package com.yc.damai.dao;

import java.util.List;
import java.util.Map;


import com.yc.damai.bean.Category;
import com.yc.damai.util.DBHelper;

public class CategoryDao {

	public List<Category> selectAll() {
		
		String sql = "select * from category";
		List<Map<String,Object>> list = DBHelper.selectList(sql);
		return DBHelper.populate(list, Category.class);
	}

}
