package com.yc.mybatis.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.AfterClass;
/*import org.junit.After;*/
import org.junit.Assert;
/*import org.junit.Before;
import org.junit.Test;*/
import org.junit.BeforeClass;

import com.yc.mybatis.bean.Cinema;
import com.yc.mybatis.bean.Hall;
import com.yc.mybatis.junit.After;
import com.yc.mybatis.junit.Before;
import com.yc.mybatis.junit.Test;


public class HallMapperTest {
	
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
		/*Hall h = session.selectOne("com.yc.mybatis.dao.HallMapper.selectById",1);
		Assert.assertEquals("3号厅", h.getName());*/
		// mybatis 使用动态代理技术，动态的生成一个接口的实现对象
		HallMapper hm = session.getMapper(HallMapper.class);
		
		Hall h = hm.selectById(1);
		Assert.assertEquals("3号厅", h.getName());
		
		Assert.assertEquals("2D", h.getHallType());
		
		
		// 获取当前影厅所属的影院对象
		Cinema c = h.getCinema();
		// MyBatis 的关联查询可以自动的查出 影院信息
		Assert.assertEquals("鑫都国际影城", c.getName());
		
	}
	
	
	/**
	 * 影院关联影厅的查询（一对多查询）
	 */
	@Test
	public void test(){
		
		CinemaMapper cm = session.getMapper(CinemaMapper.class);
		
		System.out.println("===============1==============");
		
		Cinema c = cm.selectById(4);
		
		System.out.println("================2=============");

		/**
		 * MyBatis要帮我们查出对应的影厅集合
		 */
		List<Hall> halls = c.getHalls();
		
		System.out.println("================3=============");
		
		Assert.assertEquals(4, halls.size());
		
		Assert.assertEquals("3号厅", halls.get(0).getName());
		
		Assert.assertEquals("鑫都国际影城", halls.get(0).getCinema().getName());
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
