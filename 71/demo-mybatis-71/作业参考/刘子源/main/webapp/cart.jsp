<%@page import="com.lzy.damai.bean.Product"%>
<%@page import="com.lzy.damai.bean.Cartitem"%>
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
<link href="css/common.css" rel="stylesheet" type="text/css">
<link href="css/cart.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>

</head>
<body>
<%@ include file="header.jsp" %>

<%
	int uid=Integer.parseInt(request.getParameter("uid"));
	String pid=request.getParameter("pid");
	String count = request.getParameter("count");
	SqlSession sess = MyBatisHelper.getSession();
	Cartitem cartItem=new Cartitem();
	cartItem.setPid(Integer.parseInt(pid));
	cartItem.setUid(uid);
	cartItem.setCount(Integer.parseInt(count));
	sess.insert("com.lzy.damai.dao.CartitemMapper.create",cartItem);
	sess.commit();
	List<Cartitem> cartItemList=sess.selectList("com.lzy.damai.dao.CartitemMapper.selectByUid",uid);
	float total=0;
%>

</div>	<div class="container cart">
		<div class="span24">
		
		
		<div class="step step1">
				购物车列表
			</div>
				<table>
					<tbody>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					
					
						
						<%
							for(Cartitem ci:cartItemList) {
						%>
						<tr>
							<td width="60">
							<img src="<%= ci.getProduct().getImage()%>">
							</td>
							<td>
								<a target="_blank"><%=ci.getProduct().getPname() %></a>
							</td>
							<td>
								￥<%=ci.getProduct().getShopPrice() %>
							</td>
							<td class="quantity" width="60">
								<%=ci.getCount() %>
							</td>
							<td width="140">
								<span class="subtotal">￥<%=ci.getProduct().getShopPrice()*ci.getCount()%></span>
							</td>
							<td>
								<a href="cart.html?pid=1" class="delete">删除</a>
							</td>
						</tr>
				
						<% 	
							total+=ci.getProduct().getShopPrice()*ci.getCount();
							} 
						%>
				</tbody></table>
				
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
							<em>
								登录后确认是否享有优惠
							</em>
					赠送积分: <em id="effectivePoint"><%=total %></em>
					商品金额: <strong id="effectivePrice"><%=total %></strong>
				</div>
				<div class="bottom">
					<a href="cart.html" id="clear" class="clear">清空购物车</a>
					<a href="pay.jsp?uid=<%=uid %>&total=<%=total%>" id="submit" class="submit">提交订单</a>
				</div>
			
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body></html>