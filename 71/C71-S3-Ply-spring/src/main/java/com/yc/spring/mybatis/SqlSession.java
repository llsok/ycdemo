package com.yc.spring.mybatis;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class SqlSession implements InvocationHandler {
	
	@SuppressWarnings("unchecked")
	public <T> T getMapper(Class<T> cls){
		// 使用 JDK 动态代理创建对象
		return (T) Proxy.newProxyInstance(cls.getClassLoader()
				, new Class[]{cls}
				, this);
	}

	@Override
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		
		// 读取方法的注解，以执行 select 或 update方法
		
		// 使用 DBHelper 执行 sql
		
		System.out.println(method.getName());
		return null;
	}

}
