package com.yc.easyweb.common;

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
