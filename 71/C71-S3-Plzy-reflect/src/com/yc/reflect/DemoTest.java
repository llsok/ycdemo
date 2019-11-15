package com.yc.reflect;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;

public class DemoTest {
	public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException, NoSuchMethodException, SecurityException, InvocationTargetException {
		Demo d= new Demo();
		d.setName("张三");
		//action(d);
		
		Demo e=new SubDemo();
		e.setName("李四");
		//action1(d);
		
		d.setAge(18);
		d.setSn("123456");
		
		//将对象转成map
		toMap(d,new HashMap<String,Object>());
		
	}
	public static void toMap(Object obj, HashMap<String, Object> map) throws IllegalArgumentException, IllegalAccessException, NoSuchMethodException, SecurityException, InvocationTargetException {
		Field[] fs=obj.getClass().getDeclaredFields();
		
		for(Field f:fs) {
			//获取私有属性方法一：
			//f.setAccessible(true);
			//获取当前属性值
			//Object value=f.get(obj);
			
			//获取私有属性方法二：
			//通过属性方法来获取（设置）属性值
			//f.getType(); //getType() 用于返回属性的类型    name=>> Stirng   age==>>Integer
			String getMethodName = "get"+f.getName().substring(0,1).toUpperCase()+f.getName().substring(1);
			Method getMethod=obj.getClass().getMethod(getMethodName);
			// invoke 实行方法的方法
			Object value = getMethod.invoke(obj); //obj.getXxxxx();
			//获取属性名
			String name=f.getName();
			map.put(name, value);
			
//			//获取当前属性的值
//			Object value = f.get(obj);
//			//获取属性名
//			String name = f.getName();
//			map.put(name,value);
			
			
		}
		System.out.println(map);
	}
}
