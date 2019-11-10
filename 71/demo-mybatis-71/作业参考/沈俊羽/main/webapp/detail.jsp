<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.yc.damai.dao.MyBatisHelper"%>
<%@page import="com.yc.damai.bean.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/jsp; charset=UTF-8"/>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/product.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<title>大麦商城</title>
</head>
<%
Integer id= Integer.parseInt(request.getParameter("id"));
SqlSession sess= MyBatisHelper.getSession();
Product product= sess.selectOne("com.yc.damai.dao.ProductMapper.selectById",id);
sess.close();
session.setAttribute("product", product);
%>
<body>

<div class="container header">
	
<div class="span5">
		<div class="logo">
			<a href="index.jsp">
				<img src="image/r___________renleipic_01/logo.png" alt="依依不舍"/>
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
	<img src="image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
</div>	</div>
<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				
				
					<%
						User user = (User) session.getAttribute("user");
						if(user!=null){
					%>
							<li id="headerUsername" class="headerUsername" style="display: list-item;"><%=user.getUsername()%>|</li>
							<li id="headerLogin" class="headerLogin"
								style="display: list-item;"><a href="olist.jsp">我的订单</a>|</li>
							<li id="headerLogout" class="headerLogout" style="display: list-item;"><a href="index.jsp">[退出]</a>|</li>
					<%
					}else{
					%>
							<li id="headerLogin" class="headerLogin"
								style="display: list-item;"><a href="login.jsp">登录</a>|</li>
							<li id="headerRegister" class="headerRegister"
								style="display: list-item;"><a href="reg.jsp">注册</a>|</li>
					<%
					}
					%>
						<li>
							<a>会员中心</a>
							|
						</li>
						<li>
							<a>购物指南</a>
							|
						</li>
						<li>
							<a>关于我们</a>
							
						</li>
			</ul>
		</div>
		<div class="cart">
			<a  href="cart.jsp">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>96008/53277764</strong>
			</div>
	</div>
	


<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="index.jsp">首页</a>
						|
					</li>
					
					<li>
<a href="clist.jsp?1&pageIndex=1">
					女装男装
</a>
					|</li>
					
					<li>
<a href="clist.jsp?2&pageIndex=1">
					鞋靴箱包
</a>
					|</li>
					
					<li>
<a href="clist.jsp?3&pageIndex=1">
					运动户外
</a>
					|</li>
					
					<li>
<a href="clist.jsp?4&pageIndex=1">
					珠宝配饰
</a>
					|</li>
					
					<li>
<a href="clist.jsp?5&pageIndex=1">
					手机数码
</a>
					|</li>
					
					<li>
<a href="clist.jsp?6&pageIndex=1">
					家电办公
</a>
					|</li>
					
					<li>
<a href="clist.jsp?7&pageIndex=1">
					护肤彩妆
</a>
					|</li>
							
		</ul>
	</div>


</div>
<div class="container productContent">

	

		<div class="span6">
			<div class="hotProductCategory">
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=1">女装男装</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=1">潮流女装</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=2">初冬羽绒</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=3">毛呢大衣</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=4">温暖毛衣</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=5">精选男装</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=6">冬季外套</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=7">羽绒服</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=2">鞋靴箱包</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=9">女鞋</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=10">短靴</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=11">男鞋</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=12">女包</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=13">男包</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=14">服饰配件</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=3">运动户外</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=15">运动鞋</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=16">运动服</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=17">户外运动</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=18">健身装备</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=19">骑行装备</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=4">珠宝配饰</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=20">珠宝首饰</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=21">时尚饰品</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=22">品质手表</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=23">眼镜配饰</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=5">手机数码</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=24">手机</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=25">平板</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=26">电脑</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=27">相机</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=6">家电办公</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=28">大家电</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=29">厨房电器</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=30">生活电器</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=31">个户电器</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=32">办公耗材</a>
									</dd>
							
						</dl>
			
						<dl>
							<dt>
								<a href="clist.jsp?cid=7">护肤彩妆</a>
							</dt>
							
									<dd>
										<a href="clist.jsp?csid=33">美容护肤</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=34">强效保养</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=35">超值彩妆</a>
									</dd>
							
									<dd>
										<a href="clist.jsp?csid=36">换季保养</a>
									</dd>
							
						</dl>
			
		</div>
</div>
	
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg" rel="gallery">
						<div class="zoomPad"><img style="opacity: 1;" title="" class="medium" src="<%=product.getImage() %>"><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
					</a>
				
			</div>
			<div class="name"><%=product.getPname() %></div>
			<div class="sn">
				<div>编号：<%=product.getPid() %></div>
			</div>
			<div class="info">
				<dl>
					<dt>商城价:</dt>
					<dd>
						<strong>￥：<%=product.getShopPrice() %>元/份</strong>
							参 考 价：
							<del>￥<%=product.getMarketPrice() %>元/份</del>
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
					<form action="doAddCart.jsp" method="post">
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
						<%=product.getPdesc() %>
						<br /><br />
						<img src="<%=product.getImage() %>" align="middle"/>
					</div>
				</div>
				
				
				
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body>
</html>