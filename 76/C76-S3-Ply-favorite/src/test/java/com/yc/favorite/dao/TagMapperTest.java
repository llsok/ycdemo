package com.yc.favorite.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TagMapperTest {
	private SqlSession session;

	// 该方法会在 Test 方法之前执行
	@Before
	public void before() throws IOException {
		// 定义mybatis配置文件路径，默认从 classpath 开始
		String resource = "mybatis.xml";
		// 读入 配置文件
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建会话工厂 bean
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		// MyBatis 的会话底层包装着 一个 JDBC 连接
		session = sqlSessionFactory.openSession();
	}

	@After
	public void after() {
		session.close();
	}

	@Test
	public void testSelectAll() throws IOException {
		TagMapper tm = session.getMapper(TagMapper.class);
		System.out.println(tm.selectAll());
	}
}
