package com.yc.springboot.C71S3PlyBlog.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.springboot.C71S3PlyBlog.bean.Article;
import com.yc.springboot.C71S3PlyBlog.dao.ArticleMapper;

@Service
public class ArticleBiz {
	
	@Resource
	private ArticleMapper am;
	
	public void addArticle(Article a){
		am.insert(a);
	}

}
