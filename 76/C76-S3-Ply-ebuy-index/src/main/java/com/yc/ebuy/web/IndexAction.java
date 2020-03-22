package com.yc.ebuy.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.ebuy.bean.EasybuyProductCategoryExample;
import com.yc.ebuy.dao.EasybuyProductCategoryMapper;

@RestController
public class IndexAction {

	@Resource
	private EasybuyProductCategoryMapper pcm;

	@GetMapping({ "/", "index", "index.html" })
	public ModelAndView index(ModelAndView mav) {
		
		EasybuyProductCategoryExample pce = new EasybuyProductCategoryExample();
		pce.createCriteria().andTypeEqualTo(1);
		
		List<?> list = pcm.selectByExample(pce);
		
		mav.addObject("pclist", list);
		
		mav.setViewName("index");
		return mav;
	}

}
