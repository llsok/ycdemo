package com.yc.spring.bean;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudentTest {
	
	@Test
	public void testSay(){
		
		// 使用spring框架来创建一个 Hello 的对象
		
		// 创建Spring容器
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		
		// Spring容器 ac 对象 提供了一系列的 获取 bean 的方法
		Student stu1  = ac.getBean(Student.class);
		
		Assert.assertEquals("张三", stu1.getName());
		Assert.assertEquals(18, stu1.getAge());
		Assert.assertEquals(3, stu1.getGrade());
		
		// 测试电脑
		Assert.assertEquals("inter", stu1.getComputer().getCpu());
		Assert.assertEquals(16, stu1.getComputer().getMemory());
		
		//=====================================
		
		Student stu2  = (Student) ac.getBean("stu2"); 
		
		Assert.assertEquals("李四1", stu2.getName());
		Assert.assertEquals(26, stu2.getAge());
		
		// 测试电脑
		Assert.assertEquals("amd", stu2.getComputer().getCpu());
		Assert.assertEquals(8, stu2.getComputer().getMemory());
		Assert.assertEquals("围棋", stu2.getHobbys().get(3));
		
		
		// 从不同的 bean 标签定义获取的bean不同   stu1 != stu2
		Assert.assertNotEquals(stu1, stu2);
		
		Student stu1_1  = ac.getBean(Student.class);
		Student stu1_2  = ac.getBean(Student.class);
		Student stu1_3  = ac.getBean(Student.class);
		Student stu1_4  = ac.getBean(Student.class);
		
		// stu1 == stu1_1  表使用一个对象
		Assert.assertEquals(stu1, stu1_1);
		Assert.assertEquals(stu1, stu1_2);
		Assert.assertEquals(stu1, stu1_3);
		Assert.assertEquals(stu1, stu1_4);
		
		Assert.assertEquals(stu1_1, stu1_2);
		Assert.assertEquals(stu1_3, stu1_4);
		
		Student stu2_1  = (Student) ac.getBean("stu2"); 
		
		Assert.assertEquals(stu2, stu2_1);
		
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
