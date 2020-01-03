<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${path}/css/order-data.css"/>
	<div class="help-item-title">已买书籍</div>
	<div class="order-data">
		<c:forEach items="${userOrderPage.getData()}" var="userOrder">
			<table class="cart1" id="cart1" width="100%" height="250px" cellspacing="0" cellpadding="0" bordercolor="#ADD3EF" border="1">
				<tbody>
					<tr height="50px">
						<td class="ct01" id="ct01"><span style="margin-left:50px;"><b style="color: red;">订单号：${userOrder.eoid}</b>
						</span> </td>
					</tr>
					<tr>
						<td class="ct02" id="ct02">
							<div class="div_table">
								<table class="eo" id="eo" width="950px" height="180px" cellspacing="0" cellpadding="0" border="1" bordercolor="#ADD3EF"  style="margin:15px 10px 15px 10px;">
									<tr height="30px">
										<th style="width:80px;">书名</th>
										<th style="width:100px;">图片</th>
										<th style="width:80px;">收货人</th>	
										<th style="width:80px;">下单时间</th>	
										<th style="width:80px;">总价</th>	
										<th style="width:80px;">数量</th>
										<th style="width:80px;">状态</th>	
										<th style="width:160px;">操作</th>	
									</tr>
									<c:forEach items="${userCart}" var="allOrder">
										<c:if test="${allOrder.eoid.equals(userOrder.eoid)}" var="flag" scope="session">						
											<tr style="text-align:center" height="100px" >
												<td style="width:80px;"><a href="${path}/detail.jsp?bid=${allOrder.bid}" style="font-size:16px;">${allOrder.bname}</a></td>
												<td style="width:100px;"><a href="${path}/detail.jsp?bid=${allOrder.bid}"><img style="width:80px;height:100px" src="${allOrder.bimg}"></a></td>	
												<td style="width:80px;">${userOrder.uname}</td>	
												<td style="width:80px;">${userOrder.eotime}</td>	
												<td style="width:80px;">${allOrder.total}</td>	
												<td style="width:80px;">${allOrder.count}</td>
												<td style="width:80px;">
													<c:if test="${userOrder.eostate == 5 || userOrder.eostate == 6}" var="flag" scope="session">						
														<span class="order-state-user">
														<span class="state-real">${userEorderState[userOrder.eostate]}</span>
														</span>
													</c:if>
													<c:if test="${not flag}">	
														<span class="order-state-user-1">
														<span class="state-real">${userEorderState[userOrder.eostate]}</span>
														</span>				   	
													</c:if>
													
												</td>	
												<td style="width:160px;">
													<input type="button" value="售后" >
													<input type="button" value="退货" >
													<input type="button" value="删除" onclick="deleteone(this,'${allOrder.eoid}')">
												</td>
											</tr>
										</c:if>
									</c:forEach>
							</table>
						</div>
					</td>
				</tr>
				<tr height="50px">
					<td >
						<div class="eo1" id="eo1">
							<span style="margin-left:50px;">收货地址：${userOrder.eoaddr}</span><span style="margin-left:400px;">配送方式:${userOrder.eotype}</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		</c:forEach>
				<div class="page clearfix">
					<a href="javascript:;" onclick = "show(${userOrderPage.getFirstPage()})">首页</a>
					<a href="javascript:;" onclick = "show(${userOrderPage.getPreviousPage()})">上一页</a>
					<a href="javascript:;" onclick = "show(${userOrderPage.getNextPage()})" >下一页</a>
					<a href="javascript:;" onclick = "show(${userOrderPage.getLastPage()})">尾页</a>
					第${userOrderPage.getPage()}/${userOrderPage.getLastPage()}页
				</div>
</div>