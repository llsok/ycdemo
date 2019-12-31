<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css">
	<script type="text/javascript" src="${path}/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
	<title>易书网</title>
	<script type="text/javascript">
	function deleteone(obj,eoid){
		var param = "eoid=" + eoid;
		if(confirm("确实要删除吗？")){
			$.ajax({
		        type: "post",
		        url: "${path}/eorder.s?op=delete",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
		        	if(result.code == 1){
		        		$('#order-show').load('${path}/back/lywoption/orderData.jsp');
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
				}
			});
	}
}
	function show(page){
		var param = "page="+page;
		$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=queryUserOrder",
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
	        	if(result.code == 1){
	        		$('#order-show').load('${path}/back/lywoption/orderData.jsp');
	        		return ;
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
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/member.jsp">个人中心</a> >
			<a href="${path}/back/lywoption/bought2.jsp">已买书籍</a>
		</div>
		<jsp:include page="../common/middle.jsp"></jsp:include>
		<div class="help-r fr" id="order-show">
			<jsp:include page="orderData.jsp"></jsp:include>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>