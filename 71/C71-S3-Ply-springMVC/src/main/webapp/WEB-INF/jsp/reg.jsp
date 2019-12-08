<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<script type="text/javascript">
function loadImg(){
	var fr = new FileReader();
	fr.onload = function(e){
		var img = document.getElementById("img");
		img.src = e.target.result;
	}
	var file = document.getElementById("file");
	fr.readAsDataURL(file.files[0]);
}
</script>
</head>
<body>

<form:form modelAttribute="user" method="post" action="reg.do" enctype="multipart/form-data">
    用户名：<form:input type="text" path="uname"/>
    <form:errors path="uname"/>
    <br>
  密码：  <form:input type="text" path="upass"/>
  	<form:errors path="upass"/>
  <br>
    性别：<form:radiobuttons path="gender" items="${gender}" itemLabel="label" itemValue="value"/> <br>
   籍贯：<form:select path="sheng" items="${sheng}" ></form:select>
   <form:errors path="sheng"/>
   <br>
   邮箱：<form:input path="email"></form:input>
   <form:errors path="email"/>
   <br>
    注册时间：<form:input type="text" path="regtime"/>
    <form:errors path="regtime"/>
    <br>
    头像：<form:input type="text" path="head"/><br>
    上传：<input type="file" name="file"/><br>
    <input type="submit" value="修改"/>
</form:form>

</body>
</html>