package com.yc.damai.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.damai.biz.CartBiz;

@WebServlet("/cart.s")
public class CartServlet extends BaseServlet {

	private CartBiz biz = new CartBiz();
	
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("loginedUser");
		String uid = ""+user.get("uid");
		String pid = request.getParameter("pid");
		// 默认给购物车添加一件商品
		biz.addCart(uid, pid, 1);
		// 查询当前用户的购物车商品
		request.setAttribute("cartItems", biz.queryByUid(uid));
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

}
