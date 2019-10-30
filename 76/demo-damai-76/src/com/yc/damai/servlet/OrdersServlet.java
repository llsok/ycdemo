package com.yc.damai.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.yc.damai.bean.Result;
import com.yc.damai.bean.Orders;
import com.yc.damai.biz.BizException;
import com.yc.damai.biz.OrdersBiz;
import com.yc.damai.util.DBHelper;

@WebServlet("/orders.s")
public class OrdersServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private OrdersBiz biz = new OrdersBiz();
	
	
	// 查询  127.0.0.1/demo-damai-76/orders.s?op=olist
	public void olist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getSession().getId());
		@SuppressWarnings("unchecked")
		Map<String,Object> user = (Map<String, Object>) request.getSession().getAttribute("loginedUser");
		// 有风险 
		Integer uid = (Integer) user.get("uid");
		List<Orders> list = biz.queryByUid(uid.longValue());
		request.setAttribute("olist", list);
		request.getRequestDispatcher("olist.jsp").forward(request, response);
	}

}
