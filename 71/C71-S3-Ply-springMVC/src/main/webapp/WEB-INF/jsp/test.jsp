<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

sessionScope.user.uname = ${user.uname}<br>
sessionScope.user.upass = ${user.upass}<br>

sessionScope.topic.title = ${t.title}<br>


</body>
</html>