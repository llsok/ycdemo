package com.yc.damai.biz;

import java.util.List;

import com.yc.damai.bean.Categorysecond;
import com.yc.damai.dao.CategorysecondDao;

public class CategorysecondBiz {
	
	private CategorysecondDao dao = new CategorysecondDao();
	
	public List<Categorysecond> queryByCid(String cid){
		return dao.selectByCid(cid);
	}

}
