<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path}/back/css/style.css"/>       
        <link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${path}/back/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="${path}/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
        <script src="${path}/back/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${path}/back/js/H-ui.js"></script>     
		<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${path}/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${path}/back/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${path}/back/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="${path}/back/js/lrtk.js" type="text/javascript" ></script>
<title>订单管理</title>
</head>

<body>
<div class="margin clearfix">
 <div class="cover_style" id="cover_style">
    <div class="top_style Order_form" id="Order_form_style">
      <div class="type_title">购物产品比例
      <div class="btn_style">  
      <a href="javascript:ovid()"  class="xianshi_btn Statistic_btn">显示</a> 
      <a href="javascript:ovid()"  class="yingchan_btn Statistic_btn b_n_btn">隐藏</a>
      </div>
      </div>
        <div class="hide_style clearfix">
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="20" data-color="#D15B47"><span class="percent">20</span>%</div><span class="name">教材区</span></div>									
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="55" data-color="#87CEEB"><span class="percent">55</span>%</div><span class="name">工具书区</span></div>									
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="90" data-color="#87B87F"><span class="percent">90</span>%</div><span class="name">分享区</span></div>
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="30" data-color="#d63116"><span class="percent">30</span>%</div><span class="name">成功励志</span></div>
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="60" data-color="#ff6600"><span class="percent">60</span>%</div><span class="name">法律</span></div>
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="40" data-color="#2ab023"><span class="percent">40</span>%</div><span class="name">管理</span></div>
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="46" data-color="#1e3ae6"><span class="percent">46</span>%</div><span class="name">计算机与网络</span></div>
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="65" data-color="#c316a9"><span class="percent">65</span>%</div><span class="name">教育考试</span></div>
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="56" data-color="#13a9e1"><span class="percent">56</span>%</div><span class="name">科技工程</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="66" data-color="#37A2DA"><span class="percent">66</span>%</div><span class="name">生活时尚</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="78" data-color="#32C5E9"><span class="percent">78</span>%</div><span class="name">文化历史</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="34" data-color="#67E0E3"><span class="percent">34</span>%</div><span class="name">英语四六级</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="52" data-color="#8378EA"><span class="percent">52</span>%</div><span class="name">公务员考试</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="37" data-color="#96BFFF"><span class="percent">37</span>%</div><span class="name">考研资料</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="64" data-color="#fb7293"><span class="percent">64</span>%</div><span class="name">雅思托福</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="89" data-color="#ff9f7f"><span class="percent">89</span>%</div><span class="name">其他</span></div>  
       <div class="proportion"> <div class="easy-pie-chart percentage" data-percent="40" data-color="#FFDB5C"><span class="percent">40</span>%</div><span class="name">名人名言</span></div>  
    </div>
    </div>
    <!--内容-->
   <div class="centent_style" id="centent_style">
     <div id="covar_list" class="order_list">
       <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">订单类型分类</h4></div>
         <div class="widget-body">         
         <ul class="b_P_Sort_list">
            	<li><i class="orange  fa fa-reorder"></i><a href="javascript:;">全部订单(${eorderAll.size() })</a></li>
          
		     <c:forEach items="${btypes}" var="bt">
					 <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:;">${btTypeEdit[bt.btid] }(235)</a></li>
			 </c:forEach>
            </ul>
    
       </div>
      </div>  
     </div>
     </div>
     <!--左侧样式-->
     <div class="list_right_style">
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
      <!--订单列表展示-->
       <div id="order-show-list">
       		<jsp:include page="order-hand-list.jsp"></jsp:include>
       </div>
     </div>
   </div>
 </div>
</div>
</div>
 <!--发货-->
 <div id="Delivery_stop" style=" display:none">
  <div class="">
    <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">快递公司 </label>
       <div class="col-sm-9"><select class="form-control" id="form-field-select-1">
																<option value="">--选择快递--</option>
																<option value="1">天天快递</option>
																<option value="2">圆通快递</option>
																<option value="3">中通快递</option>
																<option value="4">顺丰快递</option>
																<option value="5">申通快递</option>
																<option value="6">邮政EMS</option>
																<option value="7">邮政小包</option>
																<option value="8">韵达快递</option>
															</select></div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 快递号 </label>
    <div class="col-sm-9"><input type="text" id="form-field-1" placeholder="快递号" class="col-xs-10 col-sm-5" style="margin-left:0px;"></div>
	</div>
    <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">货到付款 </label>
     <div class="col-sm-9"><label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"></span></label></div>
	</div>
 </div>
  </div>
 </div>
</body>
<script>
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				
				
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
<script>
 $(function() { 
	$("#cover_style").fix({
		float : 'top',
		minStatue : false,
		skin : 'green',	
		durationTime :false,
		window_height:30,//设置浏览器与div的高度值差
		spacingw:0,//
		spacingh:0,//
		close_btn:'.yingchan_btn',
		show_btn:'.xianshi_btn',
		side_list:'.hide_style',
		widgetbox:'.top_style',
		close_btn_width:60,	
		da_height:'#centent_style,.left_Treeview,.list_right_style',	
		side_title:'.b_n_btn',		
		content:null,
		left_css:'.left_Treeview,.list_right_style'
		
		
	});
});
//左侧显示隐藏
$(function() { 
	$("#covar_list").fix({
		float : 'left',
		minStatue : false,
		skin:false,	
		//durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
		stylewidth:'220',
		close_btn:'.close_btn',
		show_btn:'.show_btn',
		side_list:'.side_list',
		content:'.side_content',
		widgetbox:'.widget-box',
		da_height:null,
		table_menu:'.list_right_style'
	});
});
//时间选择
 laydate({
    elem: '#start',
    event: 'focus' 
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
 						$('#order-show-list').load('${path}/back/order/order-hand-list.jsp');
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
   									$('#order-show-list').load('${path}/back/order/order-hand-list.jsp');
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
   						$('#order-show-list').load('${path}/back/order/order-hand-list.jsp');
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
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form,.order_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
//初始化宽度、高度  
  var heights=$(".top_style").outerHeight()+47; 
 $(".centent_style").height($(window).height()-heights); 
 $(".page_right_style").width($(window).width()-220);
 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2); 
 $(".list_right_style").width($(window).width()-250);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".centent_style").height($(window).height()-heights); 
	 $(".page_right_style").width($(window).width()-220);
	 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2);  
	 $(".list_right_style").width($(window).width()-250);
	}) 
//比例
var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
			$('.easy-pie-chart.percentage').each(function(){
				$(this).easyPieChart({
					barColor: $(this).data('color'),
					trackColor: '#EEEEEE',
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: 10,
					animate: oldie ? false : 1000,
					size:103
				}).css('color', $(this).data('color'));
			});
		
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
</script>

</html>
