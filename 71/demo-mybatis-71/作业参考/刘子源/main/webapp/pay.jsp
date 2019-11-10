<%@page import="java.sql.Timestamp"%>
<%@page import="com.lzy.damai.bean.User"%>
<%@page import="com.lzy.damai.bean.Orders"%>
<%@page import="com.lzy.damai.bean.Cartitem"%>
<%@page import="com.lzy.damai.dao.MyBatisHelper"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>大麦商城</title>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%@ include file="header.jsp" %>
<%
	Long uid=Long.parseLong(request.getParameter("uid"));
	String count = request.getParameter("count");
	float total=Float.parseFloat(request.getParameter("total"));
	SqlSession sess = MyBatisHelper.getSession();
	List<Cartitem> cartItemList=sess.selectList("com.lzy.damai.dao.CartitemMapper.selectByUid",uid);
	User u=sess.selectOne("com.lzy.damai.dao.UserMapper.selectByuid",uid);
	Orders o=new Orders();
	o.setTotal(total);
	o.setOrdertime(new Timestamp(System.currentTimeMillis()));
	o.setState(1);
	o.setAddr(u.getAddr());
	o.setPhone(u.getPhone());
	o.setUid(uid);
	o.setName(u.getName());
	sess.insert("com.lzy.damai.dao.OrderMapper.create",o);
	sess.commit();
%>
<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  >生成订单成功</li>
					<li  >订单号:<%=o.getOid() %></li>
				</ul>
			</div>
		
				<table>
					<tbody>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					<% 
						for(Cartitem ci:cartItemList){
							%>
							<tr>
							<td width="60">
								<img src="<%=ci.getProduct().getImage()%>"/>
							</td>
							<td>
								<a target="_blank"><%=ci.getProduct().getPname() %></a>
							</td>
							<td>
								<%=ci.getProduct().getShopPrice() %>
							</td>
							<td class="quantity" width="60">
									<%=ci.getCount() %>							
							</td>
							<td width="140">
								<span class="subtotal">￥<%=ci.getProduct().getShopPrice()*ci.getCount()%></span>
							</td>
						</tr>
						<% 
						}
					%>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice">￥<%=total %>元</strong>
				</div>
			<form id="orderForm" action="msg.html" method="post">
				<input type="hidden" name="order.oid" value="73"/>
				<div class="span24">
					<p>
							收货地址：<input name="order.addr" type="text" value="<%=u.getAddr() %>" style="width:350px" />
								<br />
							收货人&nbsp;&nbsp;&nbsp;：<input name="order.name" type="text" value="<%=u.getName() %>" style="width:150px" />
								<br /> 
							联系方式：<input name="order.phone" type="text" value="<%=u.getPhone() %>" style="width:150px" />

						</p>
						<hr />
						<p>
							选择银行：<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="bank_img/cmb.bmp" align="middle"/>
						</p>
						<hr />
						<p style="text-align:right">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
				</div>
			</form>
		</div>
		
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>