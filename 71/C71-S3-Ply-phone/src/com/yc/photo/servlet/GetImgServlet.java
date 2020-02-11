package com.yc.photo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet 创建的步骤：
 * 	1、继承 HttpServlet
 * 	2、实现 doXXX
 * 	3、配置 注解、web.xml
 */
@WebServlet("/getImg.do")
public class GetImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("hello world!");
	}

}
