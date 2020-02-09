<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/font-awesome.min.css"/>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<title>购物车</title>
	<script type="text/javascript">
	$(function(){
		$('#help-r-cart').load('${path}/back/lywoption/cartData.jsp');
	});
	function deleteCart(obj,itemid){
		if(confirm("确实要删除吗？")){
			var param = "itemid="+itemid;
			$.ajax({
			        type: "post",
			        url: "${path}/eorderitem.s?op=delete",
			        data: param,
			        async:true, // 异步请求
			        cache:true, // 设置为 false 将不缓存此页面
			        dataType: 'json', // 返回对象
			        success: function(result) {
			        	if(result.code == 1){
			        		$(obj).parents(".pro").remove();
			        		alert(result.msg);
			        		return ;
			        	}
			        	if(result.code == 0){
			        		alert(result.msg);
			        		return ;
			        	}
			        	if(result.code == -1){
			        		alert(result.msg);
			        		return ;
			        	}
				}
			});
		}
	}
	function show(page){
	var param = "page=" +page;
	$.ajax({
	        type: "post",
	        url: "${path}/eorderitem.s?op=query",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == 1){
	        		$('#help-r-cart').load('${path}/back/lywoption/cartData.jsp');
	        		return ;
	        	}
	        	if(result.code == 0){
	        		alert(result.msg);
	        		return ;
	        	}
	        	if(result.code == -1){
	        		alert(result.msg);
	        		return ;
	        	}
			}
		});
}
//检查输入的数量
function checkCount(itemid,count){
	var num = $('#count-cart').val();
	var reg =/^[0-9]{1,7}$/;
	
	if(!reg.test(num)){
		alert("输入不合法！！！");
		return ;
	}
	var param = "itemid="+itemid +"&count="+num;
	$.ajax({
	        type: "post",
	        url: "${path}/eorderitem.s?op=update",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == 1){
	        		$("#count-cart").attr("value",result.data);
	        		$("#cart-total").html(result.data);
	        		return ;
	        	}
	        	if(result.code == 0){
	        		alert(result.msg);
	        		return ;
	        	}
	        	if(result.code == -1){
	        		alert(result.msg);
	        		return ;
	        	}
			}
		});
}
//改变数量
function changeCount(itemid,num){
	var number = $('#count-cart').val();
	var realcount = 0;
	if(num == 1){
		realcount = parseInt(number) + 1;
		var param = "itemid="+itemid +"&count="+realcount;
		$.ajax({
	        type: "post",
	        url: "${path}/eorderitem.s?op=update",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == 1){
	        		$("#count-cart").attr("value",realcount);
	        		$("#cart-total").html(result.data);
	        		return ;
	        	}
	        	if(result.code == 0){
	        		alert(result.msg);
	        		return ;
	        	}
	        	if(result.code == -1){
	        		alert(result.msg);
	        		return ;
	        	}
			}
		});
	}
	if(num == -1){
		if(parseInt(number) > 1){
			realcount = parseInt(number) - 1;
			var param = "itemid="+itemid +"&count="+realcount;
			$.ajax({
			        type: "post",
			        url: "${path}/eorderitem.s?op=update",
			        data: param,
			        async:true, // 异步请求
			        cache:true, // 设置为 false 将不缓存此页面
			        dataType: 'json', // 返回对象
			        success: function(result) {
			        	if(result.code == 1){
			        		$("#count-cart").attr("value",realcount);
			        		$("#cart-total").html(result.data);
			        		return ;
			        	}
			        	if(result.code == 0){
			        		alert(result.msg);
			        		return ;
			        	}
			        	if(result.code == -1){
			        		alert(result.msg);
			        		return ;
			        	}
					}
				});
		}else{
			alert("该宝贝不能再减少了哟！！！");
			return ;
		}
	}
}
//买书
function buyBook(itemid){
	var param = "itemid="+itemid;
	$.ajax({
	        type: "post",
	        url: "${path}/eorderitem.s?op=buyBook",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        	if(result.code == 1){
	        		location.href="${path}/back/lywoption/buy.jsp";
	        		return ;
	        	}
	        	if(result.code == 0){
	        		alert(result.msg);
	        		return ;
	        	}
	        	if(result.code == -1){
	        		alert(result.msg);
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
	#buyA{
		text-decoration:none ;
		out-line: none;
	}
	
</style>
<body >
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="help-wrap">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/member.jsp">个人中心</a> >
			<a href="${path}/back/lywoption/bought.jsp">购物车</a>
	
		</div>
		<jsp:include page="../common/middle.jsp"></jsp:include>
		<div class="help-r fr" id="help-r-cart">
			<jsp:include page="cartData.jsp"></jsp:include>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>