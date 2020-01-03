<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link
	href="${path}/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/back/css/style.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${path}/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link
	href="${path}/back/Widget/icheck/icheck.css"
	rel="stylesheet" type="text/css" />

<title>书籍列表</title>
</head>
<body >
	<div class=" page-content clearfix">
		<div id="products_style">
			<div class="search_style">
				<ul class="search_content clearfix">
					<li><label class="l_f">作者</label><input id ="queryName" name="" type="text"
						class="text_add" placeholder="输入作者" value="${bauthor }" style="width: 250px"  /></li>
					<li><label class="l_f">添加时间</label><input
						class="inline laydate-icon" id="start" value="${btime }" style="margin-left: 10px;"></li>
					<li style="width: 90px;"><button type="button"
							class="btn_search" onclick="show();">
							<i class="icon-search" ></i>查询
						</button></li>
				</ul>
			</div>
			<div class="border clearfix">
				<span class="l_f"> <a
					href="${path}/back/book/picture-add.jsp"
					title="添加书籍" class="btn btn-warning Order_form"><i
						class="icon-plus"></i>添加书籍</a> <a onclick="selectDelete();"
					class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
				</span> <span class="r_f">共：<b>${bookAll.size() }</b>本书
				</span>
			</div>
			<!--书籍列表展示-->
			<div class="h_products_list clearfix" id="products_list">
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
								<h4 class="lighter smaller" onclick="book()">书籍类型列表</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main padding-8">
									<div id="treeDemo" class="ztree"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="table_menu_list" id="testIframe">
					<jsp:include page="book_list_show.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</body>
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
<script type="text/javascript"
	src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.admin.js"></script>
<script
	src="${path}/back/assets/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${path}/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${path}/back/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="${path}/back/js/lrtk.js"
	type="text/javascript"></script>
<script type="text/javascript">
//全选
var sbox = -1;
	//操作table表格
	jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
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
						sbox=-1;
					}else{
						sbox = "/";
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
	laydate({
		elem : '#start',
		event : 'focus'
	});
	$(function() {
		$("#products_style").fix({
			float : 'left',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			spacingw : 30,//设置隐藏时的距离
			spacingh : 260,//设置显示时间距
		});
	});
//查询
function show(){
	var bauthor = document.getElementById("queryName").value;
	var btime = document.getElementById("start").value;
	var param = "bauthor=" + bauthor + "&btime=" +btime;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=query",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$('#testIframe').load('${path}/back/book/book_list_show.jsp');
	        		return ;
	        	}
	        	if(result.code == 0){
	        		layer.msg(result.msg, {
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
//删除
function selectDelete(){
	layer.confirm('确认要删除吗？', function(index) {
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
		layer.msg("不能进行此操作！！！", {
			icon : 2,
			time : 1000,
			title: "警告"
			});
		return;
	}
	if(sbox == -1){
		layer.msg("请选择您要删除的书籍！！！", {
			icon : 7,
			time : 1000,
			title: "提示"
		});
		return;
	}
	var param = "bid="+sbox;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=delete",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$('#testIframe').load('${path}/back/book/book_list_show.jsp');
					layer.msg(result.msg, {
						icon : 6,
						time : 1000,
						title: "提示"
					});
	        		return ;
	        	}
	        	if(result.code == 0){
	        		layer.msg(result.msg, {
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
	});
}
</script>
<script type="text/javascript">
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

	/*******树状图*******/
	var bookType = null;
	var setting = {
		view : {
			dblClickExpand : false,
			showLine : false,
			selectedMulti : false
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : ""
			}
		},
		callback : {
			//点击事件
			beforeClick : function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					typeClick(treeNode.btid);
					return true;
				}
			}
		}
	};

	var zNodes = [ {
		id : 1,
		pId : 0,
		name : "书籍分类列表",
		btid : 0,
		open : true
	}, {
		id : 11,
		pId : 1,
		name : "教材区",
		btid : 1
	}, {
		id : 111,
		pId : 11,
		name : "成功励志",
		btid : 4
	}, {
		id : 112,
		pId : 11,
		name : "法律",
		btid : 5
	}, {
		id : 113,
		pId : 11,
		name : "管理",
		btid : 6
	}, {
		id : 114,
		pId : 11,
		name : "计算机与网络",
		btid : 7
	}, {
		id : 115,
		pId : 11,
		name : "教育考试",
		btid : 8
	}, {
		id : 116,
		pId : 11,
		name : "科技工程",
		btid : 9
	}, {
		id : 117,
		pId : 11,
		name : "生活时尚",
		btid : 10
	}, {
		id : 118,
		pId : 11,
		name : "文化历史",
		btid : 11
	}, {
		id : 12,
		pId : 1,
		name : "工具书区",
		btid : 2
	}, {
		id : 121,
		pId : 12,
		name : "英语四六级 ",
		btid : 12
	}, {
		id : 122,
		pId : 12,
		name : "公务员资料 ",
		btid : 13
	}, {
		id : 123,
		pId : 12,
		name : "考研资料 ",
		btid : 14
	}, {
		id : 124,
		pId : 12,
		name : "雅思托福 ",
		btid : 15
	}, {
		id : 125,
		pId : 12,
		name : "其他 ",
		btid : 16
	}, {
		id : 13,
		pId : 1,
		name : "分享区",
		btid : 3
	}, {
		id : 131,
		pId : 13,
		name : "分享区",
		btid : 3
	} ];
//点击类型
function typeClick(id){
	var param ="btid="+id;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=query",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$('#testIframe').load('${path}/back/book/book_list_show.jsp');
	        		return ;
	        	}
	        	if(result.code == 0){
	        		layer.msg(result.msg, {
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
var code;
	function showCode(str) {
		if (!code)
			code = $("#code");
		code.empty();
		code.append("<li>" + str + "</li>");
	}
	$(document).ready(function() {
		var t = $("#treeDemo");
		t = $.fn.zTree.init(t, setting, zNodes);
		demoIframe = $("#testIframe");
		demoIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", '11'));
	});
	
	/*产品-下架*/
	function member_stop(obj, id) {
		layer.confirm('确认要下架吗？',function(index) {
				var param ="bstate=2&bid="+id;
				$.ajax({
			        type: "post",
			        url: "${path}/book.s?op=update",
			        data: param,
			        async:true, // 异步请求
			        cache:true, // 设置为 false 将不缓存此页面
			        dataType: 'json', // 返回对象
			        success: function(result) {
							if(result.code == 1){
								$('#testIframe').load('${path}/back/book/book_list_show.jsp');
								layer.msg(result.msg, {
									icon : 6,
									time : 1000,
									title: "提示"
									});
				        	}
				        	if(result.code == 0){
				        		layer.msg(result.msg, {
									icon : 5,
									time : 1000,
									title: "提示"
									});
				        	}
				        	if(result.code == -1){
				        		layer.msg(result.msg, {
									icon : 2,
									time : 1000,
									title: "提示"
									});
				        	}
						}
					});
			});
	}

	/*产品-上架*/
	function member_start(obj, id) {
		layer.confirm('确认要上架吗？',function(index) {
			var param ="bstate=1&bid="+id;
			$.ajax({
		        type: "post",
		        url: "${path}/book.s?op=update",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#testIframe').load('${path}/back/book/book_list_show.jsp');
							layer.msg(result.msg, {
								icon : 6,
								time : 1000,
								title: "提示"
							});
			        		return ;
			        	}
			        	if(result.code == 0){
			        		layer.msg(result.msg, {
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
		});
	}
	/*产品-编辑*/
	function member_edit(title, url, id,w, h) {
		var param ="bid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/book.s?op=bookDetail",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						layer_show(title, url, w, h);
						$('#testIframe').load('${path}/back/book/book_list_show.jsp');
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	
		        	}
				}
			});
	}

	/*产品-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			var param ="bid="+id;
			$.ajax({
		        type: "post",
		        url: "${path}/book.s?op=delete",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
						if(result.code == 1){
							$('#testIframe').load('${path}/back/book/book_list_show.jsp');
							layer.msg(result.msg, {
								icon : 6,
								time : 1000,
								title: "提示"
							});
			        		return ;
			        	}
			        	if(result.code == 0){
			        		layer.msg(result.msg, {
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
		});
	}
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.Order_form').on('click', function() {
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
