<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<link rel="stylesheet" href="${path}/css/cart-data.css"/>
	<div class="help-item-title">购物车</div>
			<div class="help-main">
				<div class="product-item clearfix">
					<div class="name fl" style="margin-left: 50px;width:200px;">
						<span style="margin-left: 150px">书名</span>
					</div>
					<div class="attr fr" >
						<ul class="clearfix"style="width:450px; ">
							<li style="width:50px;">单价</li>
							<li style="width:100px;">数量</li>
							<li style="width:50px;">总价</li>
							<li style="width:100px;">加入时间</li>
							<li class="edit" style="width: 100px">	
								操作
							</li>
						</ul>
					</div>
				</div>
				<c:forEach items="${cartPage.getData()}" var="cart">
						<div class="pro">
						<div class="product-attr">
							<div class="product-name fl">
								<div class="pic-thumb fl"><a href="${path}/detail.jsp?bid=${cart.bid}"  ><img class="middle" src="${cart.bimg}"></a></div>
								<div class="product-title fl">
									<a href="${path}/detail.jsp?bid=${cart.bid}" class="ellipsis">${cart.bname}</a><br>
									<span>
										<c:if test="${cart.buniversity == ''}" var="flag" scope="session">						
											<c:out value="暂无信息"></c:out>
										</c:if>
										<c:if test="${not flag}">	
												${cart.buniversity}	   	
										</c:if>
									</span>
									<span>
										<c:if test="${cart.bucollege == ''}" var="flag" scope="session">						
											<c:out value="暂无信息"></c:out>
										</c:if>
										<c:if test="${not flag}">	
												${cart.bucollege}			   	
										</c:if>
									</span>
									<span>
										<c:if test="${cart.bumajor == ''}" var="flag" scope="session">						
											<c:out value="暂无信息"></c:out>
										</c:if>
										<c:if test="${not flag}">	
												${cart.bumajor}		   	
										</c:if>
									</span>
								</div>
							</div>
							<div class="product-price fr">
								<ul class="clearfix" style="width:450px; ">
									<li style="width:50px;"><span id="cart-price">${cart.bprice}</span></li>
									<li style="width: 100px; height:100px; ">
										<div id="count-div">
											<a id="reduceCount"href="javascript:;" onclick="changeCount('${cart.itemid}',-1)" >-</a>
											 <input id="count-cart" name="count" value="${cart.count}" oninput="checkCount('${cart.itemid}',${cart.count});">
											<a id="addCount"href="javascript:;"  onclick="changeCount('${cart.itemid}',1)">+</a>
										</div>
									</li> 
									<li style="width:50px;"><span id="cart-total">${cart.total}</span></li>
									<li style="width:100px;">${cart.carttime}</li>
									<li  class="edit" style="width: 100px" >
										<a class="buyA" href="javascript:;" onclick="buyBook('${cart.itemid}')">购买</a>
										<a class="buyA" href="javascript:;" onclick="deleteCart(this,'${cart.itemid}')">删除</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="page clearfix">
					<a href="javascript:;" onclick = "show(${cartPage.getFirstPage()})">首页</a>
					<a href="javascript:;" onclick = "show(${cartPage.getPreviousPage()})">上一页</a>
					<a href="javascript:;" onclick = "show(${cartPage.getNextPage()})" >下一页</a>
					<a href="javascript:;" onclick = "show(${cartPage.getLastPage()})">尾页</a>
					第${cartPage.getPage()}/${cartPage.getLastPage()}页
				</div>
			</div>