<%@ page language="java" contentType="text/html; charset=utf-8" isErrorPage="true"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css">
	<script type="text/javascript" src="${path}/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
	<title>修改密码</title>
	<script type="text/javascript">
	var xmlhttp;
	var old =0;
	var re =0;
	var ne =0;
	//校验原密码是否存在
	function checkPassWord(){
		// 获取用户填写的原密码
		var oldpassword = document.getElementById("oldpassword").value;
		oldpassword = oldpassword.replace(/\s/gi,"");
		if(oldpassword == ''){
			alert("请填写原密码！");
			return;
		}
		var param = "oldpassword="+oldpassword ;
	    $.ajax({
	        type: "post",
	        url: "${path}/user.s?op=checkPwd",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == 1){
					old=1;
					$("#span1").text(result.msg).css("color", 'green');
					return ;
				}
				if(result.code == -1){
					old=0;
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
				if(result.code == 0){
					old=0;
					$("#span1").text(result.msg).css("color", 'red'); 
					return ;
				}
				}
			});
	}
	
	function newPassword(){
		var newpassword = document.getElementById("newpassword").value;
			password ="upassword=" + newpassword.replace(/\s/gi,"");
			$.ajax({
		        type: "post",
		        url: "${path}/reg.s?op=checkPassword",
		        data: password,
		        async:true, // 异步请求
		        cache:false, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
		        	if(result.code == -1){
						ne=0;
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
						ne=1;
						$("#span3").text(result.msg).css("color", 'green'); 
						return ;
					}
					if(result.code == 0){
						ne=0;
						$("#span3").text(result.msg).css("color", 'red'); 
						return ;
					}
		  	 	}
			});
	}	
	
	
	function ynPassWord(){
		// 获取用户填写的新 密码和确认密码
		var newpassword = document.getElementById("newpassword").value.trim();
		var repassword = document.getElementById("repassword").value.trim();
		if(newpassword == repassword){
			document.getElementById("span2").style.color='green';
			document.getElementById("span2").innerText = "密码一致";
			re=1;
		}else{
			document.getElementById("span2").style.color='red';
			document.getElementById("span2").innerText = "密码不一致";
			re=0;
		}
	}
	
	
	function updatePwd(){
		if(re!=1 || old != 1 || ne!=1){
			alert("条件不符合,不能进行此操作！！！");
			return ;
		}
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=updatePwd",
	        data: password,
	        async:true, // 异步请求
	        cache:false, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(user) {
	        	if(user.code==1){
					alert(user.msg);
					//成功跳转到登录页面
					location.href="${path}/join.jsp";
				}
				if(user.code== 0){
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
				}
				if(user.code == -1){
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
				}
	  	 	}
		});
	}
</script>
	
</head>
<style>
	.help-main p {
		line-height: 50px;
	}
</style>
<body >
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="help-wrap">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path}/bcak/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/member.jsp">个人中心</a> >
			<a href="${path}/back/lywoption/password.jsp">修改密码</a>
		</div>
		<jsp:include page="../common/middle.jsp"></jsp:include>
		<div class="help-r fr">
			<div class="help-item-title">个人信息</div>
			<div class="help-main">
				<form >
					<p><span class="nice">原始密码：</span><input type="password" id="oldpassword" name="oldpassword" onblur="checkPassWord()"><span id="span1"></span></p>
					<p><span class="nice">新密码：</span><input type="password" id="newpassword" name="newpassword" onblur="newPassword()"><span id="span3"></span></p>
					<p><span class="nice">确认新密码：</span><input type="password" id="repassword" name="repassword" oninput="ynPassWord()"><span id="span2"></span></p>
					<input class="save" type="button" onclick="updatePwd()" value="确认修改"/>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>