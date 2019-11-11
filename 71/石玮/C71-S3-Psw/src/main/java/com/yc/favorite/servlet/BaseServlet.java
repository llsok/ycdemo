package com.yc.favorite.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.lang.reflect.Method;

public abstract class BaseServlet extends HttpServlet{
	private static final long serialVersionUID=1L;
	/**
	 * 
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = req.getParameter("op");
		
		//在父类中通过op字段调用子类的方法，JAVA黑科技---反射
		//Class 类的类，可以动态的调用方法，获取属性
		try {
			Method method=this.getClass().getMethod(op, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this,req,resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ServletException("调用动态方法失败	"+op,e);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}

