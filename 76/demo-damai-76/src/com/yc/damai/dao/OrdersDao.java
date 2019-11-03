package com.yc.damai.dao;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.yc.damai.bean.Orders;
import com.yc.damai.bean.User;
import com.yc.damai.util.DBHelper;

public class OrdersDao {

	public List<Orders> selectByUid(Long uid) {
		
		String sql = "select * from orders where uid=?";
		List<Map<String,Object>> list = DBHelper.selectList(sql, uid);
		List<Orders> ret = new ArrayList<>();
		for(Map<String,Object> row : list){
			Orders o = new Orders();
			try {
				BeanUtils.populate(o, row);
			} catch (IllegalAccessException | InvocationTargetException e) {
				throw new RuntimeException(e);
			}
			ret.add(o);
		}
		return ret;
	}

}
