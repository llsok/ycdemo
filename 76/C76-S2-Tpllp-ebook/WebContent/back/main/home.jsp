<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>易书网后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/css/style.css" />
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="${path}/back/assets/css/font-awesome.min.css" />
<link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
<script src="${path}/back/assets/js/ace-extra.min.js"></script>
<script src="${path}/back/assets/js/jquery.min.js"></script>
<script src="${path}/back/assets/dist/echarts.js"></script>
<script src="${path}/back/assets/js/bootstrap.min.js"></script>
<title></title>
</head>
<body >
	<div class="page-content clearfix">
		<div class="alert alert-block alert-success">
			<button type="button" class="close" data-dismiss="alert">
				<i class="icon-remove"></i>
			</button>
			<i class="icon-ok green"></i>
			欢迎使用
			<strong class="green">易书网后台管理系统<small>(v1.2)</small></strong>
			,你本次登录时间为${date[0] }年${date[1] }月${date[2] }日${date[3] }时${date[4] }分
		</div>
		<div class="state-overview clearfix">
			<div class="col-lg-3 col-sm-6">
				<section class="panel"> <a href="${path}/back/user/user_list.jsp" title="商城用户">
					<div class="symbol terques">
						<i class="icon-user"></i>
					</div>
					<div class="value">
						<h1>${customerAll.size()}</h1>
						<p>书城用户</p>
					</div>
				</a> </section>
			</div>
			<div class="col-lg-3 col-sm-6">
				<section class="panel"><a href="${path}/back/book/Products_List.jsp" title="书籍管理">
				<div class="symbol red">
					<i class="icon-tags"></i>
				</div>
				<div class="value">
					<h1>${bookAll.size() }</h1>
					<p>书籍数量</p>
				</div>
				</section>
			</div>
			<div class="col-lg-3 col-sm-6">
				<section class="panel"><a href="${path}/back/order/Orderform.jsp" title="商城订单">
				<div class="symbol yellow">
					<i class="icon-shopping-cart"></i>
				</div>
				<div class="value">
					<h1>${eorderAll.size() }</h1>
					<p>书籍订单</p>
				</div>
				</section>
			</div>
			<div class="col-lg-3 col-sm-6">
				<section class="panel"><a href="${path}/back/order/Amounts.jsp" title="交易记录">
				<div class="symbol blue">
					<i class="icon-bar-chart"></i>
				</div>
				<div class="value">
					<h1>￥${eorderTotal }</h1>
					<p>交易金额</p>
				</div>
				</section>
			</div>
		</div>
		<!--实时交易记录-->
		<div class="clearfix">
			<div class="Order_Statistics ">
				<div class="title_name">订单统计信息</div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="name">未处理订单：</td>
							<td class="munber"><a href="${path}/back/order/Order_handling.jsp">${eorderCount[0]}</a>&nbsp;个</td>
						</tr>
						<tr>
							<td class="name">待发货订单：</td>
							<td class="munber"><a href="${path}/back/order/Order_handling.jsp">${eorderCount[1]}</a>&nbsp;个</td>
						</tr>
						<tr>
							<td class="name">待结算订单：</td>
							<td class="munber"><a href="${path}/back/order/Order_handling.jsp">${eorderCount[2]}</a>&nbsp;个</td>
						</tr>
						<tr>
							<td class="name">已成交订单数：</td>
							<td class="munber"><a href="${path}/back/order/Order_handling.jsp">${eorderCount[3]}</a>&nbsp;个</td>
						</tr>
						<tr>
							<td class="name">交易失败：</td>
							<td class="munber"><a href="${path}/back/order/Refund.jsp">${eorderCount[4]}</a>&nbsp;个</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="Order_Statistics">
				<div class="title_name">书籍统计信息</div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="name">书籍总数：</td>
							<td class="munber"><a href="${path}/back/book/Products_List.jsp">${bookAll.size() }</a>&nbsp;本</td>
						</tr>
						<tr>
							<td class="name">售罄书籍：</td>
							<td class="munber"><a href="${path}/back/book/Products_List.jsp">${bookCount[0] }</a>&nbsp;本</td>
						</tr>
						<tr>
							<td class="name">上架书籍：</td>
							<td class="munber"><a href="${path}/back/book/Products_List.jsp">${bookCount[1] }</a>&nbsp;本</td>
						</tr>
						<tr>
							<td class="name">下架书籍：</td>
							<td class="munber"><a href="${path}/back/book/Products_List.jsp">${bookCount[2] }</a>&nbsp;本</td>
						</tr>
						<tr>
							<td class="name">商品评论：</td>
							<td class="munber"><a href="${path}/back/book/#">2176</a>&nbsp;条</td>
						</tr>

					</tbody>
				</table>
			</div>
			<%-- <div class="Order_Statistics">
				<div class="title_name">会员登录统计信息</div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="name">注册会员登录：</td>
							<td class="munber"><a href="${path}/back/#">3240</a>&nbsp;次</td>
						</tr>
						<tr>
							<td class="name">新浪会员登录：</td>
							<td class="munber"><a href="${path}/back/#">1130</a>&nbsp;次</td>
						</tr>
						<tr>
							<td class="name">支付宝登录：</td>
							<td class="munber"><a href="${path}/back/#">1130</a>&nbsp;次</td>
						</tr>
						<tr>
							<td class="name">QQ会员登录：</td>
							<td class="munber"><a href="${path}/back/#">1130</a>&nbsp;次</td>
						</tr>
					</tbody>
				</table>
			</div> --%>
			<div class="news_style">
				<div class="title_name">最新公告</div>
				<ul class="list">
					<c:if test="${noticeAll.size()> 0}" var="flag" scope="session">
						<c:forEach items="${noticeAll}" var="n">
							<li><i class="icon-bell red"></i><a href="${path}/notice-detail.jsp?nid=${n.nid}">${n.ntitle }</a></li>
						</c:forEach>
					</c:if>
					
					<c:if test="${not flag}">
					   	<li><i class="icon-bell red"></i>暂无新公告</li>
					</c:if>
				</ul>
			</div>
		</div>
		<!--记录-->
		<div class="clearfix">
			<div class="home_btn">
				<div>
					<a href="${path}/back/book/picture-add.jsp" title="添加书籍"
						class="btn  btn-info btn-sm no-radius"> <i class="bigger-200"><img
							src="${path}/back/images/icon-addp.png" /></i>
						<h5 class="margin-top">添加书籍</h5>
					</a> <a href="${path}/back/book/product-category-add.jsp" title="书籍分类"
						class="btn  btn-primary btn-sm no-radius"> <i
						class="bigger-200"><img src="${path}/back/images/icon-cpgl.png" /></i>
						<h5 class="margin-top">书籍分类</h5>
					</a> <a href="${path}/back/admin/admin_info.jsp" title="个人信息"
						class="btn  btn-success btn-sm no-radius"> <i
						class="bigger-200"><img src="${path}/back/images/icon-grxx.png" /></i>
						<h5 class="margin-top">个人信息</h5>
					</a> <a href="${path}/back/system/Systems.jsp" title="系统设置"
						class="btn  btn-info btn-sm no-radius"> <i class="bigger-200"><img
							src="${path}/back/images/xtsz.png" /></i>
						<h5 class="margin-top">系统设置</h5>
					</a> <a href="${path}/back/order/Order_handling.jsp" title="书籍订单"
						class="btn  btn-purple btn-sm no-radius"> <i
						class="bigger-200"><img src="${path}/back/images/icon-gwcc.png" /></i>
						<h5 class="margin-top">书籍订单</h5>
					</a> <a href="${path}/back/advertising/advertising.jsp" title="添加广告"
						class="btn  btn-pink btn-sm no-radius"> <i class="bigger-200"><img
							src="${path}/back/images/icon-ad.png" /></i>
						<h5 class="margin-top">添加广告</h5>
					</a> <a href="${path}/back/notice/article_add.jsp" title="添加公告"
						class="btn  btn-info btn-sm no-radius"> <i class="bigger-200"><img
							src="${path}/back/images/icon-addwz.png" /></i>
						<h5 class="margin-top">添加公告</h5>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.no-radius').on('click', function() {
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
	$(document).ready(function() {
		$(".t_Record").width($(window).width() - 640);
		//当文档窗口发生改变时 触发  
		$(window).resize(function() {
			$(".t_Record").width($(window).width() - 640);
		});
	});
</script>
