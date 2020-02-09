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

import com.yc.mybatis.bean.Category;

public class CategoryMapperTest {
	
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
		List<Category> list = session.selectList("com.yc.mybatis.dao.CategoryMapper.selectAll");
		for (Category c : list) {
			System.out.println(c);
		}
	}

	@Test
	public void testCRUD() {
		/**
		 * 事务管理：
		 */
		try{
			// 查询一条不存在的记录
			Category c = session.selectOne("com.yc.mybatis.dao.CategoryMapper.selectById",6);
			// 断言 c 一定为 null
			Assert.assertNull(c);
			
			// 测试新增
			c = new Category();
			c.setId(6);
			c.setName("Java框架");
			c.setSort("1");
			c.setIntroduce("MyBatis");
			session.insert("com.yc.mybatis.dao.CategoryMapper.insert", c);
			c = session.selectOne("com.yc.mybatis.dao.CategoryMapper.selectById",6);
			Assert.assertNotNull(c);
			Assert.assertEquals("Java框架", c.getName());
			Assert.assertEquals("MyBatis", c.getIntroduce());
			
			/**
			 *  // 断言异常
			 * java.lang.AssertionError: expected null, 
			 * but was:<Category [id=6, name=Java框架, sort=1, introduce=MyBatis]>
			 */
			
			// 测试修改
			c.setName("框架");
			c.setIntroduce("Spring框架");
			session.update("com.yc.mybatis.dao.CategoryMapper.updateById", c);
			c = session.selectOne("com.yc.mybatis.dao.CategoryMapper.selectById",6);
			Assert.assertNotNull(c);
			Assert.assertEquals("框架", c.getName());
			Assert.assertEquals("Spring框架", c.getIntroduce());
			
			// 测试删除
			session.delete("com.yc.mybatis.dao.CategoryMapper.deleteById", 6);
			c = session.selectOne("com.yc.mybatis.dao.CategoryMapper.selectById",6);
			Assert.assertNull(c);
			
			// 如果成功则提交事务
			session.commit();
		} catch (Exception e){
			e.printStackTrace();
			// 如果出现异常，则回滚事务
			session.rollback();
		} finally{
			// 不管成功还是失败，都要关闭会话
			session.close();
		}
		
		
	}

}
