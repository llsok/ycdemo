<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<title>订单处理</title>
</head>
<body>
	<div class="clearfix">
		<div class="handling_style" id="order_hand">
			<div id="scrollsidebar" class="left_Treeview">
				<div class="show_btn" id="rightArrow">
					<span></span>
				</div>
				<div class="widget-box side_content">
					<div class="side_title">
						<a title="隐藏" class="close_btn"><span></span></a>
					</div>
					<div class="side_list">
						<div class="widget-header header-color-green2">
							<h4 class="lighter smaller">订单操作</h4>
						</div>
						<div class="widget-body" id="widget-body-type">
							<jsp:include page="order-hand-type.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
			<div class="order_list_style" id="order_list_style">
				<div class="search_style">
					<ul class="search_content clearfix">
						<li><label class="l_f">订单编号</label><input id="eoid_show"
							 type="text"  class="text_add" placeholder="输入订单编号" style="width: 250px" /></li>
						<li><label class="l_f">交易时间</label><input
							class="inline laydate-icon" id="start"
							 style="margin-left:10px;"></li>
						<li style="width: 90px;"><button type="button"
								class="btn_search" onClick="selectDate('0')">
								<i class="fa fa-search"></i>查询
							</button></li>
					</ul>
				</div>
				<!--交易订单列表-->
				<div class="Orderform_list" id="Orderform_list_show">
					<jsp:include page="order-hand-list.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<!--发货-->
	<div id="Delivery_stop" style="display: none">
		<div class="">
			<div class="content_style">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1">快递公司 </label>
					<div class="col-sm-9">
						<select class="form-control" id="form-field-select-1">
							<option value="">--选择快递--</option>
							<option value="天天快递">天天快递</option>
							<option value="圆通快递">圆通快递</option>
							<option value="中通快递">中通快递</option>
							<option value="顺丰快递">顺丰快递</option>
							<option value="申通快递">申通快递</option>
							<option value="邮政EMS">邮政EMS</option>
							<option value="邮政小包">邮政小包</option>
							<option value="韵达快递">韵达快递</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1"> 快递号 </label>
					<div class="col-sm-9">
						<input type="text" id="form-field-1" placeholder="快递号"
							class="col-xs-10 col-sm-5" style="margin-left: 0px;">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1">货到付款 </label>
					<div class="col-sm-9">
						<label><input name="checkbox" type="radio" class="ace"
							id="checkbox" value="货到付款"><span class="lbl"></span></label>
					</div>
				</div>
				<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
						for="form-field-1">在线支付 </label>
					<div class="col-sm-9">
						<label><input name="checkbox" type="radio" class="ace"
							id="checkbox" value="在线支付"><span class="lbl"></span></label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(function() { 
	$("#order_hand").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		table_menu:'.order_list_style',
	});
});
//时间
 laydate({
    elem: '#start',
    event: 'focus' 
});
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
$(".order_list_style").width($(window).width()-220);
 $(".order_list_style").height($(window).height()-30);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".order_list_style").width($(window).width()-234);
	  $(".order_list_style").height($(window).height()-30);
});
  //查看订单详情
  function selectSingle(id){
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
						location.href = '${path}/back/order/order_detailed.jsp';
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
  //查询
    function selectDate(id){
	  if(id == 0){
		  id = "";
	  }
  	  var eoid = document.getElementById("eoid_show").value.trim();
  	  var eotime = document.getElementById("start").value.trim();
  	  var param ="eoid="+eoid+"&eotime="+eotime+"&eostate="+id+"&type=1";
  		$.ajax({
  	        type: "post",
  	        url: "${path}/eorder.s?op=query",
  	        data: param,
  	        async:true, // 异步请求
  	        cache:true, // 设置为 false 将不缓存此页面
  	        dataType: 'json', // 返回对象
  	        success: function(result) {
  					if(result.code == 1){
  						$('#Orderform_list_show').load('${path}/back/order/order-hand-list.jsp');
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
/**发货**/
function Delivery_stop(obj,id){
	layer.open({
        type: 1,
        title: '发货',
		maxmin: true, 
		shadeClose:false,
        area : ['500px' , ''],
        content:$('#Delivery_stop'),
		btn:['确定','取消'],
		yes: function(index, layero){		
		if($('#form-field-1').val()==""){
			layer.alert('快递号不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			}else{			
			 layer.confirm('提交成功！',function(index){
				 var express = document.getElementById("form-field-select-1").value.trim();
				 var eotype =  $("input[type='radio']:checked").val();
				 var param ="eostate=3&eoid="+id+"&eopress="+express+"&type="+eotype;
					$.ajax({
				        type: "post",
				        url: "${path}/eorder.s?op=update",
				        data: param,
				        async:true, // 异步请求
				        cache:true, // 设置为 false 将不缓存此页面
				        dataType: 'json', // 返回对象
				        success: function(result) {
								if(result.code == 1){
									$('#widget-body-type').load('${path}/back/order/order-hand-type.jsp');
									$('#Orderform_list_show').load('${path}/back/order/order-hand-list.jsp');
									layer.msg(result.msg, {
										icon :6,
										time : 1000,
										title: "提示"
									});
									layer.close(index); 
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
		}
	})
};
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
						$('#widget-body-type').load('${path}/back/order/order-hand-type.jsp');
						$('#Orderform_list_show').load('${path}/back/order/order-hand-list.jsp');
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
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
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
			});
</script>
</html>
