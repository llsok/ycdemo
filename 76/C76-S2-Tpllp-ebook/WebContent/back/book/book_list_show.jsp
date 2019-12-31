<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-striped table-bordered table-hover"
	id="sample-table">
	<thead>
		<tr>
			<th width="25px"><label><input type="checkbox"
					class="ace"><span class="lbl"></span></label></th>
			<th width="80px">书籍编号</th>
			<th width="250px">书名</th>
			<th width="100px">作者</th>
			<th width="100px">所属类别</th>
			<th width="100px">所属系列</th>
			<th width="100px">价格</th>
			<th width="180px">库存</th>
			<th width="80px">审核状态</th>
			<th width="70px">状态</th>
			<th width="200px">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bookAll}" var="b">
			<tr>
				<td width="25px"><label><input type="checkbox"
						class="ace"><span class="lbl"></span></label></td>
				<td width="80px">${b.bid }</td>
				<td width="250px"><u style="cursor: pointer"
					class="text-primary"
					onclick="window.location.href='${path}/back/book/detail-admin.jsp?bid=${b.bid }';">${b.bname }</u></td>
				<td width="100px">${b.bauthor }</td>
				<td width="100px">${btTypeEdit[b.btid] }</td>
				<td width="100px">${b.btemp}</td>
				<td width="100px">${b.bprice }</td>
				<td width="180px">${b.bnum}</td>
				<td class="text-l">
					<c:if test="${b.bstate == 4 || b.bstate == 5}" var="flag"
						scope="session">
						<span class="label label-defaunt radius">${bookState[b.bstate] }</span>
					</c:if> <c:if test="${not flag}">
						<span class="label label-success radius">审核通过</span>
					</c:if>
				</td>
				<td class="td-status">
				<c:if test="${b.bstate == 1}" var="flag"
						scope="session">
						<span class="label label-success radius">${bookState[b.bstate] }</span>
					</c:if> <c:if test="${not flag}">
						<span class="label label-defaunt radius">${bookState[b.bstate] }</span>
					</c:if></td>
				<td class="td-manage"><c:if test="${b.bstate == 1}" var="flag"
						scope="session">
						<a onClick="member_stop(this,'${b.bid }')" title="下架"
							class="btn btn-xs btn-success"> <i class="icon-ok bigger-120"></i></a>
					</c:if> <c:if test="${not flag}">
						<a style="text-decoration: none" class="btn btn-xs "
							onClick="member_start(this,'${b.bid }')" href="javascript:;"
							title="上架"> <i class="icon-ok bigger-120"></i></a>
					</c:if> <a title="编辑"
					onclick="member_edit('编辑','${path}/back/book/bookEdit.jsp?bid=${b.bid }','${b.bid }','','300')"
					class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
					<a title="删除" href="javascript:;"
					onclick="member_del(this,'${b.bid }')" class="btn btn-xs btn-warning"><i
						class="icon-trash  bigger-120"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>