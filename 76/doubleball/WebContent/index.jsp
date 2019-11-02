<%@page import="com.yc.damai.biz.LotteryBiz"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.damai.dao.LotteryDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.yc.damai.bean.Lottery"%>
<%@page import="com.yc.damai.common.DbHelper"%>
<%@page import="com.yc.damai.util.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>好运双色球</title>
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function check(){
		var id = document.getElementById("select").value;
		location.href='index.jsp?id='+id;
		
	}
	function back(){
		location.href='index.jsp';
	}
	
</script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<body>
	<div id="ball_header" class="ball_header">
		<div class="header_01" id="header_01">
			<img src="img/index.jpg" title="双色球开奖信息"
				style="width: 50px; height: 50px;" /> <span class="title_span01"
				id="title_span01">双色球开奖信息</span>
		</div>
		<div class="header_02" id="header_02">
			<span>[每周二、四、日开奖]</span>
		</div>
		<div class="header_04" id="header_04">
			<a  href="upload.jsp">上传数据</a>
		</div>
		<%
			String paramNumber = request.getParameter("page");
			String pid = request.getParameter("id");
			int id ;
			if(pid != null){
				 id = Integer.parseInt(pid);
			}else{
				id = 0;
			}
			// 第几页
			int iPage = paramNumber == null ? 1 : Integer.parseInt(paramNumber);
			// 查询总行数
			Page pPage =  DbHelper.selectPageForMysql(iPage, 12,id);
			LotteryBiz biz = new LotteryBiz();
			Lottery lottery = null;
			List<Lottery> list = biz.query(lottery);
			
		%>
		<div class="header_03" id="header_03">
			第 <select id="select" class="easyui-combobox" name="language" style="width:100px;">
				<option><%=id == 0? "":id %></option>
				<%
				for(Lottery p : list){
				%>
				<option><%=p.getNum()%></option>
				<%} %>
			</select> 期
			<input type="button" class="header_03_bt" onclick=check() value="查询">
			<input type="button" class="header_03_bt" onclick=back() value="刷新">
		</div>

	</div>
	<div id="ball_middle" class="ball_middle">
		<table class="ball_table01" id="ball_table01" width="100%"
			cellspacing="0" cellpadding="0" bordercolor="#ADD3EF" border="1">
			
			<tr>
				<td>期数</td>
				<td>开奖时间</td>
				<td>开奖号码</td>
				<td>一等奖中奖注数</td>
				<td>二等奖中奖注数</td>
				<td>本期销量</td>
			</tr>
			
			<tr>
			<%
			for(Lottery m : pPage.getData()){
				// 将 商品 map 添加到页面上下文中， 就是用 EL 表达式输出值
				pageContext.setAttribute("t", m);
			%>
			<td><a href="detail.jsp?id=${t.num}">${t.num}</a></td>
				<td>${t.opendate }</td>
				<td>${t.redone } ${t.redtwo } ${t.redthree } ${t.redfour } ${t.redfive } ${t.redsix } ${t.blue }</td>
				<td>${t.firstprize }</td>
				<td>${t.secondeprize }</td>
				<td>${t.sale}</td>
			</tr> 
			<%} %>
		</table>
		
		<div id="ball_footer" class="ball_footer">
				<a class="firstPage" href="index.jsp?page=1&id=<%=id%>">首页</a>
				<a class="previousPage" href="index.jsp?page=<%=pPage.getPreviousPage()%>&id=<%=id%>">上一页</a>
				<a class="nextPage" href="index.jsp?page=<%=pPage.getNextPage()%>&id=<%=id%>">下一页</a>
				<a class="lastPage" href="index.jsp?page=<%=pPage.getLastPage()%>&id=<%=id%>">尾页</a>
				第<%=pPage.getPage()%>/<%=pPage.getLastPage()%>
		</div>
	</div>
</body>
</html>