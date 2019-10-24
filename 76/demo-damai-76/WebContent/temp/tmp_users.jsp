<%@page import="java.util.*"%>
<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<ul>
<%
	List<Map<String,Object>> list = DBHelper.selectList("select * from user");
	for(Map<String,Object> m : list) {
%>
	<li><%=m.get("username") %></li>
<%}%>
</ul>
</body>
</html>