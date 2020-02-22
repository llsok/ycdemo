<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/font-awesome.min.css"/>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function deleteBook(obj,id){
	var param = "bid=" + id;
	if(confirm("确定删除本书？？？")){
		$.ajax({
	        type: "post",
	        url: "${path}/book.s?op=delete",
	        data: param,
	        async:true, // 异步请求
	        cache:false, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	           if(result.code == 0){
	        	   	alert(result.msg);
	            	return ;
	            }
	           if(result.code == -1){
	        		alert(result.msg);
		           	return ;
	           }
	           if(result.code == 1){
	        		alert(result.msg);
	        		$('#published-show').load('${path}/back/lhoption/publishedChild.jsp');
					return ;
	           }
	        }
	    });
	}
}
//查询
function show(page){
	var param = "page=" +page;
	$.ajax({
        type: "post",
        url: "${path}/show.s?op=userPublishedBookShow",
        data: param,
        async:true, // 异步请求
        cache:false, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
           if(result.code == 0){
        		alert(result.msg);
            	return ;
            }
           if(result.code == -1){
        		alert(result.msg);
           	return ;
           }
           if(result.code == 1){
        		alert(result.msg);
        	 //刷新子页面
           		$('#published-show').load('${path}/back/lhoption/publishedChild.jsp');
				return ;
           }
        }
    });
}
</script>
	<title>易书网</title>
</head>
<style>
	.help-main p {
		line-height: 50px;
	}
</style>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="help-wrap">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/member.jsp">个人中心</a> >
			<a href="${path}/back/lhoption/published.jsp">已发布</a>
		</div>
		<jsp:include page="../common/middle.jsp"></jsp:include>
		<div class="help-r fr">
			<div class="help-item-title">已发布书籍</div>
			<div class="help-main">
				<div id="published-show">
					<jsp:include page="publishedChild.jsp"></jsp:include>
				</div>
			</div>
			</div>
		</div>
	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>