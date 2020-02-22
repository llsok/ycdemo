package com.yc.junit;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.yc.reflect.Demo;
import com.yc.reflect.SubDemo;

@Test(value = "test", type = 100)
public class AnnoTest {
	@Test("play")
	public void play() {
		System.out.println("======play======");
	}

	@Test("eat")
	public void eat() {
		System.out.println("======eat======");
	}

	@Test("run")
	public void run() {
		System.out.println("======run======");
	}

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		System.out.println(Demo.class.getAnnotation(Test.class));
		System.out.println(SubDemo.class.getAnnotation(Test.class));

		AnnoTest annoTest = AnnoTest.class.newInstance(); // ==new AnnoTest();

		Method[] methods = AnnoTest.class.getMethods();

		for (Method method : methods) {
			if (method.getAnnotation(Test.class) != null) {
				method.invoke(annoTest);
			}
		}
	}
}
