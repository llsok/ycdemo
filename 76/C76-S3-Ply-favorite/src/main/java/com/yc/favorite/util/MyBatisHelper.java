package com.yc.favorite.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisHelper {

	private static SqlSessionFactory sqlSessionFactory;

	// 静态块
	static {
		// 定义mybatis配置文件路径，默认从 classpath 开始
		String resource = "mybatis.xml";
		// 读入 配置文件
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// 异常转型，抛出运行期异常
			throw new RuntimeException(e);
		} finally {
			try {
				if (inputStream != null)
					inputStream.close();
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	public static SqlSession openSession() {
		return sqlSessionFactory.openSession();
	}

}
