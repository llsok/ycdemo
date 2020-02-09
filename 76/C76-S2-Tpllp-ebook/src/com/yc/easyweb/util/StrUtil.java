package com.yc.easyweb.util;

public class StrUtil {

	/*
	 * 	ÅÐ¶Ï×Ö·û´®ÊÇ·ñÎª¿Õ
	 */
	public static boolean isEmpty(String str) {
		if(null == str || "".equals(str)) {
			return true;
		}
		return false;
	}
	
	/*
	 * 	¶ÔÏó×ª»»Îª×Ö·û´®
	 */
	public static String objToString(Object obj) {
		if(obj == null) {
			return null;
		}
		return obj.toString();
	}
}
