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

<%@ include file="/common/header.jsp" %>

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
							<a href="clist.jsp?csid=<%=cs.get("csid")%>"><%=cs.get("csname") %></a>
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
						<%
							String sql = "select a.* from product a join categorysecond b " 
								+ " on a.csid = b.csid"
								+ " where 1=1";
							String cid = request.getParameter("cid");
							String csid = request.getParameter("csid");
							// 第几页
							String pageParam = request.getParameter("page");
							int iPage = pageParam == null ? 1 : Integer.parseInt(pageParam);
							// 每页行数
							int rows = 12;
							
							String queryId;
							if(csid!=null){
								sql += " and b.csid=?";
								queryId = csid;
							} else {
								sql += " and b.cid=?";
								queryId = cid;
							}
							
							DBHelper.Page pPage = DBHelper.selectPageForMysql(sql,iPage,rows, queryId);
							for(Map<String,Object> p : pPage.getData()){
						%>
						
							<li>
								<a href="detail.jsp?1">
									<img src="<%=p.get("image") %>" width="170" height="170"  style="display: inline-block;"/>
									   
									<span style='color:green'>
									 <%=p.get("pname") %>
									</span>
									 
									<span class="price">
										商城价： ￥<%=p.get("shop_price") %>/份
									</span>
									 
								</a>
							</li>
						<%}%>
						
						</ul>
				</div>
	
	<div class="pagination">
		第<%=pPage.getPage() %>/<%=pPage.getLastPage()%>
		
				<% String condition = csid != null ? "csid=" + csid : ("cid=" + cid);%>
	
				<a class="firstPage" href="clist.jsp?<%=condition %>&page=1">&nbsp;</a>
				<a class="previousPage" href="clist.jsp?<%=condition %>&page=<%=pPage.getPreviousPage()%>">&nbsp;</a>
			
					<%for(int i=1; i<=pPage.getLastPage() ; i++){ %>
					
						<%if(pPage.getPage()==i){ %>
							<span class="currentPage"><%=i%></span>
						<%} else { %>
							<a href="clist.jsp?<%=condition %>&page=<%=i%>"><%=i%></a>
						<%} %>
				
					<%} %>
			
				<a class="nextPage" href="clist.jsp?<%=condition %>&page=<%=pPage.getNextPage()%>">&nbsp;</a>
				<a class="lastPage" href="clist.jsp?<%=condition %>&page=<%=pPage.getLastPage()%>">&nbsp;</a>
				
	</div>
			</form>
		</div>
	</div>
	
<jsp:include page="/common/footer.jsp"></jsp:include>

</body></html>