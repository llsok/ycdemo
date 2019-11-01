package com.yc.damai.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yc.damai.bean.Product;
import com.yc.damai.biz.ProductBiz;

@WebServlet("/product.s")
public class ProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductBiz biz = new ProductBiz();
    
	/**
	 * 127.0.0.1/demo-damai-76/product.s?op=query
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void query(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<Product> list = biz.query();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

}
