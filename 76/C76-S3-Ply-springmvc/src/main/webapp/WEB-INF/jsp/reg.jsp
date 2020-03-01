<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>????</title>
</head>
<body>
	<%-- <form action="sign">
		姓名:<input><br>
		密码:<input><br>
		爱好:多选框
		学历:单选框
		专业:下拉列表
		<input type="submit" value="登录">
	</form> --%>
	
	<!-- modelAttribute 用于定义从  model 中的哪个对象对表单进行填充 -->
	<form:form modelAttribute="user" action="reg" method="get">
		姓名:<form:input path="username"/>
			<form:errors path="username"></form:errors>
		<br>
		密码:<form:input path="password"/>
		<form:errors path="password"></form:errors>
		<br>
		邮箱:<form:input path="email"/>
		<form:errors path="email"></form:errors>
		<br>
		爱好:<form:checkboxes items="${likeItems}" path="likes"/><br>
		学历:<form:radiobuttons items="${eduItems }" path="edu"/><br>
		专业:<form:select items="${subjectItems }" path="subject"
				itemLabel="name" itemValue="id"></form:select><br>
		<input type="submit" value="登录">
	</form:form>
	
	
</body>
</html>