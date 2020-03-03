<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>????</title>
<style type="text/css">
img{
	width:300px;
}

</style>
</head>
<!-- $ is not defined  jquery js 引用错误-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function uploadImgs() {
		var formData = new FormData(ff);
		$.ajax({
			type : "POST",
			url : 'upload_ajax.do',
			data : formData,
			processData : false,
			contentType : false,
			success : function(imgList) {
				img1.src = imgList[0];
				img2.src = imgList[1];
				img3.src = imgList[2];
			}
		});
	}
</script>
<body>
	<h1>Please upload a file</h1>
	<form id="ff" method="post" action="upload.do" enctype="multipart/form-data">
		<input type="text" name="name" /><br> 
		<!-- Html5 新增属性  multiple="multiple" 支持文件多选 -->
		<input type="file" name="file" multiple="multiple"/><br> 
		<input type="submit" value="表单文件上传" />
		<input type="button" value="AJAX文件上传" onclick="uploadImgs()"/>
	</form>
	<hr>
	<form method="get" action="reg.do">
		<input type="text" name="username" /><br> 
		<input type="text" name="regtime" /><br> <!-- 2020-03-03 -->
		<input type="submit" value="注册" />
	</form>
	<hr>
	<img id="img1" alt="" src="">
	<img id="img2" alt="" src="">
	<img id="img3" alt="" src="">
</body>
</html>