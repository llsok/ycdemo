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
<script
	src="${path}/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
	
<script type="text/javascript">
//用户名判断
function checkUnameUpdate(id){
	var uname = $("#unameUpdate").val().replace(/\ +/g,"");
	var param ="username="+uname+"&uid="+id;
	$.ajax({
        type: "post",
        url: "${path}/user.s?op=adminCheckName",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#unameUpdateTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#unameUpdateTishi").text(result.msg).css("color", 'red');
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
function checkEmailUpdate(id){
	var uemail = $("#uemailUpdate").val().replace(/\ +/g,"");
	var param ="uemail="+uemail+"&uid="+id;
	$.ajax({
        type: "post",
        url: "${path}/user.s?op=adminCheckEmail",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#uemailUpdateTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#uemailUpdateTishi").text(result.msg).css("color", 'red');
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
function checkPhoneUpdate(id){
	var uphone = $("#uphoneUpdate").val().replace(/\ +/g,"");
	var param ="uphone="+uphone+"&uid="+id;
	$.ajax({
        type: "post",
        url: "${path}/user.s?op=adminCheckPhone",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#uphoneUpdateTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#uphoneUpdateTishi").text(result.msg).css("color", 'red');
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
<title>用户修改</title>
</head>
<body >
	<form >
	<div class="add_menber" id="update_menber_style_child" >
		<ul class=" page-content">
			<li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span
				class="add_name">
				<input placeholder="请输入10个以内字母,汉字" id ="unameUpdate"type="text"class="text_add" name="unameUpdate" value="${userMessage.uname}"
				oninput="checkUnameUpdate('${userMessage.uid}')"/>
				<span id="unameUpdateTishi"style="width:100px;margin-left:5px;"></span>
				</span>
				<div class="prompt r_f"></div></li>
				<li><label class="label_name">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label><span
				class="add_name"><input placeholder="请输入11位数字" name="uphoneUpdate" id ="uphoneUpdate" type="text"
					class="text_add" value="${userMessage.uphone }"oninput="checkUphoneUpdate('${userMessage.uid}')"/><span id="uphoneUpdateTishi"style="width:100px;margin-left:5px;"></span></span>
				<div class="prompt r_f"></div></li>
				<li><label class="label_name">电子邮箱：</label><span
				class="add_name"><input placeholder="请输入电子邮箱" name="uemailUpdate" id ="uemailUpdate"type="text"
					class="text_add" value="${userMessage.uemail }"oninput="checkUemailUpdate('${userMessage.uid}')"/><span id="uemailUpdateTishi"style="width:100px;margin-left:5px;"></span></span>
				<div class="prompt r_f"></div></li>
						
				<li ><label class="label_name">级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span
				class="add_name">
				<select style="width:100px;margin-left:10px;" class="text_add"name="utypeUpdate" id="utypeUpdate">
					<option value="${userMessage.utype }">${userType[userMessage.utype ]}</option>
					<c:forEach items="${uType}" var="utype">
						<option value="${utype }">${userType[utype ]}</option>
					</c:forEach>
				</select>
				</span>
				<div class="prompt r_f"></div></li>
				<li>
					<div  style="display:none;">
						<input value="${userMessage.uid}" id="uid" >
					</div>
				</li>
		</ul>
	</div>
	</form>
</body>
</html>