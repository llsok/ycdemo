package com.yc.photo.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
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
 * 
 * 应用上下文对象 ServletContext
 * 1、生命周期长：与服务器共存亡
 * 2、作用域广
 */
@WebServlet("/getImg.do")
public class GetImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		/**
		 * 1、读取到所有的图片文件
		 * 2、循环生成html代码
		 */
		String webpath = "/images/fulls";
		// 获取应用上下文对象
		ServletContext application = this.getServletContext();
		// 将web路径转成磁盘路径
		String diskpath = application.getRealPath(webpath);
		// 创建文件对象
		File dir = new File(diskpath);
		System.out.println(dir);
		// 获取文件夹下所有的文件
		String[] filenameArray = dir.list();
		String s = "<article class=\"thumb\">\n" +
				"	<a href=\"images/fulls/%s\" class=\"image\">\n" +
				"		<img src=\"images/fulls/%s\" alt=\"\" />\n" +
				"	</a>\n" +
				"	<h2>照片名</h2>\n" +
				"	<p>照片介绍</p>\n" +
				"</article>";
		// 1   StringBuilder 单线程效率高     2  StringBuffer
		for(String filename : filenameArray) {
			String ss = String.format(s, filename, filename);
			response.getWriter().append(ss);
		}
		
	}

}
