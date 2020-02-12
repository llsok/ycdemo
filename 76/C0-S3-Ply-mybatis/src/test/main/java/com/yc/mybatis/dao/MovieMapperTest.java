package com.yc.mybatis.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.yc.mybatis.bean.Cinema;
import com.yc.mybatis.bean.Hall;
import com.yc.mybatis.bean.Movie;

public class MovieMapperTest {

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
		MovieMapper mm = session.getMapper(MovieMapper.class);
		List<Movie> list = mm.selectAll();
		Assert.assertEquals(23, list.size());
	}

	@Test
	public void testSelectByMovie() throws IOException {
		MovieMapper mm = session.getMapper(MovieMapper.class);
		mm.selectByMovie(null);
		Movie m = new Movie();
		mm.selectByMovie(m);
		m.setName("少年派");
		mm.selectByMovie(m);
		m.setRegion("美国");
		mm.selectByMovie(m);
		m.setLanguage("英语");
		mm.selectByMovie(m);
	}
	/**
	 * org.apache.ibatis.exceptions.PersistenceException: 
 	Parameter 'flag' not found. Available parameters are [arg1, arg0, param1, param2]
	 */
	@Test
	public void testSelectByFlag() throws IOException {
		MovieMapper mm = session.getMapper(MovieMapper.class);
		mm.selectByFlag("少年", "1");
		mm.selectByFlag("少年", "2");
		mm.selectByFlag("少年", "3");
		mm.selectByFlag("少年", "4");	
	}
	
	@Test
	public void testUpdate() {
		MovieMapper mm = session.getMapper(MovieMapper.class);
		Movie m = mm.selectById(1);
		mm.update(m);
		m.setName(null);
		mm.update(m);
		m.setRegion(null);
		mm.update(m);
		m.setDuration(null);
		mm.update(m);
	}
	
	/**
	 * org.apache.ibatis.exceptions.PersistenceException: 
		Parameter 'languages' not found. Available parameters are [array]
		
		MyBatis 认为 数组和集合也属于多参数，也需要加参数名注解
	 */
	@Test
	public void testSelectInLanguage() {
		MovieMapper mm = session.getMapper(MovieMapper.class);
		String[] languages = {"英语","国语","粤语","法语"};
		mm.selectInLanguage(languages);
	}
}
