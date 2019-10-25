<%@page import="java.util.*"%>
<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
					<%if(session.getAttribute("loginedUser")==null){%>
						<a href="login.jsp">登录</a>|
					<%} else { %>
						<%-- JSP 注释 ：使用 EL 表达式 输出 session 中的 loginedUser 的 username --%>
						${loginedUser.username}|
					<%} %>
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="olist.jsp">我的订单</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="index.jsp">退出</a>|
				</li>
				
				
				
				
				<li id="headerUsername" class="headerUsername">
					${loginedUser.username}
				</li>
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
						pageContext.setAttribute("clist", clist);
						for(Map<String,Object> row : clist) {
					%>
					<li><a href="clist.jsp?cid=<%=row.get("cid")%>"><%=row.get("cname")%></a>|</li>
					<%}%>
							
		</ul>
	</div>


</div>