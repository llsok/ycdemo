package com.yc.damai.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.yc.damai.bean.Category;
import com.yc.damai.bean.Categorysecond;

public class CategorysecondMapperTest {
	
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
	public void testSelectByCid() throws IOException{
		System.out.println("===========1==========");
		List<Categorysecond> list = session.selectList("com.yc.damai.dao.CategorysecondMapper.selectByCid",1);
		// 断言
		System.out.println("===========2==========");
		Assert.assertEquals(7,list.size());
		System.out.println("===========3==========");
		Assert.assertEquals("女装男装", list.get(0).getCategory().getCname());
		System.out.println("===========4==========");
		Assert.assertEquals(list.get(0).getCategory(), list.get(1).getCategory());
		
		// list.get(0).getCategory() == list.get(1).getCategory();
		
		session.close();
	}
	
}
