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
	private SqlSession session1;

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
		session1 = sqlSessionFactory.openSession();
	}

	@After
	public void after() {
		session.close();
		session1.close();
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
		String[] languages = { "英语", "国语", "粤语", "法语" };
		mm.selectInLanguage(languages);
	}

	@Test
	public void testInsert() {
		MovieMapper mm = session.getMapper(MovieMapper.class);
		Movie m = new Movie();
		m.setName("终结者6");
		m.setDuration(1000);
		mm.insert(m);
		session.commit();
		/**
		 * 在 insert 完成之后，直接获取到 该 movie 记录的 id 值
		 * 需要进行必要配置
		 */
		System.out.println("=============="+m.getId());
		Assert.assertEquals(true, m.getId() > 0);
	}

	
	@Test
	public void testSelectAllWithOrder() {
		MovieMapper mm = session.getMapper(MovieMapper.class);
		mm.selectAllWithOrder(" id desc");
		System.out.println("===========================");
		mm.selectAllWithOrder(" name");
		System.out.println("===========================");
		mm.selectAllWithOrder(" duration, name desc, region desc");
		System.out.println("===========================");
		mm.selectAllWithOrder(" name");
		System.out.println("===========================");
		mm.selectAllWithOrder(" name");
		
		// 二级缓存要求，会话必须在提交之后，才能共享缓存数据
		session.commit();
		
		System.out.println("*******************************");
		MovieMapper mm1 = session1.getMapper(MovieMapper.class);
		mm1.selectAllWithOrder(" name");
		System.out.println("===========================");
		mm1.selectAllWithOrder(" name");
	}
	
	
	/**
	 * MyBatis默认启动一级缓存：一级缓存是指“同一个会话”中的缓存
	 * 
	 * 二级缓存需要  <cache> 启用，二级缓存是会话之间的换
	 *  
		Caused by: java.io.NotSerializableException: com.yc.mybatis.bean.Movie
		未序列化的类 ： Movie
		
		缓存击穿、缓存命中
		
		缓存作用
		（1）映射语句文件中的所有select 语句将会被缓存。 
		（2）映射语句文件中的所有insert、update和delete语句会刷新缓存。 
		（3）缓存会使用Least Recently Used（LRU，最近最少使用的）算法收回。 
		（4）根据时间表（如no Flush Interval，没有刷新间隔），缓存不会以任何时间顺序来刷新。 
		（5）缓存会存储列表集合或对象（无论查询方法返回什么）的1024个引用。 
		（6）缓存会被视为read/write（可读/可写）的缓存，意味着对象检索不是共享的，而且可以安全地被调用者修改，而不干扰其他调用者或线程所做的潜在修改。
		
		配置：只读、缓存大小2048、FIFO
	 */
	
	
	
	
	
	
	
	
	
	
	
	
}
