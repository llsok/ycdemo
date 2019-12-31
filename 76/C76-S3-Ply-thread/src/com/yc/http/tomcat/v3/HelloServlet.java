package com.yc.http.tomcat.v3;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * 定义Servlet的过程
 * 1、继承 ： HttpServlet
 * 2、重写： doXXX方法
 * 3、配置: URL(注解，web.xml)
 */
public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		out.print("hello "+name+"!");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doGet(request, response);
	}
	
	

}
