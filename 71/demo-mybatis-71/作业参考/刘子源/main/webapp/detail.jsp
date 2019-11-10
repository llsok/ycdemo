<%@page import="com.lzy.damai.bean.Product"%>
<%@page import="com.lzy.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/product.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<title>大麦商城</title>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container productContent">

	

		<div class="span6">
			<div class="hotProductCategory">
			
						<dl>
							<dt>
								<a href="clist.html?cid=1">女装男装</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=1">潮流女装</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=2">初冬羽绒</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=3">毛呢大衣</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=4">温暖毛衣</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=5">精选男装</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=6">冬季外套</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=7">羽绒服</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.html?cid=2">鞋靴箱包</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=9">女鞋</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=10">短靴</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=11">男鞋</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=12">女包</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=13">男包</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=14">服饰配件</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.html?cid=3">运动户外</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=15">运动鞋</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=16">运动服</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=17">户外运动</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=18">健身装备</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=19">骑行装备</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.html?cid=4">珠宝配饰</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=20">珠宝首饰</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=21">时尚饰品</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=22">品质手表</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=23">眼镜配饰</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.html?cid=5">手机数码</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=24">手机</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=25">平板</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=26">电脑</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=27">相机</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.html?cid=6">家电办公</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=28">大家电</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=29">厨房电器</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=30">生活电器</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=31">个户电器</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=32">办公耗材</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.html?cid=7">护肤彩妆</a>
							</dt>
							
									<dd>
										<a href="clist.html?csid=33">美容护肤</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=34">强效保养</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=35">超值彩妆</a>
									</dd>
							
									<dd>
										<a href="clist.html?csid=36">换季保养</a>
									</dd>
							
						</dl>
			
		</div>
</div>
	<% 
				String pid=request.getParameter("pid");
				SqlSession sess = MyBatisHelper.getSession();
				Product p=sess.selectOne("com.lzy.damai.dao.ProductMapper.selectBypid",pid);
			%>
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg" rel="gallery">
						<div class="zoomPad"><img style="opacity: 1;" title="" class="medium" src="<%= p.getImage() %>"><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
					</a>
				
			</div>
			
			
			
			<div class="name"><%= p.getPname()%></div>
			<div class="sn">
				<div>编号：<%=p.getPid() %></div>
			</div>
			<div class="info">
				<dl>
					<dt>商城价:</dt>
					<dd>
						<strong>￥：<%= p.getShopPrice()%>元/份</strong>
							参 考 价：
							<del>￥<%= p.getMarketPrice() %>元/份</del>
					</dd>
				</dl>
					<dl>
						<dt>促销:</dt>
						<dd>
								<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
						</dd>
					</dl>
					<dl>
						<dt>    </dt>
						<dd>
							<span>    </span>
						</dd>
					</dl>
			</div>
				<div class="action">
					<form action="cart.jsp?pid=<%=pid %>&uid=<%=request.getParameter("uid") %>" method="post">
						<input type="hidden" name="pid" value="1"/>
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input id="quantity" name="count" value="1" maxlength="4" onpaste="return false;" type="text">
								<div>
									<span id="increase" class="increase">&nbsp;</span>
									<span id="decrease" class="decrease">&nbsp;</span>
								</div>
							</dd>
							<dd>
								件
							</dd>
						</dl>
					<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="submit">
					</div>
				</form>
				</div>
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="#introduction">商品介绍</a>
						</li>
						
				</ul>
			</div>
				
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong>商品介绍</strong>
					</div>
					<div>
						<%= p.getPdesc() %>
						<br /><br />
						<img src="<%= p.getImage() %>" align="middle"/>
					</div>
				</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body>
</html>