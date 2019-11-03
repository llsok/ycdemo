<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 导入jstl 核心标签库  alt + /  代码提示 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>大麦商城</title>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%@ include file="/common/header.jsp" %>

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
					<!--  items 使用 el 表达式传入    var 循环遍历		  -->
					<c:forEach items="${olist}" var="o">
						<tr>
							<th colspan="5">
							订单号:${o.oid } 
							金额:<font color="red">${o.total} </font>
							状态 :
								<a href="pay.jsp?oid=64"><font color="red">付款</font></a>
							</th>
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<tr>
							<td width="60">
								<img src="products/1/cs10001.jpg"/>
							</td>
							<td>
								<a target="_blank">韩版连帽加厚毛衣女外套</a>
							</td>
							<td>
								228.0
							</td>
							<td class="quantity" width="60">
									1							
							</td>
							<td width="140">
								<span class="subtotal">￥228.0</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
				
			
		</div>
		
	</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>