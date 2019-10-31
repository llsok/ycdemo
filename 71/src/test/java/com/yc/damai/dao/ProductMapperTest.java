package com.yc.damai.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.yc.damai.bean.Product;

public class ProductMapperTest {
	
	@Test
	public void testSelectAll() throws IOException{
		// 初始化 MyBatis 矿建
		String resource = "mybatis.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// SqlSessionFactoryBuilder 会话工厂的构建器
		// SqlSessionFactory  会话工厂
		// SqlSession   会话
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> list = session.selectList("com.yc.damai.dao.ProductMapper.selectAll");
		System.out.println(list.size());
		
		System.out.println(list.get(0));
	}

}
