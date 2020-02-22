<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table class="table table-striped table-bordered table-hover"
	id="sample-table">
	<thead>
		<tr>
			<th width="25"><label><input type="checkbox" class="ace"><span
					class="lbl"></span></label></th>
			<th width="80">ID</th>
			<th width="100">用户名</th>
			<th width="120">手机</th>
			<th width="80">年龄</th>
			<th width="100">等级</th>
			<th width="150">邮箱</th>
			<th width="80">性别</th>
			<th width="120">所在大学</th>
			<th width="100">昵称</th>
			<th width="180">加入时间</th>
			<th width="100">状态</th>
			<th width="250">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${customerAll}" var="u">
			<tr>
				<td><label><input type="checkbox" class="ace"><span
						class="lbl"></span></label></td>
				<td>${u.uid }</td>
				<td><u style="cursor: pointer" class="text-primary"
					onclick="member_show('个人信息','${path }/back/user/member-show.jsp','${u.uid }','500','400')">${u.uname }</u></td>
				<td>${u.uphone }</td>
				<td><c:if test="${u.uage  == 0 }" var="flag" scope="session">
						<c:out value="保密"></c:out>
					</c:if> <c:if test="${not flag}">
											${u.uage}
										</c:if></td>
				<td>${userType[u.utype]}</td>
				<td>${u.uemail }</td>
				<td>${userSex[u.usex] }</td>
				<td>${u.university}</td>
				<td>${u.uminname }</td>
				<td>${u.utime }</td>
				<c:if test="${u.ustate == 1 }" var="flag" scope="session">
					<td class="td-status"><span class="label label-success radius">已启用</span>
					</td>
				</c:if>

				<c:if test="${not flag}">
					<td class="td-status"><span class="label label-defaunt radius">${adminStateC[u.ustate] }</span>
					</td>
				</c:if>

				<td class="td-manage">
				<c:if test="${u.ustate == 1 }" var="flag"
						scope="session">
						<a onClick="member_stop(this,'${u.uid }')" href="javascript:;"
							title="停用" class="btn btn-xs btn-success"><i
							class="icon-ok bigger-120"></i></a>
					</c:if> <c:if test="${not flag}">
						<a style="text-decoration: none" class="btn btn-xs "
							onClick="member_start(this,'${u.uid }')" href="javascript:;"
							title="启用"><i class="icon-ok bigger-120"></i></a>
					</c:if> <a title="编辑"onclick="member_edit('${u.uid }')" href="javascript:;" 
					class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
					<a title="重置密码"onclick="updatePwd('${u.uid }')" href="javascript:;" 
					class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
					<a title="删除" href="javascript:;"
					onclick="member_del(this,'${u.uid}')" class="btn btn-xs btn-warning"><i
						class="icon-trash  bigger-120"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>