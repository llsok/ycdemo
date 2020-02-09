<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:forEach   items="${toolBook}" var="tool">
				<dl>
					<dt><a href="${path}/detail.jsp?bid=${tool.bid}"><img src="${tool.bimg}" /></a></dt>
					<dd>
						<p><a href="${path}/detail.jsp?bid=${tool.bid}">${tool.bname}</a></p>
						<p>数量：${tool.bnum}</p>
						<p><s>价格：￥${tool.bprice}</s> ${tool.bprice}</p>
					</dd>
				</dl>
			</c:forEach>