<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-striped table-bordered table-hover"
	id="sample-table-admin">
	<thead>
		<tr>
			<th width="80px">ID</th>
			<th width="120px">栏目名称</th>
			<th width="120px">等级</th>
			<th width="">说明</th>
			<th width="100px">状态</th>
			<th width="250px">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${controls}" var="c">
			<tr>
				<td>${c.conid }</td>
				<td>${controlType[c.conid] }</td>
				<td>
					<c:if test="${c.conamesecond != null && !c.conamesecond.isEmpty()}" var="flag" scope="session">						
						二级
					</c:if>
					<c:if test="${not flag}">					   	
						一级
					</c:if>
				</td>
				<td class="displayPart" displayLength="80">
					<c:if test="${c.contemp != null && !c.contemp.isEmpty()}" var="flag" scope="session">						
						${c.contemp }
					</c:if>
					<c:if test="${not flag}">					   	
						暂无
					</c:if>
				</td>
				<td class="td-status">
					<c:if test="${c.constate == 1}" var="flag" scope="session">						
							<span class="label label-success radius">已启用</span>
					</c:if>
					<c:if test="${not flag}">					   	
						<span class="label label-defaunt radius">停用</span>
					</c:if>
				</td>
				<td class="td-manage">
						 <c:if test="${c.constate == 1}" var="flag" scope="session">						
						<a onclick="member_stop(this,'${c.conid }')"
					href="javascript:;" title="停用" class="btn btn-xs btn-success"><i
						class="fa fa-check  bigger-120"></i></a>
					</c:if>
					<c:if test="${not flag}">	
					<a class="btn btn-xs " onClick="member_start(this,'${c.conid }')" href="javascript:;" title="启用">
					<i class="fa fa-close bigger-120"></i></a>				   	
					</c:if>
						 
						 <a title="编辑"
					onclick="member_edit('编辑','member-add.html','${c.conid }','','510')"
					href="javascript:;" class="btn btn-xs btn-info"><i
						class="fa fa-edit bigger-120"></i></a> <a title="删除"
					href="javascript:;" onclick="member_del(this,'${c.conid }')"
					class="btn btn-xs btn-warning"><i
						class="fa fa-trash  bigger-120"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
