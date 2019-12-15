<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书信息编辑</title>
<script type="text/javascript" src="/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
table {
	font-size: 20px;
}
</style>
</head>
<body>
	<h1>图书信息编辑</h1>
	
	<form:form modelAttribute="book" method="post" action="modify" enctype="multipart/form-data"  >
		<form:input type="hidden" name="bookId" path="bookId" value="${empty book? param.bookId : book.bookId }"/>
		<table>
			<tr>
				<td>书名：</td>
				<td><form:input name="bookName" path="bookName"
					value="${empty book ? param.bookName : book.bookName }"/></td>
			</tr>
			<tr>
				<td>出版社：</td>
				<td><form:input name="bookPress" path="bookPress"
					value="${empty book ? param.bookPress : book.bookPress }"/></td>
			</tr>
			<tr>
				<td>出版时间：</td>
				<td><form:input name="pressDate" path="pressDate"
					value="${empty book ? param.pressDate : book.pressDate }"
					type="date"/></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><form:input name="bookAuthor" path="bookAuthor"
					value="${empty book ? param.bookAuthor : book.bookAuthor }"/></td>
			</tr>
			<tr>
				<td>图片</td>
				<td>
					<img style="width: 70px; height: 90px;"
					 src="${empty book? param.bookImage : book.bookImage }" />
					 <form:input type="hidden" name="bookImage" path="bookImage"/>
				</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td>数量：</td>
				<td><form:input name="bookCount" path="bookCount"
					value="${empty book ? param.bookCount : book.bookCount }"
					type="number"/></td>
			</tr>
		</table>
		<input class="btn_input" type="button" value="取消" onclick="history.back()"> 
		<input class="btn_input" type="submit" value="保存">
	</form:form>


</body>
</html>