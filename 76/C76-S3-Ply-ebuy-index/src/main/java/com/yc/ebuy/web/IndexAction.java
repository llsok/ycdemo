package com.yc.ebuy.web;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.ebuy.dao.EasybuyProductCategoryMapper;

@RestController
public class IndexAction {

	@Resource
	private EasybuyProductCategoryMapper pcm;

	@GetMapping({ "/", "index", "index.html" })
	public ModelAndView index(ModelAndView mav) {
		mav.setViewName("index");
		return mav;
	}

}
