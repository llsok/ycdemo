package com.yc.junit;

import java.lang.reflect.InvocationTargetException;

public class MyJunitTest {
	@Before
	public void prepare() {
		System.out.println("before:所有的测试方法之前都要执行这个方法");
	}
	@After
	public void After() {
		System.out.println("after:所有方法测试之后都要执行这个的方法");
	}
	@Test("eat")
	public void eat() { 
		System.out.println("===恰饭===");
	}
	@Test("run")
	public void run() { 
		System.out.println("===跑步===");
	}
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InterruptedException {
		ParseJunit pj=new ParseJunit();
		pj.parseMethod(MyJunitTest.class);
	}
	
}
