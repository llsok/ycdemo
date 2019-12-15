package com.yc.springboot.C71S3PlyBlog.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yc.springboot.C71S3PlyBlog.dao.ArticleMapper;

@Controller
public class IndexAction {

	@Resource
	private ArticleMapper am;

	@GetMapping(path = { "/", "index", "index.do" })
	public String index(Model m) {
		// 查所有记录（分页插件）
		m.addAttribute("alist", am.selectByExample(null));
		return "index";
	}

}
