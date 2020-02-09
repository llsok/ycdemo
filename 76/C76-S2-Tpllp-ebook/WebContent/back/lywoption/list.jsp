<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<script src="${path}/js/jquery-1.7.2.min.js"></script>
	<script src="${path}/js/main.js"></script>
	<title>书籍展示</title>
	<script type="text/javascript">
		$(function(){
			$(".selected").each(function(){
					$("#selectedDd").append($(this).clone()[0])
			})
		})
		function show(page){
			var uni = $("#selectA").text();
			var ucol = $("#selectB").text();
			var umaj = $("#selectC").text();
			var ucla = $("#selectD").text();
			var param="university="+uni+"&ucollege="+ucol+"&umajor="+umaj+"&uclass="+ucla+"&page="+page;
			$.ajax({
		            type: "post",
		            url: "${path}/book.s?op=listBook",
		            data: param,
		            async:true, // 异步请求
		            cache:true, // 设置为 false 将不缓存此页面
		            dataType: 'json', // 返回对象
		            success: function(result) {
		                if(result.code == 1){
		                	//刷新子页面
		                	$('#list-child').load('${path}/back/lywoption/listchild.jsp');
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
<body >
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="list-main">
	<div class="container" id="container">
		<div class="bread" style="margin-bottom: 0;">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/list.jsp">列表</a>
		</div>
		
		<ul class="select">
			<li class="select-list">
				<dl id="select1">
					<dt>学校：</dt>
					<dd class="select-all selected"><a href="javascript:;" onclick="show(1);">全部</a></dd>
					<c:forEach items="${userUni}" var="univ">
						<dd><a href="javascript:;" onclick="show(1);">${univ }</a></dd>
					</c:forEach>
				</dl>
			</li>
			<li class="select-list">
				<dl id="select2">
					<dt>学院：</dt>
					<dd class="select-all selected"><a href="javascript:;" onclick="show(1);">全部</a></dd>
					<c:forEach items="${userUcol}" var="ucol">
						<dd><a href="javascript:;" onclick="show(1);">${ucol }</a></dd>
					</c:forEach>
				</dl>
			</li>
			<li class="select-list">
				<dl id="select3">
					<dt>专业：</dt>
					<dd class="select-all selected"><a href="javascript:;" onclick="show(1);">全部</a></dd>
					<c:forEach items="${userUmar}" var="umar">
						<dd><a href="javascript:;" onclick="show(1);">${umar }</a></dd>
					</c:forEach>
				</dl>
			</li>
			<li class="select-list">
				<dl id="select4">
					<dt>年级：</dt>
					<dd class="select-all selected"><a href="javascript:;" onclick="show(1);">全部</a></dd>
					<dd><a href="javascript:;" onclick="show(1);">大一</a></dd>
					<dd><a href="javascript:;" onclick="show(1);">大二</a></dd>
					<dd><a href="javascript:;" onclick="show(1);">大三</a></dd>
					<dd><a href="javascript:;" onclick="show(1);">大四</a></dd>
				</dl>
			</li>
			<li class="select-result">
				<dl>
					<dt>已选条件：</dt>
					<dd class="select-no">暂时没有选择过滤条件</dd>
				</dl>
			</li>
		</ul>
		<div id="list-child">
			<jsp:include page="listchild.jsp"></jsp:include>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>