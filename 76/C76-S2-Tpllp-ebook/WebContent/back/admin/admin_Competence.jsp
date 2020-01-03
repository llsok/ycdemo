<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link
	href="${path}/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/back/css/style.css" />
<link
	href="${path}/back/assets/css/codemirror.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${path}/back/font/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/font-awesome.min.css" />
<script
	src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script
	src="${path}/back/assets/js/bootstrap.min.js"></script>
<script
	src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script
	src="${path}/back/assets/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${path}/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
<title>管理权限</title>
</head>

<body >
	<div class="margin clearfix">
		<div class="border clearfix">
			<span class="l_f"> <a
				href="${path}/back/admin/Competence.jsp"
				id="Competence_add" class="btn btn-warning" title="添加权限"><i
					class="fa fa-plus"></i> 添加权限</a> <a onclick="selectDelete();"
				class="btn btn-danger"><i class="fa fa-trash" ></i> 批量删除</a>
			</span> <span class="r_f">共：<b>2</b>类
			</span>
		</div>
		<div class="table_menu_list" id="testIframe">
					<table class="table table-striped table-bordered table-hover"
						id="sample-table-1">
						<thead>
							<tr>
						
						<th width="25px"><label><input type="checkbox"
										class="ace"><span class="lbl"></span></label></th>
						<th>权限名称</th>
						<th>用户名称</th>
						<th>状态</th>
						<th class="hidden-480">描述</th>
						<th class="hidden-480">操作</th>
					</tr>
						</thead>
						<tbody >
						<c:forEach items="${adminExit}" var="admin">
							<tr>
								<td class="center"><label><input type="checkbox"
										class="ace"><span class="lbl"></span></label></td>
								<td>
									<c:if test="${admin.utype == 5}" var="flag" scope="session">
										<c:out value="管理员"></c:out>
									</c:if>
									
									<c:if test="${not flag}">
										<c:out value="超级管理员"></c:out>
									</c:if>
								</td>
								<td>${admin.uname }</td>
								<td>
									<c:if test="${admin.utype == 5}" var="flag" scope="session">
										<c:out value="拥有网站操作系统的大部分使用权限，没有权限管理功能。"></c:out>
									</c:if>
									
									<c:if test="${not flag}">
										<c:out value="拥有至高无上的权利,操作系统的所有权限"></c:out>
									</c:if>
								</td>
									<c:if test="${admin.ustate == 1}" var="flag" scope="session">
											<td class="td-status"><span
										class="label label-success radius">已启用</span></td>
									</c:if>
									
									<c:if test="${not flag}">
										<td class="td-status">
											<span class="label label-defaunt radius">${adminStateC[admin.ustate] }</span>
										</td>
									</c:if>
								
								
								<td class="td-manage">
									<c:if test="${admin.ustate == 1}" var="flag" scope="session">
										<a
									onClick="member_stop(this,'${admin.uid}')"
									href="javascript:;"
									title="停用" class="btn btn-xs btn-success"><i
									class="icon-ok bigger-120"></i></a>
									</c:if>
									
									<c:if test="${not flag}">
										<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,${admin.uid})" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>
									</c:if>
									<a title="编辑" onclick="Competence_modify(${admin.uid})"
									 class="btn btn-xs btn-info"><i
										class="fa fa-edit bigger-120"></i></a> 
									 <a title="删除"
									href="javascript:;" onclick="Competence_del(this,${admin.uid})"
									class="btn btn-xs btn-warning"><i
										class="fa fa-trash  bigger-120"></i></a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
	</div>
</body>
</html>
<script type="text/javascript">
var xmlhttp;
// ajax
try {
	xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
	try {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new XMLHttpRequest();
		} catch (e) {
		}
	}
}
//全选
var sbox = "";
//操作table表格
jQuery(function($) {
	var oTable1 = $('#sample-table').dataTable({
		"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
		"bStateSave" : true,//状态保存
		"aoColumnDefs" : [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [ 0, 2, 3, 4, 5, 8, 9 ]
		} // 制定列不参与排序
		]
	});
	//设置全选
	$('table th input:checkbox').on(
			'click',
			function() {
				if(sbox == "/"){
					sbox="";
				}else{
					sbox="/";
				}
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox').each(
						function() {
							this.checked = that.checked;
							$(this).closest('tr').toggleClass('selected');
						});
			});
	//设置单选
	$('table tr input:checkbox').on(
			'click',
			function() {
				var that = this;
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
						
			});
	$('[data-rel="tooltip"]').tooltip({
		placement : tooltip_placement
	});
	function tooltip_placement(context, source) {
		var $source = $(source);
		var $parent = $source.closest('table')
		var off1 = $parent.offset();
		var w1 = $parent.width();

		var off2 = $source.offset();
		var w2 = $source.width();

		if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
			return 'right';
		return 'left';
	}
});
 /*权限-删除*/
function Competence_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		if(xmlhttp!=null){
			// 定义请求地址
			var url ="${path}/user.s?op=delete&uid="+id;
			// 以 POST 方式 开启连接
			// POST 请求 更安全（编码）  提交的数据大小没有限制
			xmlhttp.open("POST",url,true);
			// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
			// 每次的状态改变都会调用该方法
			xmlhttp.onreadystatechange=function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					// 替换空格
					var msg = xmlhttp.responseText.replace(/\s/gi,"");
					if(msg == 0){
						layer.msg('删除失败!', {
							icon : 5,
							time : 1000
							});
					}else if(msg == 2){
						layer.msg('不能进行删除操作!!!', {
							icon : 2,
							time : 1000
							});
					}else{
						$(obj).parents("tr").remove();
						layer.msg('已删除!',{icon:1,time:1000});
					}
				}
			};
			// 发送请求
			xmlhttp.send(null);
		}else{
			layer.msg('不能创建XMLHttpRequest对象实例', {
				icon : 2,
				time : 1000
				});
		} 
	});
}
/*用户-批量删除*/
function selectDelete(){
	layer.confirm('确认要删除吗？',function(index){
		if(sbox != "/"){
			var table = $('#sample-table').dataTable();//获取表格
			var nTrs = table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
			for (var i = 0; i < nTrs.length; i++) {
				if ($(nTrs[i]).hasClass('selected')) {
					var bid = table.fnGetData(nTrs[i]);//fnGetData获取一行的数据
					 sbox =sbox +"/"+ bid[1];
				}
			}
		}else{
			layer.msg("不能进行该操作！！！", {
				icon : 2,
				time : 1000
				});
			return ;
		}
		if(sbox == ""){
			layer.msg("请选择要删除的管理员！！！", {
				icon : 7,
				time : 1000
				});
			return ;
		}
		if (xmlhttp != null) {
			// 定义请求地址
			var url = "${path}/user.s?op=delete&uid="+sbox;
			// 以 POST 方式 开启连接
			// POST 请求 更安全（编码）  提交的数据大小没有限制
			xmlhttp.open("POST", url, true);
			// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
			// 每次的状态改变都会调用该方法
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var msg = xmlhttp.responseText.replace(/\s/gi, "");
					if(msg == 1){
						layer.msg("删除成功！！！", {
							icon : 6,
							time : 1000
							});
					}else if(msg == 2){
						layer.msg("不能进行此操作！！！", {
							icon : 2,
							time : 1000
							});
					}else{
						layer.msg("删除失败!!!", {
							icon : 5,
							time : 1000
							});
					}
				}
			};
			// 发送请求
			xmlhttp.send(null);
		} else {
			layer.msg("不能创建XMLHttpRequest对象实例", {
				icon : 2,
				time : 1000
				});
		}
	});
}
/*修改权限*/
function Competence_modify(id){
		window.location.href ="${path}/back/admin/Competence.jsp?uid="+ id;
	};
	/*字数限制*/
	function checkLength(which) {
		var maxChars = 200; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您出入的字数超多限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; //250 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	};
	
	/*用户-停用*/
	function member_stop(obj,id){
		layer.confirm('确认要停用吗？',function(index){
			if(xmlhttp!=null){
				// 定义请求地址
				var url ="${path}/user.s?op=updateState&ustate=2&uid="+id;
				// 以 POST 方式 开启连接
				// POST 请求 更安全（编码）  提交的数据大小没有限制
				xmlhttp.open("POST",url,true);
				// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
				// 每次的状态改变都会调用该方法
				xmlhttp.onreadystatechange=function(){
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						// 替换空格
						var msg = xmlhttp.responseText.replace(/\s/gi,"");
						if(msg == 0){
							layer.msg('修改失败!', {
								icon : 5,
								time : 1000
								});
						}else if(msg == 2){
							layer.msg('信息填写不完整!!!', {
								icon : 2,
								time : 1000
								});
						}else{
							$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,${admin.uid})" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
							$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
							$(obj).remove();
							layer.msg('已停用!',{icon: 1,time:1000});
						}
					}
				};
				// 发送请求
				xmlhttp.send(null);
			}else{
				layer.msg('不能创建XMLHttpRequest对象实例', {
					icon : 2,
					time : 1000
					});
			} 
		});
	}

	/*用户-启用*/
	function member_start(obj,id){
		layer.confirm('确认要启用吗？',function(index){
			if(xmlhttp!=null){
				// 定义请求地址
				var url ="${path}/user.s?op=updateState&ustate=1&uid="+id;
				// 以 POST 方式 开启连接
				// POST 请求 更安全（编码）  提交的数据大小没有限制
				xmlhttp.open("POST",url,true);
				// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
				// 每次的状态改变都会调用该方法
				xmlhttp.onreadystatechange=function(){
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						// 替换空格
						var msg = xmlhttp.responseText.replace(/\s/gi,"");
						if(msg == 0){
							layer.msg('修改失败!', {
								icon : 5,
								time : 1000
								});
						}else if(msg == 2){
							layer.msg('信息填写不完整!!!', {
								icon : 2,
								time : 1000
								});
						}else{
							$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,${admin.uid})" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
							$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
							$(obj).remove();
							layer.msg('已启用!',{icon: 6,time:1000});
						}
					}
				};
				// 发送请求
				xmlhttp.send(null);
			}else{
				layer.msg('不能创建XMLHttpRequest对象实例', {
					icon : 2,
					time : 1000
					});
			} 
		});
	}
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.Order_form ,#Competence_add').on('click', function() {
		var cname = $(this).attr("title");
		var cnames = parent.$('.Current_page').html();
		var herf = parent.$("#iframe").attr("src");
		parent.$('#parentIframe span').html(cname);
		parent.$('#parentIframe').css("display", "inline-block");
		parent.$('.Current_page').attr("name", herf).css({
			"color" : "#4c8fbd",
			"cursor" : "pointer"
		});
		parent.layer.close(index);

	});
</script>