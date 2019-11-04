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

import com.yc.damai.bean.Product;

public class ProductMapperTest {
	
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
	public void testSelectAll() throws IOException{
		List<Product> list = session.selectList("com.yc.damai.dao.ProductMapper.selectAll");
		System.out.println(list.size());
		System.out.println(list.get(0));
		session.close();
	}
	
	
	@Test
	public void testSelectByPid() throws IOException{
		Product p = session.selectOne("com.yc.damai.dao.ProductMapper.selectByPid", 56);
		System.out.println(p);
		session.close();
	}
	
	@Test
	public void testInsert() throws IOException{
		
		// 数据库事务管理代码：成功则提交，失败就回滚
		
		try{
			Product p = new Product();
			p.setPname("男秋装");
			p.setMarketPrice(110d);
			p.setShopPrice(90d);
			p.setImage("01.jpg");
			p.setPdesc("好衣服");
			p.setIsHot(1);
			Timestamp t = new Timestamp(System.currentTimeMillis());
			p.setPdate(t);
			int count = session.insert("com.yc.damai.dao.ProductMapper.create", p);
			
			Assert.assertEquals(1, count);
			
			// 提交
			session.commit();
			
		} catch (Exception e){
			e.printStackTrace();
			// 回滚
			session.rollback();
		} finally {
			// 关闭会话
			session.close();
		}
		
	}
	
	
	/**
	 * 作业：完成用户表（user）的增删改查测试
	 * 1、实现根据用户名对用户进行模糊查询
	 * 2、根据用户名+密码实现登录查询
	 * 3、定义增删改3个sql，分别测试，并使用事务管理
	 */
	
	
	/**
	 * MyBatis 动态SQL
	 * 
	 */
	
	@Test
	public void testSelectByObj(){
		
		session.selectList("com.yc.damai.dao.ProductMapper.selectByObj");
		
		session.selectList("com.yc.damai.dao.ProductMapper.selectByObj",null);
		
		Product p = new Product();
		
		// MyBatis 缓存机制
		session.selectList("com.yc.damai.dao.ProductMapper.selectByObj",p);
		
		p.setPname("%zs%");
		
		session.selectList("com.yc.damai.dao.ProductMapper.selectByObj",p);
		
		p.setPdesc("%好衣服%");

		session.selectList("com.yc.damai.dao.ProductMapper.selectByObj",p);
		
	}
	
	
	
	
	
	

}
