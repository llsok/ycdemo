<%@page import="java.util.*"%>
<%@page import="com.yc.damai.util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div class="span6">
	<div class="hotProductCategory">
			<%
				String csSql = "select * from categorysecond";
				List<Map<String,Object>> cslist = DBHelper.selectList(csSql);
				// 从页面上下文对象中获取  主类 列表
				List<Map<String,Object>> clist1 = (List<Map<String,Object>>)pageContext.getAttribute("clist");
				// clist 在上面查询过了
				for(Map<String,Object> c : clist1) {
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