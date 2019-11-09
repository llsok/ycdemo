<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%@ include file="/common/header.jsp" %>
	<div class="container cart">
		<div class="span24">
		
		
		<div class="step step1">
				购物车列表
			</div>
				<table>
					<tbody><tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<%-- 定义一个金额统计变量 sum, 相当于 pageContext.setAttribute("sum",0) --%>
					<c:set var="sum" value="0"></c:set>
					<%-- CartServlet 将用户的购物车商品信息推送过来，属性名为 cartItems，这里对其循环展示 --%>
					<c:forEach items="${cartItems}" var="c">
						<c:set var="sum" value="${sum + c.count}"></c:set>
						<tr>
							<td width="60">
								<img src="${c.image}">
							</td>
							<td>
								<a target="_blank">${c.pname }</a>
							</td>
							<td>
								￥${c.shop_price }
							</td>
							<td class="quantity" width="60">
								${c.count }
							</td>
							<td width="140">
								<span class="subtotal">￥${c.shop_price * c.count}</span>
							</td>
							<td>
								<a href="cart.jsp?pid=1" class="delete">删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody></table>
				
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
							<em>
								登录后确认是否享有优惠
							</em>
					赠送积分: <em id="effectivePoint">${sum}</em>
					商品金额: <strong id="effectivePrice">${sum}</strong>
				</div>
				<div class="bottom">
					<a href="cart.jsp" id="clear" class="clear">清空购物车</a>
					<a href="pay.jsp" id="submit" class="submit">提交订单</a>
				</div>
			
		</div>
	</div>
<%@ include file="/common/footer.jsp" %>
</body></html>