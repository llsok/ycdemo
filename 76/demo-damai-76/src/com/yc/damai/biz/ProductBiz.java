package com.yc.damai.biz;

import java.util.List;

import com.yc.damai.bean.Product;
import com.yc.damai.dao.ProductDao;

public class ProductBiz {
	
	private ProductDao dao = new ProductDao();

	public List<Product> query() {
		return dao.selectAll();
	}

	public void save(Product p) throws BizException {
		
		if(p.getPname()==null || p.getPname().trim().isEmpty()){
			throw new BizException("请填写商品名称！");
		}
		
		if(p.getPid() == null || p.getPid()==0){
			dao.insert(p);
		} else {
			dao.update(p);
		}
		
	}

}
