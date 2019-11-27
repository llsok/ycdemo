package com.yc.springmvc.servlet;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.springmvc.biz.ProductBiz;
import com.yc.springmvc.biz.UserBiz;
import com.yc.springmvc.util.SpringHelper;

/**
 * Spring 容器如何初始化？
 * 
 */
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource
	private UserBiz ubiz = SpringHelper.getBean(UserBiz.class);
	
	private ProductBiz pbiz = SpringHelper.getBean(ProductBiz.class);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
