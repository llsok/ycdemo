<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${path}/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/back/css/style.css" />
<link
	href="${path}/back/assets/css/codemirror.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/font-awesome.min.css" />
<script
	src="${path}/back/assets/js/jquery.min.js"></script>
<script type="text/javascript">
		window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${path}/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
<script
	src="${path}/back/assets/js/bootstrap.min.js"></script>
<script
	src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.admin.js"></script>
<script
	src="${path}/back/assets/layer/layer.js"
	type="text/javascript"></script>
	
<script type="text/javascript">
	//用户名判断
	function checkUname(){
		var uname = $("#uname").val().replace(/\ +/g,"");
		var param ="username="+uname;
		$.ajax({
	        type: "post",
	        url: "${path}/reg.s?op=checkName",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#unameTishi").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#unameTishi").text(result.msg).css("color", 'red');
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        		return;
		        	}
				}
			});
	}
	//邮箱判断
	function checkEmail(){
		var uemail = $("#uemail").val().replace(/\ +/g,"");
		var param ="uemail="+uemail;
		$.ajax({
	        type: "post",
	        url: "${path}/reg.s?op=checkEmail",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#uemailTishi").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#uemailTishi").text(result.msg).css("color", 'red');
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        		return;
		        	}
				}
			});
	}
	//电话判断
	function checkPhone(){
		var uphone = $("#uphone").val().replace(/\ +/g,"");
		var param ="uphone="+uphone;
		$.ajax({
	        type: "post",
	        url: "${path}/reg.s?op=checkPhone",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#uphoneTishi").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#uphoneTishi").text(result.msg).css("color", 'red');
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        		return;
		        	}
				}
			});
	}
</script>
<title>用户添加</title>
</head>
<body >
	<form >
	<div class="add_menber" id="add_menber_style_child" >
		<ul class=" page-content">
			<li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span
				class="add_name">
				<input placeholder="请输入10个以内字母,汉字" id ="uname"type="text"class="text_add" name="uname" oninput="checkUname()"/>
				<span id="unameTishi" style="width:100px;margin-left:5px;"></span></span>
				<div class="prompt r_f"></div></li>
				<li><label class="label_name">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label><span
				class="add_name"><input placeholder="请输入11位数字" name="uphone" id ="uphone" type="text"
					class="text_add" oninput="checkPhone();"/><span id="uphoneTishi"style="width:100px;margin-left:5px;"></span>
				</span>
				<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">电子邮箱：</label>
				<span
				class="add_name"><input placeholder="请输入电子邮箱" name="uemail" id ="uemail"type="text"oninput="checkEmail()"
					class="text_add" /><span id="uemailTishi"style="width:100px;margin-left:5px;" ></span>
				</span>
				<div class="prompt r_f"></div></li>
				<li ><label class="label_name">级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span
				class="add_name">
				<select style="width:150px;margin-left:10px;" class="text_add"name="utype" id="utype">
					<c:forEach items="${uType}" var="uType">
						<option value="${uType }">${userType[uType ]}</option>
					</c:forEach>
				</select>
				</span>
				<div class="prompt r_f"></div></li>
				<%-- <li>
				<input type="button" value="提交" style="width:80px;" onclick="addUser();">
				<input type="button" value="返回" style="width:80px;" onclick="window.location.href='${path}/back/user/user_list.jsp'">
				</li> --%>
		</ul>
	</div>
	</form>
</body>
</html>