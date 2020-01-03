<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:forEach   items="${teachBook}" var="teach">
					<dl>
						<dt><a href="${path}/detail.jsp?bid=${teach.bid}"><img src="${teach.bimg}" /></a></dt>
						<dd>
							<p style="width:150px;height:100px;"><a href="${path}/detail.jsp?bid=${teach.bid}" >${teach.bname}</a></p>
							<p>数量：${teach.bnum}</p>
							<p><s>价格：￥${teach.bprice}</s> ${teach.bprice}</p>
						</dd>
					</dl>
</c:forEach>