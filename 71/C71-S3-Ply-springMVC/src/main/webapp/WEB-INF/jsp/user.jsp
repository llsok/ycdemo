<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function ajax(){
	$.post(
		"get.do",
		null,
		function(data){
			alert(data);
			console.info(data);
		}
	);
}

function addOrder(){
	$.post(
		"addOrder.do",
		null,
		function(data){
			alert(data.msg);
			console.info(data);
		}
	);
}
</script>
</head>
<body>
用户页面
<button onclick="ajax()">ajax测试</button>
<button onclick="addOrder()">提交订单</button>

<form action="getBody.do" method="post">
<input name="test">
<input name="test2">
<input name="test1">
<input type="submit" value="getBody">
</form>





</body>
</html>