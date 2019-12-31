<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table class="table table-striped table-bordered table-hover"
	id="sample_table">
	<thead>
		<tr>
			<th width="25px"><label><input type="checkbox"
					class="ace"><span class="lbl"></span></label></th>
			<th width="80px">编号</th>
			<th width="250px">登录名</th>
			<th width="100px">手机</th>
			<th width="100px">邮箱</th>
			<th width="100px">角色</th>
			<th width="180px">加入时间</th>
			<th width="70px">状态</th>
			<th width="200px">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${adminAll}" var="admin">
			<tr>
				<td><label><input type="checkbox" class="ace"><span
						class="lbl"></span></label></td>
				<td>${admin.uid }</td>
				<td>${admin.uname }</td>
				<td>${admin.uphone }</td>
				<td>${admin.uemail }</td>
				<td>${adminType[admin.utype]}</td>
				<td>${admin.utime }</td>
				<c:if test="${admin.ustate == 1}" var="flag" scope="session">
					<td class="td-status"><span class="label label-success radius">已启用</span>
					</td>
				</c:if>

				<c:if test="${not flag}">
					<td class="td-status"><span class="label label-defaunt radius">${adminStateC[admin.ustate] }</span>
					</td>
				</c:if>

				<td class="td-manage"><c:if test="${admin.ustate == 1}"
						var="flag" scope="session">
						<a onClick="member_stop(this,'${admin.uid }')" href="javascript:;"
							title="停用" class="btn btn-xs btn-success"><i
							class="fa fa-check  bigger-120"></i></a>
					</c:if> <c:if test="${not flag}">
						<a style="text-decoration: none" class="btn btn-xs "
							onClick="member_start(this,'${admin.uid }')" href="javascript:;"
							title="启用"><i class="fa fa-close bigger-120"></i></a>
					</c:if> <a title="编辑"
					href="javascript:;"
					onclick="member_edit('${admin.uid }')"
					class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>
					<a title="重置密码"onclick="updatePwd('${u.uid }')" href="javascript:;" 
					class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>
					<a title="删除" href="javascript:;"
					onclick="member_del(this,'${admin.uid }')"
					class="btn btn-xs btn-warning"><i
						class="fa fa-trash  bigger-120"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>