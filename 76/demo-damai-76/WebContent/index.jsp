<%@page import="java.util.*"%>
<%@page import="com.yc.damai.util.DBHelper"%>
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

<!-- 页头          HTML注释           JSP 指令引入 -->	
<%@ include file="/common/header.jsp" %>

<div class="container index">
		

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
							String paramNumber = request.getParameter("pageNumber");
							String paramRows = request.getParameter("pageRows");
							// 第几页
							int pageNumber = paramNumber == null ? 1 : Integer.parseInt(paramNumber);
							// 每页行数
							int pageRows = paramRows == null ? 10 : Integer.parseInt(paramRows);	
							// 第几行开始查询
							int beginRow = ( pageNumber - 1 ) * 10;  
							
							// 查询总行数
							String sql = "select count(*) from product where is_hot=1";
							// Integer  Long  BigDecimal（大实数）
							Object value = DBHelper.selectValue(sql);
							// 计算总页数
							int totalRows = Integer.parseInt("" + value);
							int totalPage = totalRows / pageRows;
							totalPage += totalRows % pageRows == 0 ? 0 : 1;
							
							sql = "select * from product where is_hot=1 limit ?, ?";
							List<Map<String,Object>> list = 
									DBHelper.selectList(sql, beginRow, pageRows);
							for(Map<String,Object> m : list) {
						%>
							<li>
								<a target="_blank" href="detail.jsp?pid=<%=m.get("pid")%>"><img src="<%=m.get("image") %>" style="display: block;"></a>
							</li>
						<%}%>
						</ul>
						<div style="text-align:center;">
							<a href="index.jsp?pageNumber=1">首页</a>
							<a href="index.jsp?pageNumber=<%=pageNumber<=1 ? 1 : pageNumber-1%>">上一页</a>
							第 <input value="<%=pageNumber%>" style="width:30px;text-align: center"> 页
							<a href="index.jsp?pageNumber=<%=pageNumber>=totalPage ? totalPage : pageNumber+1%>">下一页</a>
							<a href="index.jsp?pageNumber=<%=totalPage%>">尾页</a>
						</div>
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
						 
									<li>
										<a href="detail.jsp?72" target="_blank"><img src="products/1/cs10011.jpg" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?57" target="_blank"><img src="products/1/cs60006.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?4" target="_blank"><img src="products/1/cs10004.jpg" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?45" target="_blank"><img src="products/1/cs50004.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?51" target="_blank"><img src="products/1/cs50010.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?68" target="_blank"><img src="products/1/cs70007.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?60" target="_blank"><img src="products/1/cs60009.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?30" target="_blank"><img src="products/1/cs30010.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?6" target="_blank"><img src="products/1/cs10006.jpg" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.jsp?2" target="_blank"><img src="products/1/cs10002.jpg" style="display: block;"></a>
									</li>
						
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

<%-- 页脚         JSP 注释              JSP 动作标签  --%>
<jsp:include page="/common/footer.jsp"></jsp:include>

</body></html>