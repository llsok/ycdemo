<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String repassword = request.getParameter("repassword");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String sql = "insert into user "+
		"values(null,?,?,?,?,?,?,null,null,null)";
	try{
		DBHelper.update(sql,username,password,name,email,phone,sex);
		// json 格式字符串
		
		// 定义json 返回字符串,  用于返回复杂的数据
		String json = "{name:'"+name
				+"', username:'"+username
				+"', password:'"+password
				+"', email:'"+email
				+"', phone:'"+phone
				+"', sex:'"+sex
				+"', msg:'注册成功！'}";   // 扩张一个结果描述信息
		out.print(json);
		
	} catch (Exception e){
		String json = "{msg:'注册成功！'}";   // 扩张一个结果描述信息
		out.print(json);
	}
%>