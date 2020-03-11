package com.yc.blog;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.util.Assert;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yc.blog.bean.Article;
import com.yc.blog.bean.ArticleExample;
import com.yc.blog.bean.ArticleExample.Criteria;
import com.yc.blog.dao.ArticleMapper;
import com.yc.blog.dao.UserMapper;


@SpringBootTest
class BlogApplicationTests {
	
	@Resource
	private UserMapper um;
	
	@Resource
	private ArticleMapper am;

	@Test
	void contextLoads() {
		Assert.isTrue(um.selectByExample(null).size() > 0, "结果集数量不正确!");
		// 如何使用组合条件查询
		// careatetime is not null and title like '%css%'
		ArticleExample ae = new ArticleExample();
		Criteria c = ae.createCriteria();
		c.andCreatetimeIsNotNull();
		c.andTitleLike("%css%");
		List<Article> list = am.selectByExample(ae);
		System.out.println(list);
	}
	
	@Test
	void test1() {
		// PageHelper 分页查询
		Page<Article> page = PageHelper.startPage(1, 5);
		// 不带条件的查询
		am.selectByExample(null);
		
		/*for (Article article : list) {
			System.out.println(article.getTitle());
		}*/
		
		for (Article article : page) {
			System.out.println(article.getTitle());
		}
		// page 是分页查询对象, 包含分页属性
		page.getPageNum();
		page.getPageSize();
		
	}

}
