<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <table class="table table-striped table-bordered table-hover" id="sample-table">
       <thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">ID</th>
                <th width="80px">标题</th>
				<th width="150px">分类名称</th>
				<th width="">内容简介</th>
				<th width="150px">添加时间</th>
                <th width="80px">状态</th>                
				<th width="150px">操作</th>
			</tr>
		</thead>
        <tbody>
        <c:forEach items="${noticeAll}" var="n">
				<tr>
          <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>${n.nid }</td>
          <td>${n.ntitle }</td>
          <td>帮助中心</td>
          <td class="displayPart" displayLength="60">${n.ncontent }</td>
          <td>${n.ntime }</td>
          <td>${noticeState[n.nstate] }</td>          
          <td class="td-manage">   
           <a title="编辑" onclick="member_edit('${n.nid }')" href="${path}/back/javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>      
           <a title="删除" href="${path}/back/javascript:;"  onclick="member_del(this,'${n.nid }')" class="btn btn-xs btn-danger" ><i class="fa fa-trash  bigger-120"></i></a>
          </td>
         </tr>		
		</c:forEach>	
        </tbody>
        </table>