<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/css/style.css" />
<link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="${path}/back/font/css/font-awesome.min.css" />
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<title>更新管理员信息</title>
</head>
<body>
	<form  id="form-admin-update">
	<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
			<div class="formControls ">
				<input type="text" class="input-text" placeholder="请输入1到10个以内的汉字或字符"
					value="${userMessage.uname }" id="unameUpdate" name="uname"
					 oninput="checkUpdateName('${userMessage.uid}');">
			</div>
			<div class="col-4">
				<span id="vf_nameUpdate" style="margin-left: 5px;"></span>
			</div>
		</div>
		<div class="form-group">
		<div  style="display:none;">
						<input value="${userMessage.uid}" id="uid" name="uid">
						<input value="${userMessage.usex}" id="usexUpdate" >
		</div>
			<label class="form-label "><span class="c-red">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
			<div class="formControls  skin-minimal">
				<label>
				&nbsp;&nbsp;
				<input id="sex0"name="form-field-radio" type="radio" value="0" style="margin-left:10px;"
					class="ace" >
					<span class="lbl">保密</span>
				</label>&nbsp;&nbsp;
				<label >
				&nbsp;&nbsp;
				 <input id="sex1" name="form-field-radio" type="radio" value="1"
					class="ace" style="margin-left:10px;">
					<span class="lbl">男</span></label>&nbsp;&nbsp; <label>
					&nbsp;&nbsp;
				<input id="sex2"name="form-field-radio" type="radio" value="2" class="ace" style="margin-left:10px;">
				<span class="lbl">女</span></label>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
			<div class="formControls ">
				<input type="text" class="input-text" placeholder="请输入十一位手机号"
					value="${userMessage.uphone }" id="uphoneUpdate" name="uphone"
					oninput="checkUpdatePhone('${userMessage.uid}');">
			</div>
			<div class="col-4">
				<span id="vf_phoneUpdate" style="margin-left: 5px;"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
			<div class="formControls ">
				<input type="text" class="input-text" placeholder="@" name="uemail"
					value="${userMessage.uemail }" id="uemailUpdate" datatype="e"
					oninput="checkUpdateEmail('${userMessage.uid}');">
			</div>
			<div class="col-4">
				<span id="vf_emailUpdate" style="margin-left: 5px;"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
			<div class="formControls ">
				<span class="select-box" > <select
					class="select" name="utype" size="1" id="utypeUpdate" style="width: 160px;margin-left:10px;">
						<option value="${ userMessage.utype}">${adminType[userMessage.utype ]}</option>
						<option value="5">普通管理员</option>
						<option value="1">超级管理员</option>
				</select>
				</span>
			</div>
		</div>
	</form>
</body>
<script>
	//用户名判断
	function checkUpdateName(id){
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
						$("#vf_nameUpdate").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#vf_nameUpdate").text(result.msg).css("color", 'red');
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
	function checkUpdateEmail(id){
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
						$("#vf_emailUpdate").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#vf_emailUpdate").text(result.msg).css("color", 'red');
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
	function checkUpdatePhone(id){
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
						$("#vf_phoneUpdate").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#vf_phoneUpdate").text(result.msg).css("color", 'red');
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
		$(function(){
			var sex = $("#usexUpdate").val().replace(/\ +/g,"");
			if(sex == "0"){
				$("#sex0").prop("checked",true);
				return;
			}
			if(sex == "1"){
				$("#sex1").prop("checked",true);
				return;
			}
			if(sex == "2"){
				$("#sex2").prop("checked",true);
				return;
			}
		});
		
	</script>
</html>
