<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul,li{
list-style: none;
}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<ul>
		<li>名称：<input id="fLabel" name="fLabel" type="text"/></li>
		<li>链接：<input id="fUrl" name="fUrl" type="text"/></li>
		<li>标签：<input id="fTags" name="fTags" type="text"/></li>
		<li>标签名称之间用 , 隔开 </li>
		<li>描述：<textarea id="fDesc" name="fDesc"></textarea></li>
		<li>
			<input type="button" value="取消" onclick="window.close()"/>
			<input type="button" value="提交" onclick="add()"/>
		</li>
	</ul>
<script type="text/javascript">
function add(){
	//获取页面值
	var fLabel=$('#fLabel').val();
	var fUrl=$('#fUrl').val();
	var fTags=$('#fTags').val();
	var fDesc=$('#fDesc').val();
	
	$.post('favorite.action',{op:'add',fLabel:fLabel,fUrl:fUrl,fTags:fTags,fDesc:fDesc},function(data){
		if(data==1){
			window.close();
		}else{
			alert('添加失败');
		}
	});
}
</script>
</body>
</html>