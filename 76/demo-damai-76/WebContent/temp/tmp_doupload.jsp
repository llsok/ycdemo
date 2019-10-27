<%@page import="java.util.ArrayList"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>处理上传请求</title>
</head>
<body>
<%
	// 创建文件上传对象
	SmartUpload su = new SmartUpload();
	// 初始化，传入页面上下文对象
	su.initialize(pageContext);
	// 设置上传的配置信息
	// 限定文件名后缀
	su.setAllowedFilesList("jpg,png,gif,bmp");
	// 限定大小
	su.setMaxFileSize(1024 * 1024 * 10);
	// 执行上传
	su.upload();
	
	Files files = su.getFiles();
	
	ArrayList<String> fileList = new ArrayList<String>();
	
	for(int i=0; i<files.getCount();i++){
		String filename = files.getFile(i).getFileName();
		
		// 使用application（应用上下文对象） web路径 转换成 磁盘路径
		// /upload  ==> d:/dev/tomcat/webapps/damai/uplpad
		String diskPath = application.getRealPath("/upload");
		files.getFile(i).saveAs(diskPath+"/"+filename);
		// 讲上传的文件的web路径添加到集合中
		fileList.add("upload/" + filename);
	}

%>

文件上传成功！

<%for(String filepath : fileList) {%>
	<img alt="" src="<%=filepath%>" width="200px">
<%} %>

</body>
</html>