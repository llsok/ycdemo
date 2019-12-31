<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/member.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css">
	<script type="text/javascript" src="${path}/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	
	//检验年龄
	function checkAge(){
		//校验电话号码格式
	    // 获取用户填写的电话号码
		var age = document.getElementById("uage").value;
	    age = age.replace(/\s/gi,"");
	    var param = "uage="+age;
	    $.ajax({
	        type: "post",
	        url: "${path}/user.s?op=checkUage",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == -1){
					$.messager.show({
	    				title:'提示',
	    				msg:result.msg,
	    				showType:'fade',
	    				timeout:300,
	    				style:{
	    					right:'',
	    					bottom:''
	    				}
	    			});
					return ;
				}
				if(result.code == 1){
					$("#agetishi").text(result.msg).css("color", 'green'); 
					return ;
				}
				if(result.code == 0){
					$("#agetishi").text(result.msg).css("color", 'red'); 
					return ;
				}
	        }
		});
	}
	
	//检验电话号码格式
	function checkPhone(){
		//校验电话号码格式
	    // 获取用户填写的电话号码
	    var phone = document.getElementById("uphone").value;
	    phone = phone.replace(/\s/gi,"");
	    var param = "uphone="+phone;
	    $.ajax({
	        type: "post",
	        url: "${path}/user.s?op=checkPhone",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
				if(result.code == 1){
					$("#phonetishi").text(result.msg).css("color", 'green'); 
					return ;
				}
				if(result.code == 0){
					$("#phonetishi").text(result.msg).css("color", 'red'); 
					return ;
				}
		        	if(result.code == -1){
		        		$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
							timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
		        	return;
		        	}
				}
			});
	}
	//检验电子邮箱
	function checkEmail(){
		//校验电子邮箱
	    var uemail = document.getElementById("uemail").value;
	    uemail = uemail.replace(/\s/gi,"");
	    var param = "uemail="+uemail;
	    $.ajax({
	        type: "post",
	        url: "${path}/user.s?op=checkEmail",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == 1){
					$("#emailtishi").text(result.msg).css("color", 'green'); 
					return ;
				}
				if(result.code == 0){
					$("#emailtishi").text(result.msg).css("color", 'red'); 
					return ;
				}
		        	if(result.code == -1){
		        		$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
							timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
		        	return;
		        	}
				}
			});
	}
	function updateMember(){
		var param = $('#member-update').serialize();
		  $.ajax({
	            type: "post",
	            url: "${path}/user.s?op=updateUser",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	$("#agetishi").text("");
	                	$("#phonetishi").text("");
	                	$("#emailtishi").text("");
	                	return ;
	                }
	                if(result.code == 0){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == -2){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	var mess = result.data.split("/");
	                	if(mess[2] == "-1"){
	                		$("#agetishi").text("年龄不合法或未输入").css("color", 'red');
	                	}
						if(mess[1] == "-1"){
							$("#phonetishi").text("电话号码不合法或未输入！").css("color", 'red');
	                	}
						if(mess[3] == "-1"){
							$("#emailtishi").text("邮箱不合法或未输入！").css("color", 'red');
	                	}
	                }
	            }
	        });
	}
	
</script>
	<title>个人信息</title>
</head>

<body >
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="help-wrap">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/member.jsp">个人中心</a> >
			<a href="${path}/back/lywoption/member.jsp">个人信息</a>
		</div>
		<jsp:include page="../common/middle.jsp"></jsp:include>
		<div class="help-r fr" id="helprfrm">
			<div class="help-item-title">个人信息</div>
			<div class="help-main">
					<form id="member-update">
						<p><span class="nice">用户名：</span><span>${loginedUser.uname}</span></p>
						<p>
							<span class="nice">昵称：</span><input type="text" id="uminname" name="uminname" value="${loginedUser.uminname}">
							<span class="nice" id="spanPhone">电话：</span><input type="text" id="uphone" name="uphone" value="${loginedUser.uphone}" oninput="checkPhone();">
							<span  id="phonetishi" style="width:100px; height:30px;"></span>
						</p>
						<p>
							<span class="nice">性别：</span>
								<select name="usex" id="usex">
									<option value="${loginedUser.usex}">${userSex[loginedUser.usex]}</option>
									<option value="0">保密</option>
									<option value="1">男</option>
									<option value="2">女</option>
								</select>
							<span class="nice">年龄：</span>
								<c:if test="${loginedUser.uage ==  0}" var="flag" scope="session">
									<input type="text" id="uage" name="uage" value="保密" oninput="checkAge();">						
								</c:if>
								<c:if test="${not flag}">	
									<input type="text" id="uage" name="uage" value="${loginedUser.uage}" oninput="checkAge();">
								</c:if>
							<span  id="agetishi" style="width:100px;height:30px;"></span>
						</p>
						<p>
							<span class="nice">学校：</span>
							<select name="university" id="university" >
								<option value="${loginedUser.university}">${loginedUser.university}</option>
								<c:forEach items="${userUni}" var="uni">
									<option >${uni }</option>
								</c:forEach>
							</select>
							<span class="nice">学院：</span>
							<select name="ucollege" id="ucollege" >
								<option value="${loginedUser.ucollege}">${loginedUser.ucollege}</option>
								<c:forEach items="${userUcol}" var="ucol">
									<option >${ucol }</option>
								</c:forEach>
							</select>
						</p>
						
						<p>
							<span class="nice">专业：</span>
								<select name="umajor" id="umajor" >
									<option value="${loginedUser.umajor}">${loginedUser.umajor}</option>
									<c:forEach items="${userUmar}" var="umar">
										<option >${umar }</option>
									</c:forEach>
								</select>
							<span class="nice">年级：</span>
								<select name="uclass" id="uclass" >
									<option value="${loginedUser.uclass}">${loginedUser.uclass}</option>
									<option >大一</option>
									<option >大二</option>
									<option >大三</option>
									<option >大四</option>
								</select>
					</p>
					<p>
						<span class="nice">邮箱：</span>
							<input type="text" id="uemail" name="uemail" value="${loginedUser.uemail}" oninput="checkEmail();">
							<span  id="emailtishi" style="width:100px;height:30px;"></span>
					</p>
					<input class="save" type="button" id="updateButton" onclick="updateMember();" value="修改"/>
				</form>		   	
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>