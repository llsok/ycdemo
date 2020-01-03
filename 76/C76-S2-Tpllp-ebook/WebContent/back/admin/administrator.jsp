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
<title>管理员</title>
</head>

<body >
	<div class="page-content clearfix">
		<div class="administrator">
				<div class="d_Confirm_Order_style">
				<div class="search_style">
					<ul class="search_content clearfix">
						<li><label class="l_f">管理员名称</label><input name="adminName"id="adminName"
							type="text" class="text_add"  style="width: 400px" /></li>
						<li><label class="l_f">管理员电话</label><input style=" margin-left:10px;" name="adminType"id="adminType"
							type="text" class="text_add"  style="width: 400px" /></li>
						<li style="width: 90px;"><button type="button" onclick="selectAdmin('0');"
								class="btn_search">
								<i class="fa fa-search"></i>查询
							</button></li>
					</ul>
				</div>
				<!--操作-->
				<div class="border clearfix">
					<span class="l_f"><a href="javascript:;"  id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
				 <a onclick="selectDelete();"
						class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
					</span> <span class="r_f">共：<b>${adminAll.size() }</b>人
					</span>
				</div>
				<!--管理员列表-->
				<div class="clearfix administrator_style" id="administrator">
					<div class="left_style">
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
										<h4 class="lighter smaller">管理员分类列表</h4>
									</div>
									<div class="widget-body" id= "widget-body-admin-type">
										<jsp:include page="admin-type.jsp"></jsp:include>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table_menu_list" id="testIframe-admin-show">
						<jsp:include page="administrator_show.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div id="add_administrator_style" class="add_menber" style="display:none">
    			<jsp:include page="admin-add.jsp"></jsp:include>
   		</div>
   		<div id="update_administrator_style" class="add_menber" style="display:none">
    			<jsp:include page="admin-edit.jsp"></jsp:include>
   		</div>
	</div>
</body>
	<script
	src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script
	src="${path}/back/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/Validform/5.3.2/Validform.min.js"></script>
<script
	src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.admin.js"></script>
<script
	src="${path}/back/assets/layer/layer.js"
	type="text/javascript"></script>
	<script
	src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
	<script src="${path}/back/js/lrtk.js"
	type="text/javascript"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript">
	var sbox = "";
	jQuery(function($) {
		var oTable1 = $('#sample_table').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 2, 3, 4, 5, 7, 8, ]
			} // 制定列不参与排序
			]
		});

		$('table th input:checkbox').on(
				'click',
				function() {
					if(sbox == "/"){
						sbox = "";
					}else{
						sbox = "/";
					}
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
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
	$(function() {
		$("#administrator").fix({
			float : 'left',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			spacingw : 50,//设置隐藏时的距离
			spacingh : 270,//设置显示时间距
		});
	});
	
	
	//字数限制
	function checkLength(which) {
		var maxChars = 100; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您输入的字数超过限制!',
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
	//初始化宽度、高度  
	$(".widget-box").height($(window).height() - 215);
	$(".table_menu_list").width($(window).width() - 260);
	$(".table_menu_list").height($(window).height() - 215);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".widget-box").height($(window).height() - 215);
		$(".table_menu_list").width($(window).width() - 260);
		$(".table_menu_list").height($(window).height() - 215);
	})
	//查询
	function selectAdmin(utype){
		if(utype == "0"){
			utype= "";
		}
		var adminName = document.getElementById("adminName").value.trim();
		var adminType = document.getElementById("adminType").value.trim();
		var param ="uname="+adminName+"&uphone"+adminType+"&utype="+utype;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=queryAdmin",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
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
	/*用户-停用*/
	function member_stop(obj, id){
		layer.confirm('确认要停用吗？',function(index){
			var param ="ustate=2&uid="+id;
			$.ajax({
		        type: "post",
		        url: "${path}/user.s?op=updateState",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
							layer.msg('已停用!',{icon: 1,time:1000});
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
	/*用户-启用*/
	function member_start(obj, id) {
		layer.confirm('确认要启用吗？',function(index) {
			var param ="ustate=1&uid="+id;
			$.ajax({
		        type: "post",
		        url: "${path}/user.s?op=updateState",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
							layer.msg('已启用!',{icon: 6,time:1000});
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
	

	/*产品-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			var param ="uid="+id;
			$.ajax({
		        type: "post",
		        url: "${path}/user.s?op=delete",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#widget-body-admin-type').load('${path}/back/admin/admin-type.jsp');
							$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
							layer.msg('已删除!',{icon:1,time:1000});
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
	/*用户-批量删除*/
	function selectDelete(){
		layer.confirm('确认要删除吗？',function(index){
			if(sbox != "/"){
				var table = $('#sample_table').dataTable();//获取表格
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
				layer.msg("请选择要删除的用户！！！", {
					icon : 7,
					time : 1000
					});
				return ;
			}
			var param ="uid="+sbox;
			$.ajax({
		        type: "post",
		        url: "${path}/user.s?op=delete",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#widget-body-admin-type').load('${path}/back/admin/admin-type.jsp');
							$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
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
	//重置密码
	function updatePwd(id){
		var uid = $("#uid").val().replace(/\ +/g,"");
		var param ="upassword="+1+"&uid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=updateState",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
						layer.msg("重置成功！！！", {
							icon : 6,
							time : 1000,
							title: "提示"
							});
						return ;
		        	}
		        	if(result.code == 0){
		        		layer.msg("重置失败！！！", {
							icon : 5,
							time : 1000,
							title: "提示"
							});
		        		return ;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        		return ;
		        	}
				}
			});
	}
	/*管理员-编辑*/
	function member_edit(id) {
		//1.进行数据查询
		var param ="uid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=showUserMessage",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
	        		$('#update_administrator_style').load('${path}/back/admin/admin-edit.jsp');
					if(result.code == 1){
						  layer.open({
						        type: 1,
						        title: '修改管理员信息',
								maxmin: true, 
								shadeClose:false, //点击遮罩关闭层
						        area : ['700px' , ''],
						        content:$('#update_administrator_style'),
								btn:['提交','取消'],
								yes:function(index,layero){	
								 	//2.进行操作
								 	var param = $('#form-admin-update').serialize();
									$.ajax({
								        type: "post",
								        url: "${path}/user.s?op=adminUpdateUser",
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
													$('#widget-body-admin-type').load('${path}/back/admin/admin-type.jsp');
													$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
													layer.close(index);	
									        		return;
									        	}
									        	if(result.code == 0){
									        	layer.msg(result.msg, {
														icon : 5,
														time : 1000,
														title: "提示"
													});
									        		return false;
									        	}
									        	if(result.code == -1){
									        		layer.msg(result.msg, {
														icon : 2,
														time : 1000,
														title: "提示"
														});
									        		return false;
									        	}
									        	if(result.code == -2){
									        		layer.msg(result.msg, {
														icon : 5,
														time : 1000,
														title: "提示"
														});
									        		var m = rusult.data.split("/");
													if(m[1] == "-1"){
														$("#vf_nameUpdate").text("用户名未输入或不合法！").css("color", 'red');
													}
													if(m[3] == "-1"){
														$("#vf_phoneUpdate").text("电话未输入或不合法！").css("color", 'red');
													}
													if(m[2] == "-1"){
														$("#vf_emailUpdate").text("邮箱未输入或不合法！").css("color", 'red');
													}
									        		return false;
									        	}
											}
										});
								}
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
	}
	/*添加管理员*/
	$('#administrator_add').on('click', function(){
		layer.open({
	    type: 1,
		title:'添加管理员',
		area: ['700px',''],
		shadeClose: true,
		content: $('#add_administrator_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
			var param = $('#form-admin-add').serialize();
			$.ajax({
		        type: "post",
		        url: "${path}/user.s?op=addAdmin",
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
							$('#widget-body-admin-type').load('${path}/back/admin/admin-type.jsp');
							$('#testIframe-admin-show').load('${path}/back/admin/administrator_show.jsp');
							layer.close(index);	
			        		return;
			        	}
			        	if(result.code == 0){
			        	layer.msg(result.msg, {
								icon : 5,
								time : 1000,
								title: "提示"
							});
			        		return false;
			        	}
			        	if(result.code == -1){
			        		layer.msg(result.msg, {
								icon : 2,
								time : 1000,
								title: "提示"
								});
			        		return false;
			        	}
			        	if(result.code == -2){
			        		layer.msg(result.msg, {
								icon : 5,
								time : 1000,
								title: "提示"
								});
			        		var m = rusult.data.split("/");
							if(m[1] == "-1"){
								$("#unameTishi").text("用户名未输入或不合法！").css("color", 'red');
							}
							if(m[3] == "-1"){
								$("#uphoneTishi").text("电话未输入或不合法！").css("color", 'red');
							}
							if(m[2] == "-1"){
								$("#uemailTishi").text("邮箱未输入或不合法！").css("color", 'red');
							}
			        		return false;
			        	}
					}
				});
		  	}		  
		});
	});
</script>
</html>
	