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

function addCart(id){
	var id = "bid="+id;
	$.ajax({
        type: "post",
        url: "${path}/eorderitem.s?op=add",
        data: id,
        async:true, // 异步请求
        cache:false, // 设置为 false 将不缓存此页面
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
            }
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
            }
        }
    });
}
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
					timeout:300,
    				style:{
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
                        top:''
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
<jsp:include page="back/common/header.jsp"></jsp:include>
<div class="main" id="main">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path }/back/lhoption/index.jsp">首页</a> >
			<a href="${path }/back/lhoption/index.jsp">教材区</a> >
			<a href="detail.jsp?${bookDetail.bid}">图书详情</a>
		</div>
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
				<a  class="pay" href="${path }/back/lywoption/buy.jsp?bid=${bookDetail.bid}">立即购买</a>
				<a  class="pay" href="javascript:;"onclick="addCart(${bookDetail.bid});">加入购物车</a>
			</div>
			<div class="clearfix"></div>
			<div class="description clearfix">
				<h2>发布者描述</h2>
				<p>${bookDetail.bcontent}</p>
			</div>
		</div>
		<div class="main-right fr">
			<h2>同类推荐</h2>
			<div class="tj">
				<c:forEach items="${similarBook}" var="similar" end="3">
					<ul>
						<li class="fore1" > <div class="p-img">  
						<a href="${path }/detail.jsp?bid=${similar.bid}">  
						<img height="150" width="auto"  src="${similar.bimg}" class="img"></a>                
						</div>                
						<div class="p-name"><a href="${path }/detail.jsp?bid=${similar.bid}">
						${similar.bname}</a></div>                
						<div class="p-price"><strong class="J-p-1701273745">￥${similar.bprice}</strong></div>           
						 </li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<jsp:include page="back/common/footer.jsp"></jsp:include>

<!-- <div class="full hide">
	<div class="select-book">
		<div class="clearfix">
			<button class="select">&nbsp;</button>
			<h1>点击图片选择</h1>
			<button class="send " data-counter="0">&#10004;</button>
		</div>
		<div style="text-align:center;clear:both">
		</div>
		<ul class="clearfix">
			<li><img src="images/book.jpg"/><h3>福尔摩斯探案全集1</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集2</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集3</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集4</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集5</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集6</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集7</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集8</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集9</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集10</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集11</h3></li>
			<li><img src="images/book.jpg" /><h3>福尔摩斯探案全集12</h3></li>
		</ul>
		<div class="confirm">
			<a href="#" id="confirm">确认</a>
			<a href="#">取消</a>
		</div>
	</div>
</div> -->
</body>
</html>