package com.yc.reflect;

//反射类
import java.lang.reflect.*;
import java.util.HashMap;

public class Demo {
	private String name;
	private String sn;
	private int age;
	
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	
	
	private static void action1(Object obj) throws NoSuchMethodException, SecurityException {
		//通过反射获取属性和方法
		Method m;
		m=obj.getClass().getMethod("setName", String.class);
	}
	public static void action(Object obj) throws NoSuchFieldException, SecurityException {
		//通过反射获取属性和方法
		Field f;
		f=obj.getClass().getDeclaredField("name");  //根据名字获取类的属性
		Field[] fs=obj.getClass().getDeclaredFields();   //获取类的定义的所有属性
		//obj.getClass().getField(name);   //获取指定的公有属性
		//obj.getClass().getFields();  //获取所有的共有属性
	}
}


