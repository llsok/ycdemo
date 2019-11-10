<%@page import="com.yc.damai.bean.*"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.yc.damai.dao.MyBatisHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
User u=new User();
u.setUsername(request.getParameter("username"));
u.setPassword(request.getParameter("password"));
SqlSession sess= MyBatisHelper.getSession();
User user=  sess.selectOne("com.yc.damai.dao.UserMapper.userLogin", u);
sess.close();
if(user!=null){
	session.setAttribute("user", user);
	response.sendRedirect("index.jsp");
}else{
	response.sendRedirect("login.jsp");
}
%>