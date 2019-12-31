<%@ page language="java" contentType="text/html; charset=utf-8" isErrorPage="true"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>易书网</title>

<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<style type="text/css">
	#msg{
		font-size:20px;
	}
</style>
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
 $(function(){
	$.ajax({
        type: "post",
        url: "reg.s?op=showUser",
        data: "",
        async:true, // 异步请求
        cache:false, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
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
           if(result.code == 1){
        	    if(location.href.indexOf('#register')==-1){
        	        location.href=location.href+"#register";
        	        location.reload();
        	     }   
           }
  	 	}
	});
});
function checkUserName(){
	//校验用户名是否存在//是否为空
	// 获取用户填写的用户名
	var name = document.getElementById("usernamesignup").value;
    name = name.replace(/\s/gi,"");
    var param = "username="+name;
    $.ajax({
        type: "post",
        url: "reg.s?op=checkName",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#span1").text(result.msg).css("color", 'green'); 
	        		return;
	        	}
	        	if(result.code == 0){
	        		$("#span1").text(result.msg).css("color", 'red'); 
	        		return;
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
//检验电话号码格式
function checkPhone(){
	//校验电话号码格式
    // 获取用户填写的电话号码
    var phone = document.getElementById("tel").value;
    phone = phone.replace(/\s/gi,"");
    var param = "uphone="+phone;
    $.ajax({
        type: "post",
        url: "reg.s?op=checkPhone",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#span2").text(result.msg).css("color", 'green'); 
	        		return;
	        	}
	        	if(result.code == 0){
	        		$("#span2").text(result.msg).css("color", 'red'); 
	        		return;
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
        url: "reg.s?op=checkEmail",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#span01").text(result.msg).css("color", 'green'); 
	        		return;
	        	}
	        	if(result.code == 0){
	        		$("#span01").text(result.msg).css("color", 'red'); 
	        		return;
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
//校验密码
function checkPassword(){
		var password = document.getElementById("passwordsignup").value;
		password = password.replace(/\s/gi,"");
		var param = "upassword="+password;
	    $.ajax({
	        type: "post",
	        url: "reg.s?op=checkPassword",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#span3").text(result.msg).css("color", 'green'); 
		        		return;
		        	}
		        	if(result.code == 0){
		        		$("#span3").text(result.msg).css("color", 'red'); 
		        		return;
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
//检验确认密码
function checkPasswordsignup_confirm(){
	//校验确认密码
    var upassword = document.getElementById("passwordsignup").value;
    var passwordsignup_confirm = document.getElementById("passwordsignup_confirm").value;
    	passwordsignup_confirm = passwordsignup_confirm.replace(/\s/gi,"");
    	var param = "confirm="+passwordsignup_confirm+"&upassword="+upassword;
        $.ajax({
            type: "post",
            url: "reg.s?op=checkRePassword",
            data: param,
            async:true, // 异步请求
            cache:true, // 设置为 false 将不缓存此页面
            dataType: 'json', // 返回对象
            success: function(result) {
    				if(result.code == 1){
    					$("#span4").text(result.msg).css("color", 'green'); 
    	        		return;
    	        	}
    	        	if(result.code == 0){
    	        		$("#span4").text(result.msg).css("color", 'red'); 
    	        		return;
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
// 检验注册
function checkReg(){
	//校验电话号码格式
    // 获取用户填写的电话号码
	var university = document.getElementById("college").value;
	var ucollege = document.getElementById("academy").value;
	var umajor = document.getElementById("special").value;
	var param = "university="+university+"&ucollege="+ucollege+"&umajor="+umajor;
    $.ajax({
        type: "post",
        url: "reg.s?op=checkReg",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					location.href="join.jsp";
					return ;
	        	}
	        	if(result.code == 0){
	        		document.getElementById('regMsg').innerText = result.msg;
	        		return;
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
					var m = rusult.data.split("/");
					if (m[1] == "-1") {
						$("#span1").text("用户名未输入或不合法！").css("color", 'red');
					}
					if (m[2] == "-1") {
						$("#span2").text("电话未输入或不合法！").css("color", 'red');
					}
					if (m[3] == "-1") {
						$("#span01").text("密码未输入或不合法！").css("color", 'red');
					}
					if (m[4] == "-1") {
						$("#span3").text("邮箱未输入或不合法！").css("color", 'red');
					}
					return;
				}
			}
		});
	}
	//检验登录
	function checkJoin() {
		var uname = document.getElementById("username").value;
		var loginkeeping = document.getElementById("loginkeeping").value;
		var upassword = document.getElementById("password").value;
		var vcode = document.getElementById("vcode").value;
		var param = "uname=" + uname + "&loginkeeping=" + loginkeeping
				+ "&upassword=" + upassword + "&vcode=" + vcode;
		$.ajax({
			type : "post",
			url : "join.s?op=join",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					$.messager.alert('提示',result.data+",欢迎您",'info',function(){
						location.href = "back/lhoption/index.jsp";
					});
				}
				if (result.code == 0) {
					document.getElementById('msg').innerText = result.msg;
					return;
				}
				if (result.code == -1) {
					document.getElementById('msg').innerText = result.msg;
					return;
				}
				if (result.code == 2) {
					$.messager.alert('提示',result.msg,'info',function(){
						location.href = "back/main/index.jsp";
					});
				}
			}
		});
	}
	function changeImg(){
		//需要加上时间，让服务器认为此次刷新是有必要的
		  var time=new Date();
	        document.getElementById("vcode-show").src="vcode.s?d="+time;
	}
</script>
</head>
<body style="background: #fff url(images/bg.jpg) repeat top left;">
<div id="container_demo" >
	<a class="hiddenanchor" id="toregister"></a>
	<a class="hiddenanchor" id="tofind"></a>
	<a class="hiddenanchor" id="tologin"></a>
	<div id="wrapper">
		<div id="login" class="animate form">
			<form  action=""  method="post" >
				<h1>登录</h1>
				<div class="title" style="text-align: center;">
							<font color="red" id="msg"></font>
				</div> 
				<p> 
					<label for="username" class="uname" data-icon="u" >您的用户名</label>
					<input id="username" name="username" required="required" type="text" 
					value="${loginUname }"
					placeholder="请输入用户名"/>
				</p>
				<p> 
					<label for="password" class="youpasswd" data-icon="p">你的密码</label>
					<input id="password" name="password" required="required" type="password" 
					placeholder="请输入密码" />
				</p>
				<p> 
					<label for="vcode" class="vcode" data-icon="p">请输入验证码</label>
					<input id="vcode" name="vcode" required="required" type="text" 
					placeholder="请输入验证码" />
				</p>
				<p>	</p>
				<div style="height:100px;">
					<div  style="float:left; width:240px;">
							<img id="vcode-show" alt="" src="vcode.s" style="width: 230px; height: 100px;">
					</div>
					<div style="float:right; margin-top:57px;height:40px;">
						<button style="height:40px;background:white;width:131px;" onclick="changeImg();">看不清?请点击我。。。 </button>
					</div>
				</div>
				<p>	</p>
				<p class="keeplogin"> 
					<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
					<label for="loginkeeping">保持登录状态</label>
				</p>
				<p class="login button"> 
					<input type="button" value="登录" onclick="checkJoin()" /> 
				</p>				
				
				<p class="change_link">
				          忘记密码?<a href="javascript:;" onclick="">找回密码</a>
					不是成员?<a href="#toregister" class="to_register">加入我们</a>
				</p>
			</form>
		</div>

		<div id="register" class="animate form">
			<form   action="" 
			method="post" >
				<h1>注册</h1> 
				<p> 
					<label for="usernamesignup" class="uname" data-icon="u">用户名</label>
					
					<span id="span1" style="font-weight:700;font-size:15px"></span>
					<input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="用户名" 
					onblur="checkUserName()" />
					
				</p>
				<p> 
					<label for="tel" class="youmail">联系电话</label>
					<span id="span2" style="font-weight:700;font-size:15px"></span>
					<input id="tel" name="emailsignup" required="required" type="tel" placeholder="联系电话"
					onblur="checkPhone()"/>
					
				</p>
				
				<p> 
					<label for="uemail" class="youemail">电子邮箱</label>
					<span id="span01" style="font-weight:700;font-size:15px"></span>
					<input id="uemail" name="uemail" required="required" type="text" placeholder="电子邮箱"
					onblur="checkEmail()"/>
					
				</p>
				
				<p>
					<label>你的大学</label>
					<select name="college" id="college" >
						<option >请选择你的大学</option>
						<c:forEach items="${userUni}" var="univ">
							<option >${univ }</option>
						</c:forEach>
					</select>
					<span id="span01" style="font-weight:700;font-size:15px"></span>
				</p>
				<p>
					<label>你的学院</label>
					<select name="academy" id="academy" >
						<option value="">请选择你的学院</option>
						<c:forEach items="${userUcol}" var="ucol">
							<option >${ucol }</option>
						</c:forEach>
					</select>
					<span id="span02" style="font-weight:700;font-size:15px"></span>
				</p>
				<p>
					<label>你的专业</label>
					<select name="special" id="special" >
						<option value="">请选择你的专业</option>
						<c:forEach items="${userUmar}" var="umar">
							<option >${umar }</option>
						</c:forEach>
					</select>
					<span id="span03" style="font-weight:700;font-size:15px"></span>
				</p>
				<p> 
					<label for="passwordsignup" class="youpasswd" data-icon="p">密码（由6-21位字母和数字组成）</label>
					<span id="span3" style="font-weight:700;font-size:15px"></span>
					<input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="密码"
					onblur="checkPassword()"/>
				</p>
				<p> 
					<label for="passwordsignup_confirm" class="youpasswd" data-icon="p">确认密码</label>
					<span id="span4" style="font-weight:700;font-size:15px"></span>
					<input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="确认密码"
					oninput="checkPasswordsignup_confirm()"/>
				</p>
				<div class="title" style="text-align: center;">
					<font color="red" id="regMsg"></font>
				</div>
				<p class="signin button"> 
					<input type="button" value="注册"  onclick="checkReg()"/> 
				</p>
				<p class="change_link">  
					已经是成员?<a href="#tologin" class="to_register"> 去登录 </a>
				</p>
			</form>
		</div>
	</div>
</div>
</body>
</html>