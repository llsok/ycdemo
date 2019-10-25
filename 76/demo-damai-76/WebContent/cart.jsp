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
<%
	if(session.getAttribute("loginedUser") == null){
		request.setAttribute("msg", "请先登录系统！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
		return;
	}

%>

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
					<%
						String sql = "select b.*,a.ciid,a.count from cartitem a "
								+ " join product b on a.pid=b.pid where uid=?";
						Map<String,Object> user = (Map<String,Object>)session.getAttribute("loginedUser");
						List<Map<String,Object>> list = DBHelper.selectList(sql, user.get("uid"));
						for(Map<String,Object> cartitem : list){
							pageContext.setAttribute("c", cartitem);
					%>
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
					
					<%} %>
				
				</tbody></table>
				
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
							<em>
								登录后确认是否享有优惠
							</em>
					赠送积分: <em id="effectivePoint">11017.0</em>
					商品金额: <strong id="effectivePrice">11017.0</strong>
				</div>
				<div class="bottom">
					<a href="cart.jsp" id="clear" class="clear">清空购物车</a>
					<a href="pay.jsp" id="submit" class="submit">提交订单</a>
				</div>
			
		</div>
	</div>
<%@ include file="/common/footer.jsp" %>
</body></html>