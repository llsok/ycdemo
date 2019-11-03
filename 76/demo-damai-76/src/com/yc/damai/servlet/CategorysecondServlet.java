package com.yc.damai.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.yc.damai.biz.CategorysecondBiz;

@WebServlet("/categorysecond.s")
public class CategorysecondServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private CategorysecondBiz biz = new CategorysecondBiz();
	
	
	// 查询  127.0.0.1/demo-damai-76/orders.s?op=olist
	public void queryByCid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		Gson gson = new Gson();
		String json = gson.toJson(biz.queryByCid(cid));
		// 返回json格式数据
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().append(json);
	}

}
