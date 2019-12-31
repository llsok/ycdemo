<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易书网后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="${path}/back/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${path}/back/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${path}/back/css/style.css" />
<script src="${path}/back/assets/js/ace-extra.min.js"></script>
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	if ("ontouchend" in document)
		document
				.write("<script src='${path}/back/assets/js/jquery.mobile.custom.min.js'>"
						+ "<"+"script>");
</script>
<script src="${path}/back/assets/js/bootstrap.min.js"></script>
<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script src="${path}/back/assets/js/ace-elements.min.js"></script>
<script src="${path}/back/assets/js/ace.min.js"></script>
<script src="${path}/back/assets/layer/layer.js" type="text/javascript"></script>
<script src="${path}/back/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="${path}/back/js/jquery.nicescroll.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		var cid = $('#nav_list> li>.submenu');
		cid.each(function(i) {
			$(this).attr('id', "Sort_link_" + i);

		})
	})
	jQuery(document)
			.ready(
					function() {
						$.each($(".submenu"), function() {
							var $aobjs = $(this).children("li");
							var rowCount = $aobjs.size();
							var divHeigth = $(this).height();
							$aobjs.height(divHeigth / rowCount);
						});
						//初始化宽度、高度

						$("#main-container").height($(window).height() - 76);
						$("#iframe").height($(window).height() - 140);

						$(".sidebar").height($(window).height() - 99);
						var thisHeight = $("#nav_list").height(
								$(window).outerHeight() - 173);
						$(".submenu").height();
						$("#nav_list").children(".submenu").css("height",
								thisHeight);

						//当文档窗口发生改变时 触发  
						$(window).resize(
								function() {
									$("#main-container").height(
											$(window).height() - 76);
									$("#iframe").height(
											$(window).height() - 140);
									$(".sidebar").height(
											$(window).height() - 99);

									var thisHeight = $("#nav_list").height(
											$(window).outerHeight() - 173);
									$(".submenu").height();
									$("#nav_list").children(".submenu").css(
											"height", thisHeight);
								});
						$(document)
								.on(
										'click',
										'.iframeurl',
										function() {
											var cid = $(this).attr("name");
											var cname = $(this).attr("title");
											$("#iframe").attr("src", cid)
													.ready();
											$("#Bcrumbs").attr("href", cid)
													.ready();
											$(".Current_page a").attr('href',
													cid).ready();
											$(".Current_page")
													.attr('name', cid);
											$(".Current_page").html(cname).css(
													{
														"color" : "#333333",
														"cursor" : "default"
													}).ready();
											$("#parentIframe")
													.html(
															'<span class="parentIframe iframeurl"> </span>')
													.css("display", "none")
													.ready();
											$("#parentIfour").html('').css(
													"display", "none").ready();
										});

					});
	$(document).on('click', '.link_cz > li', function() {
		$('.link_cz > li').removeClass('active');
		$(this).addClass('active');
	});

	/*********************点击事件*********************/
	$(document).ready(
			function() {
				$('#nav_list,.link_cz').find('li.home').on(
						'click',
						function() {
							$('#nav_list,.link_cz').find('li.home')
									.removeClass('active');
							$(this).addClass('active');
						});
				//时间设置
				function currentTime() {
					var d = new Date(), str = '';
					str += d.getFullYear() + '年';
					str += d.getMonth() + 1 + '月';
					str += d.getDate() + '日';
					str += d.getHours() + '时';
					str += d.getMinutes() + '分';
					str += d.getSeconds() + '秒';
					return str;
				}

				setInterval(function() {
					$('#time').html(currentTime)
				}, 1000);
				//修改密码
				$('#Exit_system').on('click', function() {
					layer.confirm('是否确定退出系统？', {
						btn : [ '是', '否' ],//按钮
						icon : 2,
					}, function() {
						$.ajax({
				            type: "post",
				            url: "${path}/show.s?op=quit",
				            data: "",
				            async:true, // 异步请求
				            cache:true, // 设置为 false 将不缓存此页面
				            dataType: 'json', // 返回对象
				            success: function(result) {
				            	if(result.code == 1){
				            		location.href="join.jsp";
				            		return;
				            	}
				            }
						});
					});
				});
			});
	function link_operating(name, title) {
		var cid = $(this).name;
		var cname = $(this).title;
		$("#iframe").attr("src", cid).ready();
		$("#Bcrumbs").attr("href", cid).ready();
		$(".Current_page a").attr('href', cid).ready();
		$(".Current_page").attr('name', cid);
		$(".Current_page").html(cname).css({
			"color" : "#333333",
			"cursor" : "default"
		}).ready();
		$("#parentIframe")
				.html('<span class="parentIframe iframeurl"> </span>').css(
						"display", "none").ready();
		$("#parentIfour").html('').css("display", "none").ready();

	}
</script>
</head>
<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <img
						src="${path}/back/images/logo.png" width="470px">
				</small>
				</a>
			</div>
			<div class="navbar-header operating pull-left"></div>
			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle">
						 <span class="time"><em id="time"></em></span>
							<span class="user-info"><small>欢迎光临,</small>${loginedUser.uname }</span>
							<i class="icon-caret-down"></i>
					</a>
						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="javascript:void(0)" name="${path}/back/system/Systems.jsp"
								title="系统设置" class="iframeurl"><i class="icon-cog"></i>网站设置</a></li>
							<li><a href="javascript:void(0)" name="${path}/back/admin/admin_info.jsp"
								title="个人信息" class="iframeurl"><i class="icon-user"></i>个人资料</a></li>
							<li class="divider"></li>
							<li><a href="javascript:ovid(0)" id="Exit_system"><i
									class="icon-off"></i>退出</a></li>
						</ul></li>
					<li class="purple"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"><i class="icon-bell-alt"></i><span
							class="badge badge-important">8</span></a>
						<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-warning-sign"></i>8条通知</li>
							<li>
							<a name="${path}/back/message/Guestbook.jsp"
							href="javascript:void(0)" class="iframeurl">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-pink icon-comments-alt"></i>
											最新留言
										</span> <span class="pull-right badge badge-info">+12</span>
									</div>
							</a></li>
							<li><a name="${path}/back/order/Order_handling.jsp"
									href="javascript:void(0)" class="iframeurl">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
											新订单
										</span> <span class="pull-right badge badge-success">+8</span>
									</div>
							</a></li>

							<li><a name="${path}/back/message/Feedback.jsp"
							href="javascript:void(0)" class="iframeurl"
							>
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-info icon-twitter"></i> 用户反馈
										</span> <span class="pull-right badge badge-info">+11</span>
									</div>
							</a></li>

							<li><a name="${path}/back/notice/article_list.jsp"
							href="javascript:void(0)" class="iframeurl"> 查看所有通知 <i class="icon-arrow-right"></i>
							</a></li>
						</ul></li>


				</ul>
			</div>
		</div>
	</div>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<a class="btn btn-success"> <i class="icon-signal"></i>
						</a> <a class="btn btn-info"> <i class="icon-pencil"></i>
						</a> <a class="btn btn-warning"> <i class="icon-group"></i>
						</a> <a class="btn btn-danger"> <i class="icon-cogs"></i>
						</a>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->
				<div id="menu_style" class="menu_style">
					<ul class="nav nav-list" id="nav_list">
						<li class="home"><a href="javascript:void(0)"
							name="home.jsp" class="iframeurl" title=""><i
								class="icon-home"></i><span class="menu-text"> 系统首页 </span></a></li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-desktop"></i><span class="menu-text"> 书籍管理 </span><b
								class="arrow icon-angle-down"></b></a>
								<c:if test="${adminControl.contains(Long.parseLong('1'))}" var="flag" scope="session">
									<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/book/Products_List.jsp" title="书籍类表" class="iframeurl"><i
												class="icon-double-angle-right"></i>书籍类表</a></li>
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/book/product-category-add.jsp" title="分类管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>分类管理</a></li>
									</ul>
								</c:if>
								<c:if test="${not flag}">
									<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											title="书籍类表" class="iframeurl"><i
											class="icon-double-angle-right"></i>书籍类表</a></li>
										<li class="home"><a href="javascript:void(0)"
										 	class="iframeurl"><i
											class="icon-double-angle-right"></i>分类管理</a></li>
									</ul>
								</c:if>
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-picture "></i><span class="menu-text"> 图片管理 </span><b
								class="arrow icon-angle-down"></b></a>
								<c:if test="${adminControl.contains(Long.parseLong('4'))}" var="flag" scope="session">
									<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/advertising/advertising.jsp" title="广告管理" class="iframeurl"><i
												class="icon-double-angle-right"></i>广告管理</a></li>
										<%-- <li class="home"><a href="javascript:void(0)"
											name="${path}/back/advertising/Sort_ads.jsp" title="分类管理" class="iframeurl"><i
												class="icon-double-angle-right"></i>分类管理</a></li> --%>
									</ul>
								</c:if>
						<c:if test="${not flag}">
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)"
									title="广告管理" class="iframeurl"><i
										class="icon-double-angle-right"></i>广告管理</a></li>
							</ul>
						</c:if>	
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-list"></i><span class="menu-text"> 交易管理 </span><b
								class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)"
									name="${path}/back/order/transaction.jsp" title="交易信息" class="iframeurl"><i
										class="icon-double-angle-right"></i>交易信息</a></li>
								<li class="home"><a href="javascript:void(0)"
									name="${path}/back/order/Order_Chart.jsp" title="交易订单（图）" class="iframeurl"><i
										class="icon-double-angle-right"></i>交易订单(图)</a></li>
								<li class="home"><a href="javascript:void(0)"
									name="${path}/back/order/Amounts.jsp" title="交易金额" class="iframeurl"><i
										class="icon-double-angle-right"></i>交易金额</a></li>
								<li class="home"><a href="javascript:void(0)"
									name="${path}/back/order/Orderform.jsp" title="订单管理" class="iframeurl"><i
										class="icon-double-angle-right"></i>订单管理</a></li>
								<li class="home"><a href="javascript:void(0)"
									name="${path}/back/order/Order_handling.jsp" title="订单处理" class="iframeurl"><i
										class="icon-double-angle-right"></i>订单处理</a></li>
								<li class="home"><a href="javascript:void(0)"
									name="${path}/back/order/Refund.jsp" title="退款管理" class="iframeurl"><i
										class="icon-double-angle-right"></i>退款管理</a></li>
							</ul>
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-credit-card"></i><span class="menu-text">
									支付管理 </span><b class="arrow icon-angle-down"></b></a>
								<c:if test="${adminControl.contains(Long.parseLong('6'))}" var="flag" scope="session">
									<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/pay/payment_method.jsp" title="支付方式" class="iframeurl"><i
											class="icon-double-angle-right"></i>支付方式</a></li>
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/pay/Payment_Configure.jsp" title="支付配置" class="iframeurl"><i
											class="icon-double-angle-right"></i>支付配置</a></li>
									</ul>
								</c:if>
								<c:if test="${not flag}">
									<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											title="支付方式" class="iframeurl"><i
												class="icon-double-angle-right"></i>支付方式</a></li>
										<li class="home"><a href="javascript:void(0)"
											title="支付配置" class="iframeurl"><i
												class="icon-double-angle-right"></i>支付配置</a></li>
									</ul>
								</c:if>	
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-user"></i><span class="menu-text"> 用户管理 </span><b
								class="arrow icon-angle-down"></b></a>
								<c:if test="${adminControl.contains(Long.parseLong('9'))}" var="flag" scope="session">
									<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/user/user_list.jsp" title="用户列表" class="iframeurl"><i
												class="icon-double-angle-right"></i>用户列表</a></li>
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/user/member-Grading.jsp" title="等级管理" class="iframeurl"><i
												class="icon-double-angle-right"></i>等级管理</a></li>
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/user/integration.jsp" title="用户记录管理" class="iframeurl"><i
												class="icon-double-angle-right"></i>用户记录管理</a></li>
									</ul>
								</c:if>
								<c:if test="${not flag}">
										<ul class="submenu">
											<li class="home"><a href="javascript:void(0)"
												 title="用户列表" class="iframeurl"><i
													class="icon-double-angle-right"></i>用户列表</a></li>
											<li class="home"><a href="javascript:void(0)"
												 title="等级管理" class="iframeurl"><i
													class="icon-double-angle-right"></i>等级管理</a></li>
											<li class="home"><a href="javascript:void(0)"
												title="用户记录管理" class="iframeurl"><i
													class="icon-double-angle-right"></i>用户记录管理</a></li>
			
										</ul>
								</c:if>	
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-comments-alt"></i><span class="menu-text">
									消息管理 </span><b class="arrow icon-angle-down"></b></a>
							<c:if test="${adminControl.contains(Long.parseLong('13'))}" var="flag" scope="session">
								<ul class="submenu">
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/message/Guestbook.jsp" title="留言列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>留言列表</a></li>
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/message/Feedback.jsp" title="意见反馈" class="iframeurl"><i
											class="icon-double-angle-right"></i>意见反馈</a></li>
								</ul>
							</c:if>
							<c:if test="${not flag}">
								<ul class="submenu">
									<li class="home"><a href="javascript:void(0)"
										title="留言列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>留言列表</a></li>
									<li class="home"><a href="javascript:void(0)"
										title="意见反馈" class="iframeurl"><i
											class="icon-double-angle-right"></i>意见反馈</a></li>
								</ul>
							</c:if>	
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-bookmark"></i><span class="menu-text"> 公告管理 </span><b
								class="arrow icon-angle-down"></b></a>
							<c:if test="${adminControl.contains(Long.parseLong('16'))}" var="flag" scope="session">
								<ul class="submenu">
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/notice/article_list.jsp" title="文章列表" class="iframeurl"><i
												class="icon-double-angle-right"></i>公告列表</a></li>
										<li class="home"><a href="javascript:void(0)"
											name="${path}/back/notice/article_Sort.jsp" title="分类管理" class="iframeurl"><i
												class="icon-double-angle-right"></i>公告管理</a></li>
								</ul>
							</c:if>
							<c:if test="${not flag}">
								<ul class="submenu">
									<li class="home"><a href="javascript:void(0)"
										title="文章列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>公告列表</a></li>
									<li class="home"><a href="javascript:void(0)"
										title="分类管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>公告管理</a></li>
								</ul>
							</c:if>	
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-cogs"></i><span class="menu-text"> 系统管理 </span><b
								class="arrow icon-angle-down"></b></a>
							<c:if test="${adminControl.contains(Long.parseLong('19'))}" var="flag" scope="session">
								<ul class="submenu">
									<%-- <li class="home"><a href="javascript:void(0)"
										name="${path}/back/system/Systems.jsp" title="系统设置" class="iframeurl"><i
											class="icon-double-angle-right"></i>系统设置</a></li> --%>
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/system/System_section.jsp" title="系统栏目管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>系统栏目管理</a></li>
	
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/system/System_Logs.jsp" title="系统日志" class="iframeurl"><i
											class="icon-double-angle-right"></i>系统日志</a></li>
								</ul>
							</c:if>
							<c:if test="${not flag}">
								<ul class="submenu">
									<li class="home"><a href="javascript:void(0)"
										class="iframeurl"><i
											class="icon-double-angle-right"></i>系统栏目管理</a></li>
									<li class="home"><a href="javascript:void(0)"
											 title="系统日志" class="iframeurl"><i
											class="icon-double-angle-right"></i>系统日志</a></li>
								</ul>
							</c:if>	
						</li>
						<li><a href="#" class="dropdown-toggle"><i
								class="icon-group"></i><span class="menu-text"> 管理员管理 </span><b
								class="arrow icon-angle-down"></b></a>
							<c:if test="${adminControl.contains(Long.parseLong('22'))}" var="flag" scope="session">
								<ul class="submenu">
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/admin/admin_Competence.jsp" title="权限管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>权限管理</a></li>
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/admin/administrator.jsp" title="管理员列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>管理员列表</a></li>
									<li class="home"><a href="javascript:void(0)"
										name="${path}/back/admin/admin_info.jsp" title="个人信息" class="iframeurl"><i
											class="icon-double-angle-right"></i>个人信息</a></li>
								</ul>
							</c:if>
							<c:if test="${not flag}">
								<ul class="submenu">
								<li class="home"><a href="javascript:void(0)"
									 title="权限管理" class="iframeurl"><i
										class="icon-double-angle-right"></i>权限管理</a></li>
								<li class="home"><a href="javascript:void(0)"
									 title="管理员列表" class="iframeurl"><i
										class="icon-double-angle-right"></i>管理员列表</a></li>
								<li class="home"><a href="javascript:void(0)"
									class="iframeurl"><i
									class="icon-double-angle-right"></i>个人信息</a></li>
							</ul>
							</c:if>	
					</li>
					</ul>
				</div>
				<script type="text/javascript">
					$("#menu_style").niceScroll({
						cursorcolor : "#888888",
						cursoropacitymax : 1,
						touchbehavior : false,
						cursorwidth : "5px",
						cursorborder : "0",
						cursorborderradius : "5px"
					});
				</script>
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>

			<div class="main-content">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i><a href="index.jsp">首页</a>
						</li>
						<li class="active"><span class="Current_page iframeurl"></span></li>
						<li class="active" id="parentIframe"><span
							class="parentIframe iframeurl"></span></li>
						<li class="active" id="parentIfour"><span
							class="parentIfour iframeurl"></span></li>
					</ul>
				</div>

				<iframe id="iframe"
					style="border: 0; width: 100%; background-color: #FFF;"
					name="iframe" frameborder="0" src="home.jsp"> </iframe>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> 固定滑动条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-rtl" /> <label class="lbl"
							for="ace-settings-rtl">切换到左边</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-add-container" /> <label class="lbl"
							for="ace-settings-add-container"> 切换窄屏 <b></b>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--底部样式-->

	<div class="footer_style" id="footerstyle">
		<script type="text/javascript">
			try {
				ace.settings.check('footerstyle', 'fixed')
			} catch (e) {
			}
		</script>
		<p class="l_f">版权所有：源晨76班我是灰太狼</p>
		<p class="r_f">地址：湖南省衡阳市衡花路18号湖南工学院</p>
	</div>
	<!--修改密码样式-->
	<div class="change_Pass_style" id="change_Pass">
		<ul class="xg_style">
			<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input
				name="原密码" type="password" class="" id="password"></li>
			<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input
				name="新密码" type="password" class="" id="Nes_pas"></li>
			<li><label class="label_name">确认密码</label><input name="再次确认密码"
				type="password" class="" id="c_mew_pas"></li>
		</ul>
	</div>
</body>
</html>