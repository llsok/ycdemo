package com.yc.spring.demo;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloTest {
	
	@Test
	public void testSay(){
		
		// 使用spring框架来创建一个 Hello 的对象
		
		// 创建Spring容器
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		
		// Spring容器 ac 对象 提供了一系列的 获取 bean 的方法
		Hello hello  = (Hello) ac.getBean("hello");  // new Hello();
		
		hello.say();
		
		((ClassPathXmlApplicationContext)ac).close();
		
	}
	
	/**
	 * 应用程序模块的 耦合 关系
	 * 
	 * 低耦合：
	 * 
	 * class UserBiz {
	 * 		private UserDao dao;
	 * 
	 *  控制反转 IOC  Inversion of control
	 *  
	 *  依赖注入 DI 
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
