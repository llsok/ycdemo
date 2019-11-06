<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">
	
	
	<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		body{
			margin:0px;
		}
		h2{
			text-align: center;
		}
	</style>
	
	<script type="text/javascript">
	function addTab(title, url){
        if ($('#tt').tabs('exists', title)){
            $('#tt').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tt').tabs('add',{
                title:title,
                content:content,
                closable:true
            });
        }
    }
		
	</script>
</head>
<body>

	<h2>每日一讲</h2>
	<div style="margin:20px 0;"></div>
	<div class="easyui-layout" style="width:100%;height:600px;">
		<div data-options="region:'south',split:true" style="height:50px;"></div>
		<!-- 工具箱 -->
		<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>
		<div data-options="region:'west',split:true" title="导航菜单" style="width:150px;">
			<div class="easyui-accordion" data-options="selected:false" style="width:100%;height:100%;">
				<div title="Menu" style="padding:10px;">
					<ul class="easyui-tree">
						<li >
							<a onclick="addTab('apple','apple.jsp')">apple</a>
						</li>
						
						<li>
							<a onclick="addTab('orange','orange.jsp')">orange</a>
						</li>
						
					</ul>
				</div>
			
				<div title="Help" style="padding:10px;">
					<ul class="easyui-tree">
						<li>
							<span >关于 </span>
							<ul>
								<li>
									<a onclick="addTab('about','about.jsp')">版本信息</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div data-options="region:'center',title:'主操作区'" >
			<div id="tt" class="easyui-tabs" style="width:100%;height:100%">
				<div title="主页" style="margin:100px 400px"><img src="../images/th.jpg"></div>
			</div>
		</div>
	</div>
</body>
</html>