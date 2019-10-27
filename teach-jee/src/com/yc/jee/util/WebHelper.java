package com.yc.jee.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class WebHelper {

	public static void executeSqlAtJsp(String pathname, ServletContext application)
			throws UnsupportedEncodingException {
		executeSqlAtJsp(pathname, null, application);
	}

	public static void executeSqlAtJsp(String filename, HttpServletRequest request, ServletContext application)
			throws UnsupportedEncodingException {
		String path = filename;
		if (request != null && filename.startsWith("/") == false) {
			path = request.getServletPath();
			path = path.substring(0, path.lastIndexOf("/") + 1);
			path += filename;
		}
		path = URLDecoder.decode(path, "utf-8");
		path = application.getRealPath(path);
		DBHelper.executeByFile(path);
	}

}
