package com.yc.favorite.util;
import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisHelper {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		// 初始�? MyBatis 矿建
		String resource = "mybatis.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// SqlSessionFactoryBuilder 会话工厂的构建器
		// SqlSessionFactory  会话工厂
		// SqlSession   会话
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
	}
	
	public static SqlSession getSession(){
		return sqlSessionFactory.openSession();
	}

}