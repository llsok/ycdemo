<%@page import="java.util.*"%>
<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>大麦商城</title>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<link href="css/product.css" rel="stylesheet" type="text/css"/>
</head>
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
				
				
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="login.jsp">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="reg.jsp">注册</a>|
				</li>
				
				
				
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a>[退出]</a>|
				</li>
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
					
					<%
						String cSql = "select * from category";
						List<Map<String,Object>> clist = DBHelper.selectList(cSql);
						for(Map<String,Object> row : clist) {
					%>
					<li><a href="clist.jsp?cid=<%=row.get("cid")%>"><%=row.get("cname")%></a>|</li>
					<%}%>
							
		</ul>
	</div>


</div>
<div class="container productList">
	

		<div class="span6">
			<div class="hotProductCategory">
				<%
					String csSql = "select * from categorysecond";
					List<Map<String,Object>> cslist = DBHelper.selectList(csSql);
					// clist 在上面查询过了
					for(Map<String,Object> c : clist) {
				%>			
				<dl>
					<dt>
						<a href="???"><%=c.get("cname") %></a>
					</dt>
					<%for(Map<String,Object> cs : cslist){%>
						<%if(cs.get("cid").equals(c.get("cid"))){%>
						<dd>
							<a href="???"><%=cs.get("csname") %></a>
						</dd>
						<%} %>
					<%} %>
				</dl>
				<%} %>
		</div>
</div>
		
		<div class="span18 last">
			
			<form id="productForm" action="image/蔬菜 - Powered By Mango Team.htm" method="get">
				<input type="hidden" id="brandId" name="brandId" value=""/>
				<input type="hidden" id="promotionId" name="promotionId" value=""/>
				<input type="hidden" id="orderType" name="orderType" value=""/>
				<input type="hidden" id="pageNumber" name="pageNumber" value="1"/>
				<input type="hidden" id="pageSize" name="pageSize" value="20"/>
					
				<div id="result" class="result table clearfix">
						<ul>
						
						<li>
										<a href="detail.jsp?1">
											<img src="products/1/cs10001.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 韩版连帽加厚毛衣女外套
											</span>
											 
											<span class="price">
												商城价： ￥228.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?2">
											<img src="products/1/cs10002.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 女装立领长袖拼接PU皮毛呢外套
											</span>
											 
											<span class="price">
												商城价： ￥172.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?3">
											<img src="products/1/cs10003.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 韩版女装翻领羔绒夹棉格子毛呢外套
											</span>
											 
											<span class="price">
												商城价： ￥119.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?4">
											<img src="products/1/cs10004.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 韩版女装翻领羔绒夹棉格子毛呢外套
											</span>
											 
											<span class="price">
												商城价： ￥119.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?5">
											<img src="products/1/cs10005.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 韩版女装翻领羔绒夹棉格子毛呢外套
											</span>
											 
											<span class="price">
												商城价： ￥119.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?6">
											<img src="products/1/cs10006.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 冬装韩版女装翻领羔绒夹棉格子毛呢外套
											</span>
											 
											<span class="price">
												商城价： ￥119.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?7">
											<img src="products/1/cs10007.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 新款优雅奢华毛领白鸭绒轻薄羽绒服
											</span>
											 
											<span class="price">
												商城价： ￥590.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?8">
											<img src="products/1/cs10008.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 秋冬季毛呢外套女中长款圆领小香风呢子大衣
											</span>
											 
											<span class="price">
												商城价： ￥336.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?9">
											<img src="products/1/cs10009.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 女装貉子毛大衣 时尚修身长袖淑女毛呢外套
											</span>
											 
											<span class="price">
												商城价： ￥119.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?10">
											<img src="products/1/cs10010.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 修身显瘦淑女针织长袖打底连衣裙女
											</span>
											 
											<span class="price">
												商城价： ￥158.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?72">
											<img src="products/1/cs10011.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 冬季新款大码女装修身加厚棉打底连衣裙女
											</span>
											 
											<span class="price">
												商城价： ￥125.0/份
											</span>
											 
										</a>
									</li>
						
						<li>
										<a href="detail.jsp?11">
											<img src="products/1/cs20001.jpg" width="170" height="170"  style="display: inline-block;"/>
											   
											<span style='color:green'>
											 整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮
											</span>
											 
											<span class="price">
												商城价： ￥9900.0/份
											</span>
											 
										</a>
									</li>
						
						</ul>
				</div>
	
	<div class="pagination">
	第1/6
	
	
				
					<span class="currentPage">1</span>
				
				
			
				
				
					<a href="clist.jsp?1&pageIndex=2">2</a>
				
			
				
				
					<a href="clist.jsp?1&pageIndex=3">3</a>
				
			
				
				
					<a href="clist.jsp?1&pageIndex=4">4</a>
				
			
				
				
					<a href="clist.jsp?1&pageIndex=5">5</a>
				
			
				
				
					<a href="clist.jsp?1&pageIndex=6">6</a>
				
			
				
			
				<a class="nextPage" href="clist.jsp?1&pageIndex=2">&nbsp;</a>
				<a class="lastPage" href="clist.jsp?1&pageIndex=6">&nbsp;</a>
				
	</div>
			</form>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势"/>
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a >诚聘英才</a>
						|
					</li>
					<li>
						<a >法律声明</a>
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
						<a  target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a >SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body></html>