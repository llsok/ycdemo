package com.yc.damai.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.yc.damai.biz.CategoryBiz;

@WebServlet("/category.s")
public class CategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryBiz biz = new CategoryBiz();
	
	
	// 查询  127.0.0.1/demo-damai-76/orders.s?op=olist
	public void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		String json = gson.toJson(biz.queryAll());
		// 返回json格式数据
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().append(json);
	}

}
