<%@page import="com.yc.novel.common.DbHelper"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.novel.util.Page"%>
<%@page import="com.yc.novel.biz.NovelBiz"%>
<%@page import="com.yc.novel.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>起点小说</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript">
	function check(){
		var name= document.getElementById("bookname").value;
		var author= document.getElementById("author").value;
		if(name != "" && author != "" ){
			location.href='index.jsp?name='+name+'&author='+author;
		}else if(name == ""  && author != "" ){
			location.href='index.jsp?author='+author;
		}else if(name != ""  && author == "" ){
			location.href='index.jsp?name='+name;
		}else {
			location.href='index.jsp';
		}
	}
</script>
</head>
<body>
	<div id="ball_header" class="ball_header">
		<div class="header_01" id="header_01">
			<img src="img/index.jpg" title="起点小说"
				style="width: 200px; height: 50px;" />
		</div>
		<%
			String paramNumber = request.getParameter("page");
			String name = null;
			String author = null;
			StringBuffer bf = new StringBuffer();
			Novel novel = new Novel();
			if(request.getParameter("name") != null){
				name = new String(request.getParameter("name").getBytes("ISO8859-1"), "utf-8");  
				novel.setNname(name);
				bf.append("&name="+name);
			}
			if(request.getParameter("author") != null){
				author = new String(request.getParameter("author").getBytes("ISO8859-1"), "utf-8");  
				novel.setAuthor(author);
				bf.append("&author="+author);
			}
			NovelBiz biz = new NovelBiz();
			List<Novel> list = biz.selectAll(novel);
			int point = 0;//记录数据库是否有重复的值
			//两层for循环 判断数据库的数据是否有重复的
			for(int i=0;i<list.size();i++){
				for(int j=i+1;j<list.size();j++){
					if(list.get(i).hashCode() == list.get(j).hashCode() && list.get(i).equals(list.get(j))){
						list.remove(j);//将相同的元素移出
						//此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
						point = 1;
						j--;
					}
				}
			}
			if(point ==  1){
				//将数据的数据删除
				int deNum = biz.delete();
				//重新添加
				for(Novel oldNovel : list){
					int inNum = biz.insert(oldNovel);
				}
				point = 0;
			}
			// 第几页
			int iPage = paramNumber == null ? 1 : Integer.parseInt(paramNumber);
			// 查询总行数
			Page pPage =  DbHelper.selectPageForMysql(iPage, 12,novel);
		%>
		<div class="header_04" id="header_04">
			<a href="upload.jsp">上传数据 </a>
		</div>
		<div class="header_03" id="header_03">
			<label>书名：</label>
			<input type="text" name="bookname" id="bookname" value="<%=name == null ? "":name %>" />
			<label>作者：</label>
			<input type="text" name="author" id="author" value="<%=author == null ? "":author %>"/>
			<input type="button"class="header_03_bt" onclick=check() value="查询">
		</div>

	</div>
	<div id="ball_middle" class="ball_middle">
		<table class="ball_table01" id="ball_table01" width="100%"
			cellspacing="0" cellpadding="0" bordercolor="#ADD3EF" border="1">
			<tr>
				<td>小说类型</td>
				<td>书名</td>
				<td>点击数</td>
				<td>作者</td>
				<td>发布时间</td>
			</tr>
			<%
			for(Novel m : pPage.getData()){
				// 将 商品 map 添加到页面上下文中， 就是用 EL 表达式输出值
				pageContext.setAttribute("t", m);
			%>
			<tr>
				<td>${t.ntype}</td>
				<td>${t.nname}</td>
				<td>${t.clickNum}</td>
				<td>${t.author}</td>
				<td>${t.dateStr}</td>
			</tr>
			<%} %>
		</table>
		<div id="ball_footer" class="ball_footer">
				<a class="firstPage" href="index.jsp?page=1<%=bf.toString()%>">首页</a>
				<a class="previousPage" href="index.jsp?page=<%=pPage.getPreviousPage()%><%=bf.toString()%>">上一页</a>
				<a class="nextPage" href="index.jsp?page=<%=pPage.getNextPage()%><%=bf.toString()%>">下一页</a>
				<a class="lastPage" href="index.jsp?page=<%=pPage.getLastPage()%><%=bf.toString()%>">尾页</a>
				第<%=pPage.getPage()%>/<%=pPage.getLastPage()%>
		</div>
	</div>

</body>

</html>