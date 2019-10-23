<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String username = request.getParameter("username");
	String sql = "select count(*) from user where username=?";
	Object value = DBHelper.selectValue(sql, username);
	int count = Integer.parseInt("" + value);
	if(count > 0){
		// 在 jsp 脚本中输出信息   ， out 对象用于在 jsp 脚本中属性信息
		out.print("该用户名已经被注册！");
	} else {
		out.print("该用户名可以注册！");
	}
%>