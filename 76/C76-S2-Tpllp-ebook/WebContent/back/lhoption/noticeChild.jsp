<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach   items="${noticePage.getData()}" var="allNoticeShow">
						<h2><a href="${path}/notice-detail.jsp?nid=${allNoticeShow.nid}">${allNoticeShow.ntitle}</a></h2>
						<div class="postdata">
							<div class="date">${date[0] }年${date[1] }月${date[2] }日</div>
							<div class="cate">发表于 <a href="#">公告</a> | </div>
							<div class="cate">浏览量: <span>${allNoticeShow.nnumber}</span>次</div>
						</div>
						<div class="content">
							<p>${allNoticeShow.ncontent}</p>
							<p style="text-align: right;">${allNoticeShow.nauthor}<br />${allNoticeShow.ntime}</p>
						</div>
					</c:forEach>
					<div id="ball_footer" class="ball_footer">
					<a href="javascript:;" class="firstPage" onclick = "show(${noticePage.getFirstPage()})">首页</a>
					<a href="javascript:;" class="previousPage" onclick = "show(${noticePage.getPreviousPage()})">上一页</a>
					<a class="nextPage" href="javascript:;"onclick = "show(${noticePage.getNextPage()})" >下一页</a>
					<a class="lastPage" href="javascript:;" onclick = "show(${noticePage.getLastPage()})">尾页</a>
					第${noticePage.getPage()}/${noticePage.getLastPage()}页
			</div>