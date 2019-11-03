package com.yc.damai.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.yc.damai.bean.Category;

public class CategoryMapperTest {
	
	private SqlSession session;
	
	@Before
	public void before() throws IOException{
		// 初始化 MyBatis 矿建
		String resource = "mybatis.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// SqlSessionFactoryBuilder 会话工厂的构建器
		// SqlSessionFactory  会话工厂
		// SqlSession   会话
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		session = sqlSessionFactory.openSession();
	}
	
	@Test
	public void testSelectById() throws IOException{
		Category c = session.selectOne("com.yc.damai.dao.CategoryMapper.selectById",1);
		
		Assert.assertEquals("女装男装", c.getCname());
		Assert.assertEquals(7,c.getCsItems().size());
		Assert.assertEquals("潮流女装", c.getCsItems().get(0).getCsname());
		
		session.close();
	}
	
}
