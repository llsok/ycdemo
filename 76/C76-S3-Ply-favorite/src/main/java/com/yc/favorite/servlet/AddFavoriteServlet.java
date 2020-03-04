package com.yc.favorite.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.favorite.bean.Favorite;
import com.yc.favorite.biz.FavoriteBiz;

//@WebServlet("/saveFavorite.s")
public class AddFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FavoriteBiz fBiz = new FavoriteBiz();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Favorite f = new Favorite();
		f.setfLabel(request.getParameter("fLabel"));
		f.setfUrl(request.getParameter("fUrl"));
		f.setfTags(request.getParameter("fTags"));
		f.setfDesc(request.getParameter("fDesc"));
		
		try {
			fBiz.addFavorite(f);
			// 响应重定向
			response.sendRedirect("index.s");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "添加失败，请联系客服");
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
