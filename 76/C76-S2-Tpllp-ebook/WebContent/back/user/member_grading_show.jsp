<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">ID</th>
				<th width="100">用户名</th>
				<th width="80">性别</th>
				<th width="120">手机</th>
				<th width="150">邮箱</th>
				<th width="180">加入时间</th>
                <th width="100">等级</th>
                <th width="100">积分</th>
				<th width="70">状态</th>                
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${customerAll}" var="u">
		<tr>
          <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>${u.uid }</td>
		  <td><u style="cursor: pointer" class="text-primary"
					onclick="member_show('个人信息','${path }/back/user/member-show.jsp','${u.uid }','500','400')">${u.uname }</u></td>
		  <td>${userSex[u.usex] }</td>
		  <td>${u.uphone }</td> 
          <td>${u.uemail }</td>         
          <td>${u.utime }</td>
          <td>${userType[u.utype]}</td>
          <td class="text-l">345</td>
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
							title="停用" class="btn btn-xs btn-success">
							<i class="fa fa-check bigger-120"></i></a>
					</c:if> <c:if test="${not flag}">
						<a style="text-decoration: none" class="btn btn-xs "
							onClick="member_start(this,'${u.uid }')" href="javascript:;"
							title="启用"><i class="fa fa-close bigger-120"></i></i></a>
					</c:if> 
          <a title="删除" href="javascript:;"onclick="member_del(this,'${u.uid}')" class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
          </td>
		</tr>
		</c:forEach>
      </tbody>
	</table>