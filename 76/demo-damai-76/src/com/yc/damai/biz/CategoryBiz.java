package com.yc.damai.biz;

import java.util.List;

import com.yc.damai.bean.Category;
import com.yc.damai.dao.CategoryDao;

public class CategoryBiz {
	
	private CategoryDao dao = new CategoryDao();
	
	public List<Category> queryAll(){
		return dao.selectAll();
	}

}
