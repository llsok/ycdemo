<%@ page language="java" contentType="text/html; charset=utf-8" isErrorPage="true"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="${path }/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css">
<script type="text/javascript" src="${path}/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
	<script src="${path }/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${path }/js/mz-packed.js"></script>
	<script type="text/javascript">
$(function(){  
	var bid = "bid="+"${param.bid}";
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=bookDetail",
        data: bid,
        async:true, // 异步请求
        cache:false, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
            if(result.code == -1){
            	$.messager.show({
    				title:'提示',
    				msg:result.msg,
    				showType:'fade',
					timeout:200,
    				style:{
    					right:'',
    					bottom:''
    				}
    			});
            }
            if(result.code == 0){
            	$.messager.show({
    				title:'提示',
    				msg:result.msg,
    				showType:'fade',
					timeout:200,
    				style:{
    					right:'',
    					bottom:''
    				}
    			});
            }
            if(result.code == 1){
        	    if(location.href.indexOf('#main')==-1){
        	        location.href=location.href+"#main";
        	        location.reload();
        	     }   
           }
        }
    });
});

</script>
	<title>书籍详情</title>
</head>
<body >
<div class="main" id="main">
	<div class="container clearfix">
		<div class="main-left fl clearfix">
			<div class="zoom-wrap fl">
				<div id="zoom">
					<a href="${bookDetail.bimg}" title="" class="MagicZoom">
						<img class="bzoom" src="${bookDetail.bimg}" width="300" height="424" />
					</a>
				</div>
			</div>
			<div class="attr fl">
				<p style="width:450px;">书名：<span>${bookDetail.bname}</span></p>
				<p>所属学校：<span>
					<c:if test="${!bookDetail.buniversity.isEmpty() &&  bookDetail.buniversity != null}" var="flag" scope="session">						
						<c:out value="${bookDetail.buniversity}"></c:out>	
					</c:if>
					<c:if test="${not flag}">
						<c:out value="暂无信息"></c:out>
					</c:if>
				</span></p>
				<p>所属学院：<span>
					<c:if test="${!bookDetail.bucollege.isEmpty() && bookDetail.bucollege != null}" var="flag" scope="session">						
						<c:out value="${bookDetail.bucollege}"></c:out>	
					</c:if>
					<c:if test="${not flag}">
						<c:out value="暂无信息"></c:out>
					</c:if>
				</span></p>
				<p>所属专业：<span>
					<c:if test="${!bookDetail.bumajor.isEmpty() && bookDetail.bumajor != null}" var="flag" scope="session">						
						<c:out value="${bookDetail.bumajor}"></c:out>	
					</c:if>
					<c:if test="${not flag}">
						<c:out value="暂无信息"></c:out>
					</c:if>
				</span></p>
				<p>所属年级：<span>
					<c:if test="${!bookDetail.bclass.isEmpty() && bookDetail.bclass != null}" var="flag" scope="session">						
						<c:out value="${bookDetail.bclass}"></c:out>	
					</c:if>
					<c:if test="${not flag}">
						<c:out value="暂无信息"></c:out>
					</c:if>
				</span></p>
				<p>拥有者：<span>
					<c:if test="${bookDetail.uid == 0}" var="flag" scope="session">						
						<c:out value="易书网商家"></c:out>
					</c:if>
					<c:if test="${not flag}">
						<c:out value="用户"></c:out>	
					</c:if>
				</span></p>
				<p>价格：<span>
						<c:out value="${bookDetail.bprice}"></c:out>
				</span></p>
				<p>库存：<span>
						<c:out value="${bookDetail.bnum}"></c:out>
				</span></p>
				<p>类别：<span>
						<c:out value="${btTypeEdit[bookDetail.btid]}"></c:out>
				</span></p>
				<p>所属系列：<span>
						<c:out value="${bookDetail.btemp}"></c:out>
				</span></p>
			</div>
			<div class="clearfix"></div>
			<div class="description clearfix">
				<h2>发布者描述</h2>
				<p>${bookDetail.bcontent}</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>