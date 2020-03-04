package com.yc.favorite.dao;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class SpringMybatisTest {

	@Resource
	private TagMapper tm;

	@Test
	public void test1() {
		Assert.assertTrue(tm.selectAll().size() > 0);
		System.out.println(tm.selectAll());
	}

}
