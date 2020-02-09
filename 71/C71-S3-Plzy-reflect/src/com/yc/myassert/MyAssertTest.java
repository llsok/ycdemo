package com.yc.myassert;

import java.lang.reflect.InvocationTargetException;

import com.yc.junit.After;
import com.yc.junit.Before;
import com.yc.junit.ParseJunit;
import com.yc.junit.Test;

public class MyAssertTest {
	@Before
	public void prepare() {
		System.out.println("=====prepare=====");
	}

	@After
	public void After() {
		System.out.println("=====after=====");
	}

	@Test("run")
	public void run() {
		System.out.println("======run======");
		MyAssert.assertEquals("1", "2");
	}
	@Test("eat")
	public void eat() {
		System.out.println("======eat======");
		MyAssert.assertNotNullEquals(null);
	}
	@Test("talk")
	public void talk() {
		System.out.println("======talk======");
		MyAssert.assertNotNullEquals("123");
	}
	@Test("read")
	public void read() {
		System.out.println("======read======");
		MyAssert.assertEquals("1", "1");
	}
	
	@Test("sleep")
	public void sleep() {
		System.out.println("======sleep======");
		MyAssert.assertTrue(false);
	}
	
	public static void main(String[] args)  {
		ParseJunit pj=new ParseJunit();
		new Thread(new Runnable() {
			public void run() {
				try {
					pj.parseMethod(MyAssertTest.class);
				} catch (InstantiationException | IllegalAccessException | IllegalArgumentException|InterruptedException  e) {
					
					e.printStackTrace();
				} 
			}
		}).start();
		
	}
}
