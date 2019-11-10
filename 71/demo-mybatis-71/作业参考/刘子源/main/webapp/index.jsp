<%@page import="com.lzy.damai.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.lzy.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>大麦商城</title>
<link href="css/slider.css" rel="stylesheet" type="text/css"/>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container index">
		<%
			SqlSession sess = MyBatisHelper.getSession();
			List<Product> productList = sess.selectList("com.lzy.damai.dao.ProductMapper.selectAll");
						
		%>
		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门商品</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./蔬菜分类.htm?tagIds=1" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
					
					
					
						<ul class="tabContent" style="display: block;">
							<%
								for(int i=0;i<productList.size();i++){
									if(productList.get(i).getIsHot()==1){
							%>
										<li>
										<a target="_blank" href="detail.jsp?pid=<%= productList.get(i).getPid()%>&uid=<%=request.getParameter("uid")%>"><img src="<%=productList.get(i).getImage()%>" style="display: block;"></a>
										</li>
									<%
									}
								}
							%>
						</ul>
			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新商品</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>		
					
						
						 <ul class="tabContent" style="display: block;">
						 <%
								for(int i=0;i<productList.size();i++){
									if(productList.get(i).getIsHot()==0){
							%>	
									<li>
										<a href="detail.html?72" target="_blank"><img src="<%=productList.get(i).getImage() %>" style="display: block;"></a>
									</li>
									
									<%
									}
								}
							%>
						

						</ul>
			</div>
		</div>
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dd>新手指南</dd>
							<dd>
								<a  target="_blank">支付方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">配送方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">售后服务</a>
								|
							</dd>
							<dd>
								<a  target="_blank">购物帮助</a>
								|
							</dd>
							<dd>
								<a  target="_blank">蔬菜卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">礼品卡</a>
								|
							</dd>
							<dd>
								<a target="_blank">银联卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">亿家卡</a>
								|
							</dd>
							
					<dd class="more">
						<a >更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>
</body></html>