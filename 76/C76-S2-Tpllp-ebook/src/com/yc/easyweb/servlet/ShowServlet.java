package com.yc.easyweb.servlet;

/**
 * 综合信息展示的servlet
 */
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.*;
import com.yc.easyweb.biz.*;

public class ShowServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	private BookBiz bookBiz = new BookBiz();
	private Result result;

	/*
	 * 用户index页面信息展示
	 */
	public void queryUserIndex(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			String btid1 = request.getParameter("btid1");
			String btid2 = request.getParameter("btid2");
			// 书籍展示
			BookChild book = new BookChild();
			book.setBstate(1);
			Book book2 = new Book();
			book2.setBstate(1);
			Page<Book> pPageTeach = new Page<Book>();
			Page<Book> pPageTool = new Page<Book>();
			int j = 1;
			int i = 1;
			// 教材区
			if (!btid1.equals("0")) {
				book.setBtid(Long.parseLong(btid1));
				pPageTeach = bookBiz.bookPage(1, 12, book);
				session.setAttribute("teachBook", pPageTeach.getData());
				session.setAttribute("teachPage", pPageTeach);
				if (pPageTeach.getData().size() == 0) {
					i = 0;
				}
			}
			// 工具书区
			if (!btid2.equals("0")) {
				book2.setBtid(Long.parseLong(btid2));
				pPageTool = bookBiz.bookPage(1, 7, book2);
				session.setAttribute("toolBook", pPageTool.getData());
				session.setAttribute("toolPage", pPageTool);
				if (pPageTool.getData().size() == 0) {
					j = 0;
				}
			}
			if (i == 0 && j == 0) {
				result = Result.failure("暂无数据！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("数据已加载！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);

			}
			e.printStackTrace();
		}
	}

	// 退出系统
	public void quit(HttpServletRequest request, HttpServletResponse response) {
		// 销毁会话对象
		request.getSession().invalidate();
		result = Result.success("");
		String json = gson.toJson(result);
		response.setContentType("application/json;charset=UTF-8");
		try {
			response.getWriter().append(json);
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
	}

	// 用户已发布的书籍显示
	public void userPublishedBookShow(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User userOld = (User) session.getAttribute("loginedUser");
		Book userBook = new Book();
		String page1 = request.getParameter("page");
		int ipage;
		Page<Book> page;
		try {
			if (page1 != null && !page1.isEmpty()) {
				ipage = Integer.parseInt(page1);
			} else {
				ipage = 1;
			}
			if (userOld.getUid() != 0) {
				userBook.setUid(userOld.getUid());
				page = bookBiz.bookPage(ipage, 5, userBook);
			} else {
				userBook.setUid(0);
				page = bookBiz.bookPage(ipage, 5, userBook);
			}
			session.setAttribute("userBookPage", page);

			if (page.getData().size() > 0) {
				result = Result.success("查询成功！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("暂无数据！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		}
	}
}
