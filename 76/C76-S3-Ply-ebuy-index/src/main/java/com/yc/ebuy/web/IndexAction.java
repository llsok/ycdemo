package com.yc.ebuy.web;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class IndexAction {

	@Resource
	IProductCategoryAction pca;

	@GetMapping({ "/", "index", "index.html" })
	public ModelAndView index(ModelAndView mav) {
		// 通过远程服务调用方式获取分类信息
		mav.addObject("pclist", pca.getPc());
		mav.setViewName("index");
		return mav;
	}

}
