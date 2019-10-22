<%@ page import="java.util.*"%>
<%@ page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	// 设置请求对象的字符集编码，可以兼容中文参数，避免乱码问题
	request.setCharacterEncoding("utf-8");
	// 接收 用户名 和 密码
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	String sql = "select * from user where username=? and password=?";
	Map<String, Object> user = DBHelper.selectOne(sql, username, password);

	if (user != null) {
		session.setAttribute("loginedUser", user);
		response.sendRedirect("index.jsp");
	} else {
		request.setAttribute("msg", "用户名或密码错误！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>