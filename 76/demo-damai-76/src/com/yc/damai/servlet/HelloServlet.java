package com.yc.damai.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
/**
 * X 扩展  未知   javax JavaEE 提供的类
 */
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 定义 Sevlet 步骤
 * 1、继承 HttpServlet
 * 2、重写 doXXX
 * 3、配置： 给Servlet定义一个访问的路径，并且路径必须以 / 开头
 * 		web.xml 配置
 * 		注解  配置
 */
public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// 使用响应输出流输出 hello world
		resp.getWriter().print("<html><body>");
		resp.getWriter().print("<h1>hello world</h1>");
		resp.getWriter().print("</body></html>");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doXXX 方法中的 super。。。 必须删除
		// super.doPost(req, resp);
	}

}
