package com.yc.damai.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.damai.util.DBHelper;

@WebServlet("/dologin.s")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置请求对象的字符集编码，可以兼容中文参数，避免乱码问题
		request.setCharacterEncoding("utf-8");
		// 接收 用户名 和 密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sql = "select * from user where username=? and password=?";
		Map<String, Object> user = DBHelper.selectOne(sql, username, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginedUser", user);
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("msg", "用户名或密码错误！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 绝大多数请求下， get 请求和 post 执行的业务逻辑是一致的
		doGet(request, response);  // 必须有
		
		//doXXX 方法中的 super。。。 必须删除
		// 父类 的 doPost 只有一行代码   throw new ServletException（405，"HTTP method POST is not supported by this URL"）;
		//super.doPost(request, response);
		
	}

}
