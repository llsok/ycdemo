package com.yc.damai.biz;

import java.util.List;

import com.yc.damai.bean.Product;
import com.yc.damai.dao.ProductDao;

public class ProductBiz {
	
	private ProductDao dao = new ProductDao();

	public List<Product> query() {
		return dao.selectAll();
	}

}
