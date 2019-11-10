<%@page import="java.util.List"%>
<%@page import="com.lzy.damai.bean.User"%>
<%@page import="com.lzy.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<% 	
	String username=request.getParameter("username");
	String pwd=request.getParameter("password");
	SqlSession sess = MyBatisHelper.getSession();
	User u=new User();
	u.setUsername(username);
	u.setPassword(pwd);
	u =sess.selectOne("com.lzy.damai.dao.UserMapper.login",u);
	System.out.println(u);
	if(u.getUid()!=null){
		response.sendRedirect("index.jsp?uid="+u.getUid());
	}else{
		response.sendRedirect("login.jsp");
	}
%>

</body>
</html>