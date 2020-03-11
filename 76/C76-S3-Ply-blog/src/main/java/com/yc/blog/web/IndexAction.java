package com.yc.blog.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yc.blog.bean.Article;
import com.yc.blog.dao.ArticleMapper;

@Controller
public class IndexAction {

	@Resource
	private ArticleMapper am;
	
	@GetMapping({"/","index","index.html"})
	public String index(@RequestParam(defaultValue="1") Integer page, Model m) {
		Page<Article> pg = PageHelper.startPage(page, 5);
		// PageHelper.startPage 必须在你的查询方法前一行代码执行
		am.selectByExampleWithBLOBs(null);
		m.addAttribute("alist", pg);
		return "index";
	}
	
	@GetMapping({"article"})
	public String article(Integer id, Model m) {
		Article a = am.selectByPrimaryKey(id);
		m.addAttribute(a);
		return "article";
	}
	
}
