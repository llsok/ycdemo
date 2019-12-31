<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <link rel="stylesheet" href="${path}/css/index.css"/>
<div class="tabs book clearfix">
	<c:forEach items="${listBookPage.getData()}" var="listB">
			<dl>
				<dt><a href="${path }/detail.jsp?bid=${listB.bid}"><img src="${listB.bimg }" /></a></dt>
				<dd>
					<p style="width:150px;height:100px;"><a href="${path }/detail.jsp?bid=${listB.bid}">${listB.bname }</a></p>
					<p>数量：${listB.bnum }</p>
					<p><s>价格：￥${listB.bprice }</s> ￥${listB.bprice }</p>
				</dd>
			</dl>
	</c:forEach>
			
			<div class="clearfix"></div>
			<div class="page clearfix">
				<div class="page clearfix">
					<a href="javascript:;" onclick = "show(${listBookPage.getFirstPage()})">首页</a>
					<a href="javascript:;" onclick = "show(${listBookPage.getPreviousPage()})">上一页</a>
					<a href="javascript:;" onclick = "show(${listBookPage.getNextPage()})" >下一页</a>
					<a href="javascript:;" onclick = "show(${listBookPage.getLastPage()})">尾页</a>
					第${listBookPage.getPage()}/${listBookPage.getLastPage()}页
				</div>
			</div>
		</div>