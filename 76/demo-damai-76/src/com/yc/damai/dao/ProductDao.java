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

	public void insert(Product p) {
		String sql = "insert into product values(null,?,?,?,?,?,?,now(),?)";
		DBHelper.update(sql, p.getPname(),p.getMarket_price()
				,p.getShop_price(),p.getImage(),p.getPdesc()
				,p.getIs_hot(),p.getCsid());
	}
	
	public void update(Product p) {
		String sql = "update product set pname=?, market_price=?,"
				+ "shop_price=?,image=?,pdesc=?,is_hot=?,csid=?"
				+ " where pid=?";
		DBHelper.update(sql, p.getPname(),p.getMarket_price()
				,p.getShop_price(),p.getImage(),p.getPdesc()
				,p.getIs_hot(),p.getCsid(),p.getPid());
	}

}
