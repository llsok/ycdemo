package com.yc.springmvc.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringHelper {
	
	private static ApplicationContext ac;
	// 静态块什么时候执行
	static {
		ac = new ClassPathXmlApplicationContext("beans.xml");	
	}
	

	public static <T> T getBean(Class<T> class1) {
		// 创建Spring容器
		ac = new ClassPathXmlApplicationContext("beans.xml");
		return ac.getBean(class1);
	}

}
