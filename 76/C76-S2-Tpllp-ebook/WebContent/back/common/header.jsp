<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function exitSys(){
		if(confirm("请确认退出系统？")){
			$.ajax({
	            type: "post",
	            url: "${path}/show.s?op=quit",
	            data: "",
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	            	if(result.code == 1){
	            		location.href="join.jsp";
	            		return;
	            	}
	            }
			});
		}
	}

</script>
<div class="top" id="item4">
	<div class="container clearfix">
		<ul class="clearfix fr">
			<li>
				<c:if test="${loginedUser.uid ==  0}" var="flag" scope="session">	
					<a href="${path}/join.jsp" >登录</a>					
				</c:if>
				<c:if test="${not flag}">	
					${loginedUser.uminname}				   	
				</c:if>
			</li>
			<li><a href="${path}/join.jsp" >注册</a></li>
			<li>
				<c:if test="${loginedUser ==  null}" var="flag" scope="session">	
					<a href="" style="border: none">个人中心</a>
				</c:if>
				<c:if test="${not flag}">	
					<a href="${path}/back/lywoption/member.jsp" style="border: none">个人中心</a>
				</c:if>
					<a href="javascript:;" onclick="exitSys();" style="border: none">退出</a>
			</li>	
		</ul>
	</div>
</div>

<div class="header">
	<div class="container clearfix">
		<div class="logo fl">
			<a href="${path}/back/lhoption/index.jsp"><img src="${path}/images/logo4.png" alt=""/></a>
		</div>
		<div class="seacher fl">
			<form action="" method="post">
				<input type="text" placeholder="小伙伴，你想找什么?"/><input type="submit" value="搜 索"/>
			</form>
			<p>热门搜索：<a href="#">自行车</a> <a href="#">笔记本</a> <a href="#">散热器</a> <a href="#">考研资料</a> <a href="#">摩托车</a> <a href="#">手机</a> <a href="#">轮滑鞋</a> <a href="#">显示器</a> <a href="#">显示器</a> <a href="#">显示器</a> <a href="#">显示器</a></p>
		</div>
		<div class="mm fr clearfix">
			<a href="${path}/back/lywoption/list.jsp">我要买</a>
			<a href="${path}/back/lhoption/publish.jsp">我要卖</a>
		</div>
	</div>
</div>