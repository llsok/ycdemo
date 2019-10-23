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

<div class="container header">
	
	
<div class="span5">
		<div class="logo">
			<a href="index.html">
				<img src="image/r___________renleipic_01/logo.png" alt="依依不舍"/>
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
	<img src="image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
</div>	</div>
<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<%if(session.getAttribute("loginedUser")==null){%>
						<a href="login.jsp">登录</a>|
					<%} else { %>
						<%-- JSP 注释 ：使用 EL 表达式 输出 session 中的 loginedUser 的 username --%>
						${loginedUser.username}|
					<%} %>
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="olist.html">我的订单</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="index.html">退出</a>|
				</li>
				
				
				
				
				<li id="headerUsername" class="headerUsername">
					${loginedUser.username}
				</li>
				<li id="headerLogout" class="headerLogout">
					<a>[退出]</a>|
				</li>
						<li>
							<a>会员中心</a>
							|
						</li>
						<li>
							<a>购物指南</a>
							|
						</li>
						<li>
							<a>关于我们</a>
							
						</li>
			</ul>
		</div>
		<div class="cart">
			<a  href="cart.html">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>96008/53277764</strong>
			</div>
	</div>
	


<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="index.html">首页</a>
						|
					</li>
					
					<%
						String cSql = "select * from category";
						List<Map<String,Object>> clist = DBHelper.selectList(cSql);
						for(Map<String,Object> row : clist) {
					%>
					<li><a href="clist.jsp?cid=<%=row.get("cid")%>"><%=row.get("cname")%></a>|</li>
					<%}%>
							
		</ul>
	</div>


</div>	

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
								<a target="_blank" href="detail.html?1"><img src="<%=m.get("image") %>" style="display: block;"></a>
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
										<a href="detail.html?72" target="_blank"><img src="products/1/cs10011.jpg" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?57" target="_blank"><img src="products/1/cs60006.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?4" target="_blank"><img src="products/1/cs10004.jpg" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?45" target="_blank"><img src="products/1/cs50004.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?51" target="_blank"><img src="products/1/cs50010.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?68" target="_blank"><img src="products/1/cs70007.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?60" target="_blank"><img src="products/1/cs60009.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?30" target="_blank"><img src="products/1/cs30010.png" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?6" target="_blank"><img src="products/1/cs10006.jpg" style="display: block;"></a>
									</li>
						
									<li>
										<a href="detail.html?2" target="_blank"><img src="products/1/cs10002.jpg" style="display: block;"></a>
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
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a>关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 大麦商城 版权所有</div>
	</div>
</div>
</body></html>