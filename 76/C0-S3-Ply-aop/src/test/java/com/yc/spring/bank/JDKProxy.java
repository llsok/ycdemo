package com.yc.spring.bank;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * AOP 动态代理的实现方式：
 * 	1、Java官方实现方式：JDK动态代理
 * 		要求目标对象必须实现业务接口，基于动态接口实现方式
 *	2、CGLIB动态代理
 *		不需要接口，基于继承的方式实现
 */
public class JDKProxy implements InvocationHandler{
	
	// 目标对象，真实主题
	private Object targetObject;

	/**
	 * 调用目标对象方法，当目标对象的方法执行时，那么就会执行当前方法
	 * proxy 	代理对象
	 * method 	执行的方法
	 * args   	参数数组
	 */
	@Override
	public Object invoke(Object proxy, Method method, Object[] args) 
			throws Throwable {
		System.out.println(" 准备好玩具 ===" + method.getName());
		Object ret = method.invoke(targetObject, args);
		System.out.println(" 收拾好玩具 ===" + ret);
		return ret;
	}
	/**
	 * 生成代理对象
	 * @param targetObject
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <E> E buildProxy(E targetObject) {
		this.targetObject = targetObject;
		/**
		 * loader 		目标对象的类加载器
		 * interfaces 	目标对象实现的所有接口数组
		 * h
		 */
		return (E) Proxy.newProxyInstance(
				targetObject.getClass().getClassLoader(), 
				targetObject.getClass().getInterfaces(), 
				this);
	}
	
	/**
	 * 使用 jdk 提供的  InvocationHandler（接口）、Proxy（工具类） 实现动态接口实现
	 */
	
	public static void main(String[] args) {
		// 真实主题==》被代理对象
		A real1 = new Real();
		
		JDKProxy jdkProxy = new JDKProxy();
		A real2 = jdkProxy.buildProxy(real1);
		
		real2.play();
	}
	

}
