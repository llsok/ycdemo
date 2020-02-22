<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/css/style.css" />
<link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="${path}/back/font/css/font-awesome.min.css" />
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script src="${path}/back/js/lrtk.js" type="text/javascript"></script>
<script src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
<script src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${path}/back/assets/layer/layer.js" type="text/javascript"></script>
<script src="${path}/back/assets/dist/echarts.js"></script>
<title>会员等级</title>
</head>

<body>
	<div class="grading_style">
		<div id="category">
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
							<h4 class="lighter smaller">会员等级</h4>
						</div>
						<div class="widget-body">
							<ul class="b_P_Sort_list">
								<li><i class="orange  fa fa-user-secret"></i><a
									href="javascript:;" onclick="show('0');">全部(${customerAll.size() })</a></li>
								<li><i class="fa fa-diamond pink "></i> <a
									href="javascript:;" onclick="show('2');">普通会员(${userSize[0] })</a></li>
								<li><i class="fa fa-diamond pink "></i> <a
									href="javascript:;" onclick="show('3');">铁牌会员(${userSize[1] })</a></li>
								<li><i class="fa fa-diamond pink "></i> <a
									href="javascript:;" onclick="show('4');">铜牌会员(${userSize[2] })</a></li>
								<li><i class="fa fa-diamond pink "></i> <a
									href="javascript:;" onclick="show('6');">银牌会员(${userSize[3] })</a></li>
								<li><i class="fa fa-diamond pink "></i> <a
									href="javascript:;" onclick="show('7');">金牌会员(${userSize[4] })</a></li>
								<li><i class="fa fa-diamond grey"></i> <a
									href="javascript:;" onclick="show('8');">钻石会员(${userSize[5] })</a></li>
								<li><i class="fa fa-diamond red"></i> <a
									href="javascript:;" onclick="show('9');">红钻会员(${userSize[6] })</a></li>
								<li><i class="fa fa-diamond blue"></i> <a
									href="javascript:;" onclick="show('10');">蓝钻会员(${userSize[7] })</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--右侧样式-->
			<div class="page_right_style right_grading">
				<div class="Statistics_style" id="Statistic_pie">
					<div class="type_title">
						等级统计 <span class="top_show_btn Statistic_btn">显示</span> <span
							class="Statistic_title Statistic_btn"><a title="隐藏"
							class="top_close_btn">隐藏</a></span>
					</div>
					<div id="Statistics" class="Statistics"></div>
				</div>
				<!--列表样式-->
				<div class="grading_list">
					<div class="type_title">全部会员等级列表</div>
					<div class="table_menu_list" id="table_menu_list_child">
						<jsp:include page="member_grading_show.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#category").fix({
			float : 'left',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			spacingw : 20,
			spacingh : 240,
			set_scrollsidebar : '.right_grading',
		});
	});
	$(function() {
		$("#Statistic_pie").fix({
			float : 'top',
			//minStatue : true,
			skin : 'green',
			durationTime : false,
			spacingw : 0,
			spacingh : 0,
			close_btn : '.top_close_btn',
			show_btn : '.top_show_btn',
			side_list : '.Statistics',
			close_btn_width : 80,
			side_title : '.Statistic_title',
		});
	});
	/*用户-查看*/
	function member_show(title, url, id, w, h) {
		var param = "uid=" + id;
		$.ajax({
			type : "post",
			url : "${path}/book.s?op=showUserMessage",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					layer_show(title, url, w, h);
					return;
				}
				if (result.code == 0) {
					layer.msg(result.msg, {
						icon : 5,
						time : 1000,
						title : "提示"
					});
					return;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
			}
		});
	}
	/*用户-停用*/
	function member_stop(obj, id) {
		layer.confirm('确认要停用吗？', function(index) {
			var param = "ustate=2&uid=" + id;
			$.ajax({
				type : "post",
				url : "${path}/user.s?op=updateState",
				data : param,
				async : true, // 异步请求
				cache : true, // 设置为 false 将不缓存此页面
				dataType : 'json', // 返回对象
				success : function(result) {
					if (result.code == 1) {
						$('#table_menu_list_child').load(
								'${path}/back/user/member_grading_show.jsp');
						layer.msg('已停用!', {
							icon : 1,
							time : 1000
						});
						return;
					}
					if (result.code == 0) {
						layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title : "提示"
						});
						return;
					}
					if (result.code == -1) {
						layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title : "提示"
						});
						return;
					}
				}
			});
		});
	}

	/*用户-启用*/
	function member_start(obj, id) {
		layer.confirm('确认要启用吗？', function(index) {
			var param = "ustate=1&uid=" + id;
			$.ajax({
				type : "post",
				url : "${path}/user.s?op=updateState",
				data : param,
				async : true, // 异步请求
				cache : true, // 设置为 false 将不缓存此页面
				dataType : 'json', // 返回对象
				success : function(result) {
					if (result.code == 1) {
						$('#table_menu_list_child').load(
								'${path}/back/user/member_grading_show.jsp');
						layer.msg('已启用!', {
							icon : 6,
							time : 1000
						});
						return;
					}
					if (result.code == 0) {
						layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title : "提示"
						});
						return;
					}
					if (result.code == -1) {
						layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title : "提示"
						});
						return;
					}
				}
			});
		});
	}
	/*类型查看*/
	function show(type) {
		if (type == "0") {
			type = "";
		}
		var param = "utype=" + type;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=queryUser",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					$('#table_menu_list_child').load(
							'${path}/back/user/member_grading_show.jsp');
					return;
				}
				if (result.code == 0) {
					layer.msg(result.msg, {
						icon : 5,
						time : 1000,
						title : "提示"
					});
					return;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
			}
		});
	}
</script>
<script type="text/javascript">
	//初始化宽度、高度  
	$(".widget-box").height($(window).height());
	$(".page_right_style").width($(window).width() - 220);
	//$(".table_menu_list").width($(window).width()-240);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".widget-box").height($(window).height());
		$(".page_right_style").width($(window).width() - 220);
		//$(".table_menu_list").width($(window).width()-240);
	})
	/**************/
	require.config({
		paths : {
			echarts : '${path}/back/assets/dist'
		}
	});
	require([ 'echarts', 'echarts/theme/macarons', 'echarts/chart/pie', // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
	'echarts/chart/funnel' ], function(ec, theme) {
		var myChart = ec.init(document.getElementById('Statistics'), theme);

		option = {
			title : {
				text : '用户等级统计',
				subtext : '实时更新最新等级',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				x : 'center',
				y : 'bottom',
				data : [ '普通用户', '铁牌用户', '铜牌用户', '银牌用户', '金牌用户', '钻石用户',
						'蓝钻用户', '红钻用户' ]
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : false
					},
					dataView : {
						show : false,
						readOnly : true
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 6200
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [ {
				name : '品牌数量',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : [ {
					value : 1200,
					name : '普通用户'
				}, {
					value : 1100,
					name : '铁牌用户'
				}, {
					value : 1300,
					name : '铜牌用户'
				}, {
					value : 1000,
					name : '银牌用户'
				}, {
					value : 980,
					name : '金牌用户'
				}, {
					value : 850,
					name : '钻石用户'
				}, {
					value : 550,
					name : '蓝钻用户'
				}, {
					value : 220,
					name : '红钻用户'
				},

				]
			} ]
		};
		myChart.setOption(option);
	});
</script>
<script type="text/javascript">
	$(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 2, 3, 4, 5, 6, 7, 9 ]
			} // 制定列不参与排序
			]
		});

		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});

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
</script>
</html>
