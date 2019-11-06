package com.yc.damai.common;
/**
 * 将连接oracle数据库的信息设置为配置文件
 * 并使用单例设计模式获取对象
 */
import java.io.*;
import java.util.Properties;

public class MyProperties extends Properties {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static MyProperties  instance = new MyProperties();
	
	private MyProperties(){
		try {
			this.load(MyProperties.class.getClassLoader().getResourceAsStream("conn.properties"));
		} catch (IOException e) {
		}
	}
	
	public static MyProperties getInstace() {
		return instance;
	}
	
}
