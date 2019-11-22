package com.yc.spring.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

// Buy 动态代理
/**
 * 
 * 动态代理的方式
 * 1、实现接口方式	JDK 动态代理
 * 2、继承方式		CGLIB 动态代理
 *
 */
public class BuyProxyByJDK implements InvocationHandler{
	
	private Object proxyObject; // 被代理对象
	
	/**
	 * 代理方法，传入被代理对象，返回一个动态的代理对象
	 * @param proxyObject
	 * @return
	 */
	public Object proxy(Object proxyObject){
		this.proxyObject = proxyObject;
		// 动态创建一个代理对象
		/**
		 * ClassLoader 类加载器
		 * interfaces	接口数组
		 * h 			实现 InvocationHandler 接口的对象
		 */
		return Proxy.newProxyInstance(proxyObject.getClass().getClassLoader()
				, proxyObject.getClass().getInterfaces()
				, this);
	}
	
	@Override
	/**
	 * Object proxy 代理对象
	 * Method method 当前执行的方法
	 * Object[] args 执行当前方法所传入的参数
	 * return Object 当前方法的返回值
	 */
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		
		if(method.getName().equals("buy")){
			System.out.println("代理人: 你托我买的东西，我买了!");
			// 执行被代理对象的方法
			Object ret = method.invoke(proxyObject, args);
			return ret;
		}

		return null;
	}
	
	public static void main(String[] args) {
		
		Myself myself = new Myself();
		
		BuyProxyByJDK buyProxy = new BuyProxyByJDK();
		
		// 必须使用 Myself 的实现的接口来接受返回值
		Buy other = (Buy) buyProxy.proxy(myself);
		
		// 不能使用类对象接收 动态代理对象
		// Myself other  = (Myself) buyProxy.proxy(myself);
		
		other.buy();
		
	}

}
