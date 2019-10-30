package com.yc.damai.biz;

import java.util.List;

import com.yc.damai.bean.Orders;
import com.yc.damai.dao.OrdersDao;

public class OrdersBiz {
	
	private OrdersDao dao = new OrdersDao();
	
	public List<Orders> queryByUid(Long uid){
		return dao.selectByUid(uid);
	}

}
