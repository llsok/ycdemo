<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品管理</title>
<!-- 相对路径 -->
<link rel="stylesheet" type="text/css" href="../js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">
<!-- 绝对路径 -->
<script type="text/javascript" src="/demo-damai-76/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/demo-damai-76/js/easyui/jquery.easyui.min.js"></script>
<!-- 国际化js文件 -->
<script type="text/javascript" src="<%=application.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

function edit(){
	// 获取表格当前选中的行  row 就是  Product 实体对象   ===》 json 对象
	var row = $("#dg").datagrid("getSelected");
	if(row == null){
		$.messager.alert('系统提示','请选择要编辑的服装','error');
		return;
	}
	$('#dlg').dialog('open');
	// 将改行数据填写到表单控件中
	$("#editForm").form('load',row);
}

function add(){
	// 获取表格当前选中的行  row 就是  Product 实体对象   ===》 json 对象
	$('#dlg').dialog('open');
	// 将改行数据填写到表单控件中
	$("#editForm").form('clear');
}

</script>
</head>
<body>

<table id="dg" class="easyui-datagrid" title="DataGrid Complex Toolbar"
		data-options="
			fit:true,
			rownumbers:true,
			singleSelect:true,
			url:'../product.s?op=query',
			method:'get',
			toolbar:'#tb'">
	<thead>
		<tr>
			<th data-options="field:'pid',width:80">ID</th>
			<th data-options="field:'pname',width:100">名称</th>
			<th data-options="field:'shop_price',width:100">商场价</th>
			<th data-options="field:'image',width:100">图片</th>
			<th data-options="field:'pdate',width:100">日期</th>
			<th data-options="field:'is_hot',width:100">热卖标志</th>
		</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
	</div>
	<div>
		Date From: <input class="easyui-datebox" style="width:80px">
		To: <input class="easyui-datebox" style="width:80px">
		Language: 
		<select class="easyui-combobox" panelHeight="auto" style="width:100px">
			<option value="java">Java</option>
			<option value="c">C</option>
			<option value="basic">Basic</option>
			<option value="perl">Perl</option>
			<option value="python">Python</option>
		</select>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add()">新增</a>
	</div>
</div>

<!-- 对话框：商品信息编辑 -->
<div id="dlg" class="easyui-dialog" title="Basic Dialog" 
	data-options="iconCls:'icon-save',closed:true" 
	style="width:400px;height:400px;padding:10px">
	<form action="????" id="editForm">
	<input class="easyui-textbox" name="pid" style="width:300px"
		data-options="label:'商品ID：'">
	<input class="easyui-textbox" name="pname" style="width:300px"
		data-options="label:'名称：'">
	<input class="easyui-textbox" name="shop_price" style="width:300px" type="number"
		data-options="label:'商城价：'">
	</form>
</div>













</body>
</html>