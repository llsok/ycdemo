<%@page import="java.util.Map"%>
<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	Map<String,Object> user = (Map<String,Object>)session.getAttribute("loginedUser");
	String pid = request.getParameter("pid");
	String count = request.getParameter("count");
	String sql = "update cartitem set count=count+? where uid=? and pid=?";
	// 判断是否更新到 指定用的商品
	int num = DBHelper.update(sql,count,  user.get("uid"), pid);
	
	if(num == 0 ){
		sql = "insert into cartitem values(null,?,?,?)";
		DBHelper.update(sql, user.get("uid"), pid, count);
	}
	
	response.sendRedirect("cart.jsp");

%>


