<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/index.css"/>
	<script src="${path}/js/main.js"></script>
<title>易书网</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="help-wrap">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lhoption/help.jsp">帮助中心</a> >
			<a href="${path}/back/lhoption/help.jsp">如何买书</a>
		</div>
		<div class="help-l fl">
			<div class="help-item">
				<div class="help-item-title">关于我们
					<a href="javascript:void(0)" class="abs"></a>
				</div>
				<div class="help-item-list">
					<ul>
						<li><a href="${path}/back/lhoption/help.jsp">自我介绍</a></li>
						<li><a href="${path}/back/lhoption/help.jsp">联系我们</a></li>
						<li><a href="${path}/back/lhoption/help.jsp">网站公告</a></li>
					</ul>
				</div>
			</div>
			<div class="help-item">
				<div class="help-item-title">新手指南
					<a href="javascript:void(0)" class="abs"></a>
				</div>
				<div class="help-item-list">
					<ul>
						<li><a href="${path}/back/lhoption/help.jsp">如何买书</a></li>
						<li><a href="${path}/back/lhoption/help.jsp">如何卖书</a></li>
						<li><a href="${path}/back/lywoption/password.jsp">修改密码</a></li>
					</ul>
				</div>
			</div>
			<div class="help-item">
				<div class="help-item-title">配送方式
					<a href="javascript:void(0)" class="abs"></a>
				</div>
				<div class="help-item-list">
					<ul>
						<li><a href="${path}/back/lhoption/help.jsp">配送范围</a></li>
						<li><a href="${path}/back/lhoption/help.jsp">配送时间</a></li>
					</ul>
				</div>
			</div>
			<div class="help-item">
				<div class="help-item-title">售后服务
					<a href="javascript:void(0)" class="abs"></a>
				</div>
				<div class="help-item-list">
					<ul>
						<li><a href="${path}/back/lhoption/help.jsp">退款申请</a></li>
						<li><a href="${path}/back/lhoption/help.jsp">退换货处理</a></li>
						<li><a href="${path}/back/lhoption/help.jsp">退换货政策</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="help-r fr">
			<div class="help-item-title">如何买书</div>
			<div class="help-main">
				<h2>1.注册登录</h2>
				<p>第一步：点击易书网首页顶部免费注册进入注册页面。</p>
				<img src="${path}/images/help1.png" alt=""/>
				<p>第二步：您可通过邮箱/手机号码进行注册，按照提示填写准确信息，点击提交“立即注册”。</p>
				<img src="${path}/images/help2.JPG" alt=""/>
				<p>第三步：注册完成后，点击易书网首页顶部“登录”正常登录账户即可。</p>
				<h2>2.搜索商品</h2>
				<p>第一步：搜索自己想要的书籍</p>
				<img src="${path}/images/help3.png" alt=""/>
				<p>第二步：选好进入详情</p>
				<h2>3.购买书籍</h2>
				<p>第一步：点击购买即可</p>
				<img src="${path}/images/step4.png" alt=""/>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>