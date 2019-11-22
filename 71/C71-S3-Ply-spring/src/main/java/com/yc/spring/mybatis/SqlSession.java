package com.yc.spring.mybatis;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Proxy;

public class SqlSession implements InvocationHandler {

	@SuppressWarnings("unchecked")
	public <T> T getMapper(Class<T> cls) {
		// 使用 JDK 动态代理创建对象
		return (T) Proxy.newProxyInstance(cls.getClassLoader(), new Class[] { cls }, this);
	}

	@Override
	/**
	 * 作业：
	 * 		请完成该方法，实现通过对 method 上注解的读取，完成对应的SQL操作
	 * 要求：
	 * 		1、根据实体类创建 student 表，包含：sn、name、age、grade 4个字段
	 * 		2、使用 DBHelper 执行SQL
	 * 		3、使用反射获取 SQL语句
	 * 		4、解析语句中的命名参数，根据参数名从 Java 的方法参数中获取 SQL 参数值
	 * 		5、通过反射获取返回结果类型，将结果集按照返回类型返回
	 * 		6、完成 StudentMapperTest.test() 方法的单元测试，并测试通过
	 * 		7、注意：selectAll 返回的是泛型集合，泛型类型请通过下面的 getGenericReturnType() 返回获取
	 */
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		System.out.println("当前执行的是：" + method.getName());
		return null;
	}

	/**
	 * 返回一个方法的返回值的泛型类型
	 * 	例如：将 public List<Student> selectAll(); 方法对象 method 传入，将返回 Student 类对象 
	 */
	public static Class<?> getGenericReturnType(Method method) {
		ParameterizedType type = (ParameterizedType) method.getGenericReturnType();
		try {
			return Class.forName(type.getActualTypeArguments()[0].getTypeName());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

}
