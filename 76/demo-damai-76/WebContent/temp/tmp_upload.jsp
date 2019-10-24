<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
</head>
<body>
<!-- enctype 编码格式    method 提交方式  -->
<form action="tmp_doupload.jsp" method="post" enctype="multipart/form-data">

<input type="file" name="file1">
<input type="file" name="file2">
<input type="file" name="file3" multiple>
<input type="submit" value="上传">

</form>
</body>
</html>