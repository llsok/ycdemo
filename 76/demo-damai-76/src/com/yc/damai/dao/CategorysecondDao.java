package com.yc.damai.dao;

import java.util.List;
import java.util.Map;


import com.yc.damai.bean.Categorysecond;
import com.yc.damai.util.DBHelper;

public class CategorysecondDao {

	public List<Categorysecond> selectByCid(String cid) {
		
		String sql = "select * from categorysecond where cid = ?";
		List<Map<String,Object>> list = DBHelper.selectList(sql,cid);
		return DBHelper.populate(list, Categorysecond.class);
	}

}
