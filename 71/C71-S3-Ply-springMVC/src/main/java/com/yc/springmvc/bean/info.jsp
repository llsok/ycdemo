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
<h3>Info</h3>
<form action="info.do">
<input name="id"><br>
<input name="label"><br>
<input name="result.code"><br>
<input name="result.msg"><br>
<input name="result.data"><br>
<input name="likes" type="checkbox" value="篮球">篮球
<input name="likes" type="checkbox" value="电影">电影
<input name="likes" type="checkbox" value="手游">手游
<input name="likes" type="checkbox" value="围棋">围棋<br>
<input type="submit" value="提交">
</form>


info.id = ${info.id}<br>
info.label = ${info.label}<br>
info.result.code = ${info.result.code}<br>
info.result.msg = ${info.result.msg}<br>
info.result.data = ${info.result.data}<br>
info.likes = 
<c:forEach items="${info.likes }" var="like">
	<span>${like} &nbsp;&nbsp;&nbsp; </span>
</c:forEach>

</body>
</html>