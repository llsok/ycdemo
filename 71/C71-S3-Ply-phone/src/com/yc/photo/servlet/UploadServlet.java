package com.yc.photo.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("file");
		String filename = part.getSubmittedFileName();
		
		/**
		 * 上传图片到 展示目录下
		 */
		String webpath = "/images/fulls";
		// 获取应用上下文对象
		ServletContext application = this.getServletContext();
		// 将web路径转成磁盘路径
		String diskpath = application.getRealPath(webpath);
		
		part.write(diskpath + "/" +filename);
		
		response.getWriter().append("success");
		
	}

}
