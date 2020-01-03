package com.yc.easyweb.util;

public class StrUtil {

	/*
	 * 	判断字符串是否为空
	 */
	public static boolean isEmpty(String str) {
		if(null == str || "".equals(str)) {
			return true;
		}
		return false;
	}
	
	/*
	 * 	对象转换为字符串
	 */
	public static String objToString(Object obj) {
		if(obj == null) {
			return null;
		}
		return obj.toString();
	}
}
