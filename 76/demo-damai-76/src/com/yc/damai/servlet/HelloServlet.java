package com.yc.damai.servlet;

import java.io.IOException;
import java.util.Date;

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
 * 
 * 1、生世	==> 继承关系
 * 2、行为	==> 方法
 * 
 * 继承关系  
 * HttpServlet			抽象类
 * GenericServlet		抽象类
 * Servlet（Servlet接口）, ServletConfig（配置接口）, Serializable(序列化接口)
 * 
 * 生命周期（组件）
 * 	方法名		执行次数		描述
 * 	init()  	1次			初始化方法
 * 	service()  	N次			响应请求方法，负责请求方法调用的判断：doGet  doPost doDelete 。。。。
 * 	destroy()	1次			销毁方法
 * 
 * Servlet 运行特性：
 * 	Servlet 是一个组件，以单实例多线程方式运行
 * 
 */
public class HelloServlet extends HttpServlet{
	
	private Date now = new Date();
	
	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// 使用响应输出流输出 hello world
		resp.getWriter().print("<html><body>");
		resp.getWriter().print("<h1>hello world</h1>");
		resp.getWriter().print("<h1>"+now+"</h1>");
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
