<%@page import="com.yc.damai.bean.* %>
<%@page import="com.yc.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>大麦商城</title>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/cart.css" rel="stylesheet" type="text/css"/>
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
						Song|
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="olist.html">我的订单</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="index.html">退出</a>|
				</li>
				
				
				
				
				<li id="headerUsername" class="headerUsername"></li>
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
	<!-- 菜单栏 -->
	


<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="index.html">首页</a>
						|
					</li>
					
					<li>
<a href="clist.html?1&pageIndex=1">
					女装男装
</a>
					|</li>
					
					<li>
<a href="clist.html?2&pageIndex=1">
					鞋靴箱包
</a>
					|</li>
					
					<li>
<a href="clist.html?3&pageIndex=1">
					运动户外
</a>
					|</li>
					
					<li>
<a href="clist.html?4&pageIndex=1">
					珠宝配饰
</a>
					|</li>
					
					<li>
<a href="clist.html?5&pageIndex=1">
					手机数码
</a>
					|</li>
					
					<li>
<a href="clist.html?6&pageIndex=1">
					家电办公
</a>
					|</li>
					
					<li>
<a href="clist.html?7&pageIndex=1">
					护肤彩妆
</a>
					|</li>
							
		</ul>
	</div>


	
</div>	

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  >订单列表</li>
				</ul>
			</div>
				<table>
					<tbody>
					<%
						SqlSession sess=MyBatisHelper.getSession();
						User user=sess.selectOne("com.yc.damai.dao.UserMapper.selectById",4);
						
						for(Orders o:user.getOrders()){
					%>
						<tr>
						<th colspan="5">
						订单号:<%=o.getOid() %>  
						金额:<font color="red"><%=o.getTotal() %> </font>
						状态 :
							<a href="pay.html?oid=64"><font color="red"><%=o.getState() %></font></a>
						</th>
					</tr>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
						<%for(Orderitem oi:o.getItems()){
						%>
							<tr>
								<td width="60">
									<img src="<%=oi.getProduct().getImage() %>"/>
								</td>
								<td>
									<a target="_blank"><%=oi.getProduct().getPname() %></a>
								</td>
								<td>
									<%=oi.getProduct().getMarketPrice() %>
								</td>
								<td class="quantity" width="60">
										<%=oi.getCount() %>
								</td>
								<td width="140">
									<span class="subtotal"><%=oi.getProduct().getShopPrice() %></span>
								</td>
							</tr>
					<%}%>
						<%}%>
					
				</tbody>
				
			</table>
				
			
		</div>
		
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
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
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body>
</html>