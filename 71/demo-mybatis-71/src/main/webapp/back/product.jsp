<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品管理</title>
<link rel="stylesheet" type="text/css" href="http://47.106.66.89/helper/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="http://47.106.66.89/helper/js/easyui/themes/icon.css">
<script type="text/javascript" src="http://47.106.66.89/helper/js/jquery.min.js"></script>
<script type="text/javascript" src="http://47.106.66.89/helper/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="http://47.106.66.89/helper/js/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

function fmtHot(value,row,index){
	// 格式化
	return value==0? "非热卖" : "热卖";
}

function fmtImage(value,row,index){
	// products/1/cs10001.jpg 
	return "<img src='../"+value+"' height='40px'>";
}


</script>
</head>
<body>

<table id="dg" class="easyui-datagrid" title="商品查询"
		data-options="
			fit:true,
			rownumbers:true,
			singleSelect:true,
			url:'请填写你查询商品的URL地址',
			method:'get',
			toolbar:'#tb'">
	<thead>
		<tr>
			<th data-options="field:'pid',width:80">ID</th>
			<th data-options="field:'pname',width:200">名称</th>
			<th data-options="field:'marketPrice',width:100">商场价</th>
			<th data-options="field:'shopPrice',width:100">商城价</th>
			<th data-options="field:'image',width:100,formatter:fmtImage">图片</th>
			<th data-options="field:'pdate',width:200">上架日期</th>
			<th data-options="field:'isHot',width:100,formatter:fmtHot">热卖标志</th>
		</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div>
		<table>
		<tr><td>
		<p>
			<input class="easyui-textbox" style="width:240px" label="名称： " labelAlign="right">
			<input class="easyui-datebox" style="width:240px" label="上架日期：" labelAlign="right">
			<input class="easyui-datebox" style="width:240px" label="至： " labelAlign="right">
		<p>
			<select class="easyui-combobox" style="width:240px" label="商城价格： " labelAlign="right">
				<option>--请选择--</option>
				<option>百元以下</option>
				<option>101 ~ 500</option>
				<option>501 ~ 1000</option>
				<option>1001 ~ 5000</option>
				<option>5001 ~ 10000</option>
				<option>万元以上</option>
			</select>
			<select class="easyui-combobox" style="width:240px" label="图片： " labelAlign="right">
				<option>--请选择--</option>
				<option>已传图片</option>
				<option>未上传图片</option>
			</select>
			<input class="easyui-checkbox" label="热卖：" labelAlign="right">
			<input class="easyui-checkbox" label="非热卖：" labelAlign="right">
		<p>
			<div style="margin: 7px">
				<input class="easyui-checkbox" label="女装男装：" labelAlign="right">
				<input class="easyui-checkbox" label="鞋靴箱包：" labelAlign="right">
				<input class="easyui-checkbox" label="运动户外：" labelAlign="right">
				<input class="easyui-checkbox" label="珠宝配饰：" labelAlign="right">
				<input class="easyui-checkbox" label="手机数码：" labelAlign="right">
				<input class="easyui-checkbox" label="家电办公：" labelAlign="right">
				<input class="easyui-checkbox" label="护肤彩妆：" labelAlign="right">
			</div>
		</td><td style="padding: 5px 20px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" style="width:100px"> 查 询 </a>
		</td></tr>
		</table>
	</div>
</div>
<!-- 
	11.04 作业：实现商品查询


 -->
</body>
</html>