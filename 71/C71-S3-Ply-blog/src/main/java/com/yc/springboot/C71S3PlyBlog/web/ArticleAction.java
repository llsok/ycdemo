package com.yc.springboot.C71S3PlyBlog.web;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.yc.springboot.C71S3PlyBlog.bean.Article;
import com.yc.springboot.C71S3PlyBlog.bean.User;
import com.yc.springboot.C71S3PlyBlog.biz.ArticleBiz;
import com.yc.springboot.C71S3PlyBlog.biz.BizException;
import com.yc.springboot.C71S3PlyBlog.biz.UserBiz;
import com.yc.springboot.C71S3PlyBlog.vo.Result;


@RestController
public class ArticleAction {
	
	@Resource
	private ArticleBiz aBiz;
	
	@PostMapping("addArticle")
	public ModelAndView add(Article a, 
			@SessionAttribute("loginedUser") User user,
			Errors errors, Model m){
		a.setAuthor(user.getName());
		aBiz.addArticle(a);
		// 响应重定向
		return new ModelAndView("redirect:article?id="+a.getId());
	}
	
	@GetMapping("toaddArticle")
	public ModelAndView toadd(){
		return new ModelAndView("article_add");
	}
	
}
