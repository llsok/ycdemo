package com.yc.spring.aop;

import java.lang.reflect.Method;

import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

/**
 * Spring 实现 AOP 原则 ： 如果目标对象（被代理对象）实现了接口，使用 JDK 方式，否则就是CGLIB
 * 
 * 两种动态代理的比较：
 * 1、JDK动态代理性能优于CGLIB
 * 2、CBLIB基于继承的实现， 加了 final 关键字的方法无法被增强，无法aop
 * 
 * 作业：
 * 	实现 MyBatis 动态接口创建
 * 	SqlSession.getMapper(UserMapper.class)
 * 
 */

public class BuyProxyByCGLIB {

	public static void main(String[] args) {

		Myself myself = new Myself();

		Enhancer enhancer = new Enhancer();

		// 设置父类
		enhancer.setSuperclass(Myself.class);

		// 设置回调对象
		enhancer.setCallback(new MethodInterceptor() {
			@Override
			/**
			 * Object proxy 代理对象 Method
			 *  method 执行的方法 Object[]
			 *  args 参数数组
			 *  MethodProxy methodProxy 代理方法对象
			 */
			public Object intercept(Object proxy, Method method, Object[] args,
					MethodProxy methodProxy)
					throws Throwable {
				if (method.getName().equals("buy")) {
					System.out.println("代理人: 你托我买的东西，我买了!");
					// 执行被代理对象的方法
					//Object ret = method.invoke(myself, args);
					Object ret = methodProxy.invoke(myself, args);
					return ret;
				}
				return null;
			}
		});
		
		// 创建代理对象
		Myself other = (Myself) enhancer.create();
		
		other.buy();
		

	}

}
