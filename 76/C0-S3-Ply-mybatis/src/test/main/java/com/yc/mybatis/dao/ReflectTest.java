package com.yc.mybatis.dao;

import java.lang.reflect.*;
import java.util.Date;

import com.yc.mybatis.bean.Movie;

public class ReflectTest {

	public static void main(String[] args) throws Exception {
		Movie m = new Movie();
		
		// 多态性 ==》引用转型（父类指向子类对象）
		Object o = m;
		System.out.println(o == m);
		
		// 通过反射来获取类的成员对象：属性、方法、构造方法、块、内部类
		
		// 获取类对象：Class：1、class 关键字；2、使用getClass()；3、使用Class.forName()
		System.out.println(Movie.class);
		System.out.println(o.getClass());
		System.out.println(Class.forName("com.yc.mybatis.bean.Movie"));
		
		@SuppressWarnings("unchecked")
		Class<Movie> cls = (Class<Movie>) o.getClass();
		
		/**
		 * 带   Declared 表示在当前类"定义"的属性、方法
		 * 不带Declared 表示是一个共有的属性、方法
		 */
		// 属性
		Field nameFiled = cls.getDeclaredField("name");
		Field[] f2= cls.getDeclaredFields();
		//Field f3 = cls.getField("name");
		Field[] f4 =cls.getFields();
		
		// 方法对象
		Method getNameMethod = cls.getDeclaredMethod("getName");
		Method setNameMethod = cls.getDeclaredMethod("setName", String.class);
		cls.getDeclaredMethods();
		cls.getMethod("setName", String.class);
		cls.getMethods();
		
		// 构造方法对象
		Constructor<Movie> c1 = cls.getConstructor();
		cls.getConstructors();
		cls.getDeclaredConstructor();
		cls.getDeclaredConstructors();
		
		// 获取属性类型
		System.out.println(nameFiled.getType());
		
		/*System.out.println(A.class.getDeclaredField("name"));
		System.out.println(B.class.getDeclaredField("name"));*/
		
		// System.out.println(A.class.getField("name"));
		
		System.out.println("=================获取设置属性、调用方法、构造函数创建对象=====================");
		/**
		 * 获取设置属性、调用方法、构造函数创建对象
		 */
		// 设置成员的可见性，临时的将属性或方法设置为 public
		
		// 调用构造函数
		m = c1.newInstance();
		
		nameFiled.setAccessible(true);
		nameFiled.set( m, "终结者6");
		Object nameValue = nameFiled.get(m);
		
		// 执行方法
		setNameMethod.invoke( m, "少年派的奇幻旅行");
		// 第二个参数是  可变参数数组
		nameValue = getNameMethod.invoke( m );
		
		/**
		 * Exception in thread "main" java.lang.IllegalAccessException: 
		 * Class com.yc.mybatis.dao.ReflectTest can not access a member of 
		 * class com.yc.mybatis.bean.Movie with modifiers "private"
		 * 私有属性不可访问
		 * at com.yc.mybatis.dao.ReflectTest.main(ReflectTest.java:61)
		 */
		System.out.println(nameValue);
		
		/**
		 * 请使用构造函数对象创建电影对象，然后进行属性取值、方法的调用
		 */
		
	}
	

}

class A {
	String name;
	int age;
	
	void eat() {}
	void eat(int a) {}
}

class B extends A{
	Date birthday;

	@Override
	void eat() {
		super.eat();
	}
	
}












