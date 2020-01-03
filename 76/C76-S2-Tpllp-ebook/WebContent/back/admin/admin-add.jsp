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

<title>添加管理员</title>
</head>
<body>
	<form id="form-admin-add">
		<div class="form-group">
				<label class="form-label "><span class="c-red">*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
				<div class="formControls ">
					<input type="text" class="input-text" placeholder="请输入1到10个以内的汉字或字符"
					id="uname" name="uname"
					 oninput="checkName();">
				</div>
				<div class="col-4">
					<span id="vf_uname" style="margin-left:10px;"></span>
				</div>
			</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
			<div class="formControls  skin-minimal">
				<label>&nbsp;&nbsp;<input name="form-field-radio" type="radio" value="0"
					class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
				<label>&nbsp;&nbsp;<input name="form-field-radio" type="radio" value="1"
					class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp; <label>&nbsp;&nbsp;<input
					name="form-field-radio" type="radio" value="2" class="ace"><span
					class="lbl">女</span></label>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
			<div class="formControls ">
				<input type="text" class="input-text" placeholder="请输入十一位手机号"
					id="uphone" name="uphone"
					oninput="checkPhone();">
			</div>
			<div class="col-4">
				<span id="vf_phone" style="margin-left:10px;"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
			<div class="formControls ">
				<input type="text" class="input-text" placeholder="@" name="uemail"
					 id="uemail" datatype="e"
					oninput="checkEmail();">
			</div>
			<div class="col-4">
				<span id="vf_email" style="margin-left:10px;"></span>
			</div>
		</div>
		<div class="form-group">
			<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
			<div class="formControls ">
				<span class="select-box"> <select
					class="select" name="utype" size="1"style="width: 253px;">
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
	function checkName(){
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
						$("#vf_uname").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#vf_uname").text(result.msg).css("color", 'red');
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
						$("#vf_email").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#vf_email").text(result.msg).css("color", 'red');
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
						$("#vf_phone").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#vf_phone").text(result.msg).css("color", 'red');
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
</html>
