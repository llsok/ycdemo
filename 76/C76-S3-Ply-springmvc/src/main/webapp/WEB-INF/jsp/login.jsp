<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>????</title>
</head>
<body>
	<h3>
		${string}
	</h3>

	<c:if test="${ ! empty msg }">
		<font color="red">${msg}</font>
	</c:if>
	<form action="sign">
		username:<input name="username"><br>
		password:<input name="password"><br>
	<input type="submit" value="登录">
	</form>
	<hr>
	<form action="reg" method="post">
		username:<input name="username"><br>
		password:<input name="password"><br>
	<input type="submit" value="注册">
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<pre>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	作业
	springMVC作业：
	登录要求：
	1，必须是post请求
	2，必须提供 username 和 password 参数，否则报错误
	3，登录成功跳转 home.jsp  登录失败跳回原页面
	4，验证用户名和密码，将验证报错信息推送给页面
	5，登录成功之后暂时不用考虑将用户信息写入会话
	
	注册要求：
	1，必须是 get 请求
	2，提交的注册参数中，必须提交 username，password， age， email, education( 学历 ) 字段， 否则由SpringMVC报出异常
	3， 由用户实体对象（User）接收请求参数值
	4，构建注册页面（register.jsp），请推送一个学历 List 对象，元素包括：大专，本科，研究生。。。，并在页面构建学历单选框，让用户选择
	5， 用户名长度为 6~20位，密码为4~8位， age 为 8~80， 邮箱 必须为 xxx@xxx.xxx格式
	6， 注册成功，跳转 success.jsp 页面，显示注册成功，欢迎XXXX， 失败则跳转会原页面，显示报错信息
	
	</pre>
	
	1, 地址映射练习
	2, 注册练习
	

</body>
</html>