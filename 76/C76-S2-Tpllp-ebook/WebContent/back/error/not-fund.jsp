<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.show{
	    background: url(../images/404.jpg) no-repeat;
	     background-size:100%;
   		height:100%;
   		width:100%;
		border: 1px solid green;
		position:fixed;
		text-align:center;
}
html, body {
		margin:0;
		padding:0;
}
#bt{
		text-decoration:none ;
		 display:inline-block;
		margin-top:45%;
   		background:white;
   		color:#888888;
   		font-size:25px;
}
</style>
<title>404</title>
</head>
<body>
<div class="show">
		<c:if  test="${loginedUser.utype == 1 || loginedUser.utype == 5}" var="flag" scope="session">
			<a id="bt" href="${path }/back/main/home.jsp">我要回去。。。</a>
		</c:if>
		<c:if test="${not flag}">	
			<a id="bt" href="${path }/back/lhoption/index.jsp">我要回去。。。</a>
		</c:if>
		
</div>
</body>
</html>