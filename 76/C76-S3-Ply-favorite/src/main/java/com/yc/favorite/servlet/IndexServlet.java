package com.yc.favorite.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.yc.favorite.bean.Tag;
import com.yc.favorite.dao.TagMapper;
import com.yc.favorite.util.MyBatisHelper;

public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/**
		 * 1、使用MyBatis 查找所有的 Tag
		 * 2、将标签推送给页面
		 */
		SqlSession session = MyBatisHelper.openSession();
		try {
			TagMapper tm = session.getMapper(TagMapper.class);
			List<Tag> list = tm.selectAll();
			request.setAttribute("tList", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} finally {
			session.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
