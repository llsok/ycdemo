package com.yc.damai.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.yc.damai.bean.Product;
import com.yc.damai.bean.Result;
import com.yc.damai.biz.BizException;
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
	
	public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalAccessException, InvocationTargetException{
		Product p = new Product();
		BeanUtils.populate(p, request.getParameterMap());
		Result result;
		try {
			biz.save(p);
			result = Result.success("保存商品成功！");
		} catch (BizException e) {
			e.printStackTrace();
			result = Result.success(e.getMessage());
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		// 返回json格式数据
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().append(json);
	}

}
