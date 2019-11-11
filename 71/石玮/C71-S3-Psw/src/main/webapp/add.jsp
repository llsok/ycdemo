<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Add New Favorite</title>

	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.7.0/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.7.0/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.7.0/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	
</head>
<body>
<form name="favForm" method="post" action="/cang/fav.do;jsessionid=FF8C0487A99814B144B07E5633524A0F">
      <input type="hidden" name="op" value="toList" />
    
    <div class="banner" valign="top">
    	 搜藏
    </div>
</form>
	<form action="doadd.jsp" method="post" id="ff" style="line-height: 40px">
	名称   : <input id="fName" name="fName" value="百度" type="text" style="width: 300px"><br>
	链接   : <input id= "fUrl" name="fUrl" value="http://www.baidu.com	" type="text" style="width: 300px"><br>
	Tag : <input id="fTags" name="fTags" value="" type="text"style="width: 300px"><br>
		<a style="color: red;">可以写多个，用，隔开</a><br>
	描述:	  <input id ="fDesc" name= "fDesc" type="text" style="width: 300px;height: 90px"> 	
	<br>
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="submit()">提交</a>
	<a href="#" class="easyui-linkbutton" onclick="goback()" >取消</a>
	
	</form>
	
			
<script type="text/javascript">

function submit(){
	$('#ff').form('submit',{
		onSubmit:function(param){
			
			
		},
		success:function(data){
			//data是服务器返回的字符串
			eval("var d = "+data+";");
		
			if(d.code==1){
				$.messager.show({
					title:'系统提示',
					msg:d.msg,
					timeout:2000,
					showType:'slide'
				});
			
			}else{
				$.messager.alert('系统提示',d.msg,'error');
			}
		}
	});
	
	
}
function goback(){
	
}


</script>
</body>
</html>