package com.yc.ebuy.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.ebuy.bean.EasybuyProductCategory;
import com.yc.ebuy.bean.EasybuyProductCategoryExample;
import com.yc.ebuy.dao.EasybuyProductCategoryMapper;

@RestController
public class ProductCategoryAction {
	
	@Resource
	private EasybuyProductCategoryMapper pcm;

	/**
	 * 查询所有的商品分类信息
	 *	// 127.0.0.1:8002/getPc
	 */
	@GetMapping("getPc")
	public List<EasybuyProductCategory> getPc(){
		EasybuyProductCategoryExample pce = new EasybuyProductCategoryExample();
		pce.createCriteria().andTypeEqualTo(1);
		List<EasybuyProductCategory> list = pcm.selectByExample(pce);
		return list;
	}
	
	@GetMapping("test")
	public String test() {
		return "back test";
	}

}
