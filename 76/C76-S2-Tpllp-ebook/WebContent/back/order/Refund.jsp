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
	href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/font/css/font-awesome.min.css" />
<script
	src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script src="${path}/back/js/H-ui.js"
	type="text/javascript"></script>
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

<script src="${path}/back/js/lrtk.js"
	type="text/javascript"></script>
<title>退款管理</title>
</head>

<body >
	<div class="margin clearfix" id="refund-fix-date">
		<div id="refund_style">
			<div class="search_style">
				<ul class="search_content clearfix">
					<li><label class="l_f">订单编号</label><input id="eoid_show"
						 type="text" class="text_add"
						placeholder="输入订单编号" style="width: 250px" /></li>
					<li><label class="l_f">退款时间</label><input
						class="inline laydate-icon" id="start" style="margin-left: 10px;"></li>
					<li style="width: 90px;">
					<button type="button"
							class="btn_search" onClick="show('0')">
							<i class="fa fa-search"></i>查询
						</button></li>
				</ul>
			</div>
			<div class="border clearfix">
				<span class="l_f"> <a href="javascript:;"onClick="show('5')"
					class="btn btn-success Order_form"><i 
						class="fa fa-check-square-o"></i>&nbsp;已退款订单</a> <a
					href="javascript:;"onClick="show('4')" class="btn btn-warning Order_form"><i
						class="fa fa-close"></i>&nbsp;未退款订单</a> 
						<a
					href="javascript:;"onClick="show('7')" class="btn btn-warning Order_form"><i
						class="fa fa-close"></i>&nbsp;退款失败订单</a> 
						<a onclick="selectOrderDelete();"
					class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
				</span> <span class="r_f">共：<b>${reorderDetialShow.size()}</b>笔
				</span>
			</div>
			<!--退款列表-->
			<div class="refund_list" id="refund-child">
				<jsp:include page="refund-list.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
<script>
$(function() { 
	$("#refund-fix-date").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		table_menu:'.search_style',
	});
});
//时间
 laydate({
    elem: '#start',
    event: 'focus' 
});
var sbox = "";
 //订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,8,9]}// 制定列不参与排序
		] } );
                 //全选操作
				$('table th input:checkbox').on('click' , function(){
					if(sbox == "/"){
						sbox = "";
					}else{
						sbox = "/";
					}
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
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
			});
function Delivery_Refund(obj,id){
	layer.confirm('是否退款当前订单！',function(index){
		var param ="eostate=5&eoid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=update",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
						$('#refund-child').load('${path}/back/order/refund-list.jsp');
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	});
}
/*订单-删除*/
function Order_form_del(obj, id) {
	layer.confirm('确认要删除吗？', function(index) {
		var param ="eoid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=delete",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
						$('#refund-child').load('${path}/back/order/refund-list.jsp');
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	});
}	
/*订单查询*/
	function show(id){
			if(id == "0"){
				id = "";
			}
		  var eoid = document.getElementById("eoid_show").value.trim();
		  var eotime = document.getElementById("start").value.trim();
		  var param ="eostate="+id+"&eoid="+eoid+"&eotime="+eotime+"&type=0";
			$.ajax({
		        type: "post",
		        url: "${path}/eorder.s?op=query",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#refund-child').load('${path}/back/order/refund-list.jsp');
			        		return;
			        	}
			        	if(result.code == 0){
			        	layer.msg(result.msg, {
								icon : 5,
								time : 1000,
								title: "提示"
							});
			        		return;
			        	}
			        	if(result.code == -1){
			        		layer.msg(result.msg, {
								icon : 2,
								time : 1000,
								title: "提示"
								});
			        	return;
			        	}
					}
				});
	}
	
	
	/*订单-批量删除*/
	function selectOrderDelete(){
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
				layer.msg("请选择要删除的订单！！！", {
					icon : 7,
					time : 1000
					});
				return ;
			}
			var param ="eoid="+sbox;
			$.ajax({
		        type: "post",
		        url: "${path}/eorder.s?op=delete",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							sbox = "";
							layer.msg(result.msg, {
								icon :6,
								time : 1000,
								title: "提示"
							});
							$('#refund-child').load('${path}/back/order/refund-list.jsp');
			        		return;
			        	}
			        	if(result.code == 0){
			        		sbox = "";
			        	layer.msg(result.msg, {
								icon : 5,
								time : 1000,
								title: "提示"
							});
			        		return;
			        	}
			        	if(result.code == -1){
			        		sbox = "";
			        		layer.msg(result.msg, {
								icon : 2,
								time : 1000,
								title: "提示"
								});
			        	return;
			        	}
					}
				});
		});
	}
	//查看退款详情
	function showDetail(id){
		var param ="eoid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=querySingle",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						location.href="${path}/back/order/Refund_detailed.jsp?";
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	}
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.Refund_detailed').on('click', function() {
		var cname = $(this).attr("title");
		var chref = $(this).attr("href");
		var cnames = parent.$('.Current_page').html();
		var herf = parent.$("#iframe").attr("src");
		parent.$('#parentIframe').html(cname);
		parent.$('#iframe').attr("src", chref).ready();
		;
		parent.$('#parentIframe').css("display", "inline-block");
		parent.$('.Current_page').attr({
			"name" : herf,
			"href" : "javascript:void(0)"
		}).css({
			"color" : "#4c8fbd",
			"cursor" : "pointer"
		});
		parent.layer.close(index);
	});
</script>
</html>
