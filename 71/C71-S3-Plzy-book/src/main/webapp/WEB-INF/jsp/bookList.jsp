<%@page import="com.book.bean.Book"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书列表</title>
<style type="text/css">
*{
font-size:20px
}
</style>
</head>

<script type="text/javascript" src="/jquery/jquery-3.4.1.min.js"></script>
<script>

Date.prototype.format = function(fmt) { 
     var o = { 
        "M+" : this.getMonth()+1,                 //月份 
        "d+" : this.getDate(),                    //日 
        "h+" : this.getHours(),                   //小时 
        "m+" : this.getMinutes(),                 //分 
        "s+" : this.getSeconds(),                 //秒 
        "q+" : Math.floor((this.getMonth()+3) /3), //季度 
        "S"  : this.getMilliseconds()             //毫秒 
    }; 
    if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    }
     for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
         }
     }
    return fmt; 
} 

function del(bookid){
	if(confirm("确认删除该图书？")){
		$.post("del_"+bookid,null,function(data){
			console.log(data);
			alert(data);
			location.reload();
		})
	}
}
function toEdit(bookid){
	window.location.href="edit_"+bookid;
}
function fuzzyQuery(){
	$.post("fuzzyQuery",$("#fuzzyQueryForm").serialize(),function(data){
		console.log(data);
		
		var str="";
		for(var i=0;i<data.length;i++){
			var date = new Date(data[i].pressDate).format("yyyy-MM-dd");
			str+=
			"<tr style=\"background:gray\">"
				+"<td>ID</td>"
				+"<td>书名</td>"
				+"<td>出版社</td>"
				+"<td>出版时间</td>"
				+"<td>作者</td>"
				+"<td>图片</td>"
				+"<td>数量</td>"
				+"<td>操作</td>"
			+"</tr>"
			+"<tr>"+
				"<td>"+data[i].bookId+"</td>"
				+"<td><a href=\"bookShow.jsp?bookid="+data[i].bookId+"\">"+data[i].bookName+"</a></td>"
				+"<td>"+data[i].bookPress+"</td>"
				+"<td>"+date+"</td>"
				+"<td>"+data[i].bookAuthor+"</td>"
				+"<td><img style=\"width:70px;height:90px;\" src=\""+data[i].bookImage+"\"</td>"
				+"<td>"+data[i].bookCount+"</td>"
				+"<td>"
					+"<input type=\"submit\" value=\"修改\" onclick=\"toEdit("+data[i].bookId+")\">"
					+"<input type=\"submit\" value=\"删除\" onclick=\"del("+data[i].bookId+")\"> " 
				+"</td>"
			+"</tr>";
		}
		$("#tab").html(str);
	})
}
</script>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	//获取属性“bookList”
	List<Book> bookList=(List<Book>)request.getAttribute("bookList");
%>
<body>
<h1>图书列表</h1>
	<form id="fuzzyQueryForm" method="post" onsubmit="return false" >
	书名：<input name="qbookname" value="${param.qbookname}"> 
	出版社：<input  name="qbookpress" value="${param.qbookpress}"> 
	作者：<input name="qbookauthor" value="${param.qsbookauthor}"> 
	<input type="submit" value="查询" onclick="fuzzyQuery()"> 
	</form>
<input type ="submit" value="添加" onclick="toEdit(0)">

	<table id="tab" border="1px"  width="1100px">
		<tr style="background:gray">
			<td>ID</td>
			<td>书名</td>
			<td>出版社</td>
			<td>出版时间</td>
			<td>作者</td>
			<td>图片</td>
			<td>数量</td>
			<td>操作</td>
		</tr>
		<%
			for (Book book : bookList) {
		%>
		
			<tr>
				<td><%=book.getBookId()%></td>
				<td><a href="bookShow.jsp?bookid=<%=book.getBookId()%>"><%=book.getBookName()%></a></td>
				<td><%=book.getBookPress()%></td>
				<td><%=book.getPressDate()%></td>
				<td><%=book.getBookAuthor()%></td>
				<td><img style="width:70px;height:90px;" src="<%=book.getBookImage() %>"/> </td>
				<td><%=book.getBookCount()%></td>
				<td><input  type="submit"  value="修改" onclick="toEdit(<%=book.getBookId()%>)"> 
				<input type="submit" value="删除" onclick="del(<%=book.getBookId()%>)"></td>
			</tr>
		
		<%
			}
		%>

	</table>

</body>
</html>