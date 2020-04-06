package com.yc.ebuy.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.yc.ebuy.bean.EasybuyProduct;
import com.yc.ebuy.bean.EasybuyProductExample;
import com.yc.ebuy.dao.EasybuyProductMapper;

@RestController
public class ProductAction {
	
	@Resource
	private EasybuyProductMapper pm;

	/**
	 * 查询所有的商品分类信息
	 *	// 127.0.0.1:8002/getPc
	 */
	@GetMapping("getHotP")
	public List<EasybuyProduct> getPc(){
		EasybuyProductExample pce = new EasybuyProductExample();
		pce.setOrderByClause("stock desc");
		PageHelper.startPage(1, 10);
		List<EasybuyProduct> list = pm.selectByExample(pce);
		return list;
	}
	
	@GetMapping("product")
	public EasybuyProduct product(int id){
		return pm.selectByPrimaryKey(id);
	}
	
}
