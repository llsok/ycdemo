package com.yc.damai.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义的Servlet基类
 */
public abstract class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 通过op参数决定调用的方法
		String op = request.getParameter("op");
		
		// 根据 op 来执行 子类 的 业务方法 ， java 反射：动态执行java方法
		// 获取类对象
		Class<?> cls = this.getClass();
		try {
			// Method java 方法对象
			Method m = cls.getMethod(op, HttpServletRequest.class, HttpServletResponse.class);
			// 通过 java 的反射机制， 动态执行方法
			m.invoke(this, request, response);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
