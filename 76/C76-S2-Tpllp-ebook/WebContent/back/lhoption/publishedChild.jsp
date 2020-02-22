<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/font-awesome.min.css"/>
<div class="product-item clearfix">
	<div class="name fl">
		<span style="margin-left: 150px">书名</span>
	</div>
	<div class="attr fr">
		<ul class="clearfix">
			<li>价格</li>
			<li>当前数量</li>
			<li>发布时间</li>
			<li style="width: 110px">状态</li>
		</ul>
	</div>
</div>
<c:if test="${userPublish.size() == 0}" var="flag" scope="session">
	<div class="pro">
		<div class="product-attr">
			<span>暂无已发布书籍</span>
		</div>
	</div>
</c:if>
<c:if test="${not flag}">
	<c:forEach items="${userBookPage.getData()}" var="t">
		<div class="pro">
			<div class="product-attr">
				<div class="product-name fl">
					<div class="pic-thumb fl">
						<a href="${path}/detail.jsp?bid=${t.bid}"><img class="middle"
							src="${t.bimg }"></a>
					</div>
					<div class="product-title fl">
						<a href="${path}/detail.jsp?bid=${t.bid}" class="ellipsis">${t.bname }</a><br>
						<span>${t.buniversity }</span> <span>${t.bucollege }</span> <span>${t.bumajor }</span>
					</div>
				</div>
				<div class="product-price fr">
					<ul class="clearfix">
						<li>${t.bprice }</li>
						<li>${t.bnum }</li>
						<li>${t.bdate }</li>
						<li class="edit" style="width: 110px">
								<c:if  test="${t.bstate ==3 || t.bstate ==4 || t.bstate ==5 }" var="flag" scope="session">
											<span class="sell">${bookState[t.bstate]} </span>
								</c:if> 
								<c:if test="${not flag}">
										<span> <a href="${path}/back/lhoption/bookEdit.jsp?bid=${t.bid }"> <i class="icon-edit"></i>
										<p>编辑</p></a></span>
								<span class="line"></span>
								<span> <a onclick="deleteBook(this,${t.bid });"> <i
										class="icon-trash"></i>
										<p>删除</p>
								</a>
								</span>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
<div id="ball_footer" class="ball_footer">
					<a  href="javascript:;" onclick="show(${userBookPage.getFirstPage()})">首页</a> <a
						href="javascript:;"  onclick="show(${userBookPage.getPreviousPage()})">上一页</a> <a
						href="javascript:;"  onclick="show(${userBookPage.getNextPage()})">下一页</a> <a
						href="javascript:;"  onclick="show(${userBookPage.getLastPage()})">尾页</a>
					第${userBookPage.getPage()}/${userBookPage.getLastPage()}页
				</div>