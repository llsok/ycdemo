<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link
	href="${path}/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/back/css/style.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/font-awesome.min.css" />
<link
	href="${path}/back/Widget/icheck/icheck.css"
	rel="stylesheet" type="text/css" />
<title>添加书籍分类</title>
</head>
<body >
<div class="type_style">
 <div class="type_title">书籍类型信息</div>
  <div class="type_content">
  <form class="form form-horizontal" id="form-user-add">
  	<div class="Operate_cont clearfix">
      <label class="form-label" ><span class="c-red"></span>已有分类名:</label>
      <div class="formControls " id="formControls-btypes">
      		<jsp:include page="book_type_show.jsp"></jsp:include>
      </div>
    </div>
    <div class="Operate_cont clearfix" id = "showState">
      <label class="form-label" ><span class="c-red"></span>状&nbsp;&nbsp;&nbsp;&nbsp;态:</label>
      <div class="formControls ">
        	<div class="btn  btn-success" style="margin-left:10px;">
				<input type="button"onclick="updateState()" id="type_state" style="background:none;outline:none;border:0px;width:100px;height:20px;color:white;" value="已启用">
			</div>
      </div>
    </div>
    <div class="Operate_cont clearfix" style="display:none;">
        <input type="text" class="input-text" value="" id="nameid" name="nameid">
    </div>
    <div class="Operate_cont clearfix">
      <label class="form-label" ><span class="c-red">*</span>一级分类名:</label>
      <div class="formControls ">
     	<span class="input-text">&nbsp;&nbsp;&nbsp;&nbsp;教材区</span>
     	<span id="firstTishi"style="margin-left:15px;"></span>
      </div>
    </div>
    <div class="Operate_cont clearfix">
      <label class="form-label"><span class="c-red">*</span>二级分类名:</label>
      <div class="formControls ">
        <input type="text" class="input-text" value="" placeholder="请输入最多10个汉字" id="namesecond" name="namesecond">
      	<span id="secondTishi"style="margin-left:15px;width:200px;"></span>
      </div>
    </div>
    <div class="Operate_cont clearfix">
      <label class="form-label"><span class="c-red"></span>三级分类名:</label>
      <div class="formControls ">
        <input type="text" class="input-text" value="" placeholder="请输入最多10个汉字" id="namethird" name="namethird">
      	<span id="thirdTishi" style="margin-left:15px;width:200px;display:inline-block"></span>
      	</div>
      
    </div>
    
    <div class="Operate_cont clearfix">
		  	<div class="btn  btn-warning" id="add">
		  	 		<i class="icon-edit align-top bigger-125"></i>
					<input onclick = "add()" id="type_add" name="type_add" type="button" class="type-add" style="background:none;outline:none;border:0px;color: white;"value="新增子类型"/>
			</div>
			<div class="btn  btn-success" id="update">
					<i class="icon-ok align-top bigger-125"></i>
					<input onclick = "update()" id="type_update" name="type_update" type="button" class="type-add" style="background:none;outline:none;border:0px;color: white;"value="修改子类型"/>
			</div>
		  <div class="btn  btn-danger" id="delete">
		  	 		<i class="icon-trash   align-top bigger-125"></i>
					<input   id="type_delete" name="type_delete" type="button" class="type-add" style="background:none;outline:none;border:0px;color: white;"value="删除子类型" onclick = "deleteType()"/>
			</div>
 	 </div>
  </form>
  </div>
  </div>
</body>
<script
	src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script
	src="${path}/back/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
		src="${path}/back/Widget/icheck/jquery.icheck.min.js"></script>
	<script type="text/javascript"
		src="${path}/back/Widget/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript"
		src="${path}/back/assets/layer/layer.js"></script>
	<script type="text/javascript"
		src="${path}/back/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${path}/back/js/H-ui.admin.js"></script>
	<script type="text/javascript">

	$(function() {
		$('.skin-minimal input').iCheck({
			checkboxClass : 'icheckbox-blue',
			radioClass : 'iradio-blue',
			increaseArea : '20%'
		});

		$("#form-user-add").Validform({
			tiptype : 2,
			callback : function(form) {
				form[0].submit();
				var index = parent.layer.getFrameIndex(window.name);
				parent.$('.btn-refresh').click();
				parent.layer.close(index);
			}
		});
	});
	//点击赋值
	function gradeChange(){
    	document.getElementById("namesecond").value = "";
    	document.getElementById("namethird").value = "";
		var objS = document.getElementById("btype").value; 
        var  btype  = objS.split("-");
        document.getElementById("nameid").value =btype[0];
        if(btype[btype.length-1] == 1){
        	 document.getElementById("type_state").value ="已启用";
        }else{
        	document.getElementById("type_state").value ="未启用";
        	 document.getElementById("showState").style.background="lightgrey";
        }
        if(btype.length == 5){
        	document.getElementById("namesecond").value = btype[2];
        	document.getElementById("namethird").value = btype[3];
        }else if(btype.length == 4){
        	document.getElementById("namesecond").value = btype[2];
        }
	};
	//更新状态
	function updateState(){
		var state =  document.getElementById("type_state").value;
		if(state == "已启用"){
			state = 1;
		}else{
			state = 0;
		}
		var btid = document.getElementById("nameid").value;
		if(btid == null ){
			layer.msg('请选择更新的类型名!!!', {
				icon : 7,
				time : 1000
				});
			return;
		}
		var param ="btid="+btid+"&state="+state;
		$.ajax({
	        type: "post",
	        url: "${path}/bookType.s?op=update",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#formControls-btypes').load('${path}/back/book/book_type_show.jsp');
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	}
	//更新
	function update(){
		var btid = document.getElementById("nameid").value;
		var btname1 = document.getElementById("namesecond").value;
		var btname2 = document.getElementById("namethird").value;
		if(btid == null ){
			layer.msg('请选择您要更新的类型名!!!', {
				icon : 7,
				time : 1000
				});
			return;
		}
		var param ="btid="+btid+"&namesecond="+btname1+"&namethird="+btname2 ;
		$.ajax({
	        type: "post",
	        url: "${path}/bookType.s?op=update",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#formControls-btypes').load('${path}/back/book/book_type_show.jsp');
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	};
	//添加
	function add(){
		var btname1 = document.getElementById("namesecond").value;
		var btname2 = document.getElementById("namethird").value;
		if(btname1 == null ){
			layer.msg('请选择您要添加的类型名!!!', {
				icon : 7,
				time : 1000
				});
			return;
		}
		var param ="namesecond="+btname1+"&namethird="+btname2 ;
		$.ajax({
	        type: "post",
	        url: "${path}/bookType.s?op=add",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						//需要重新查值和赋值
						$('#formControls-btypes').load('${path}/back/book/book_type_show.jsp');
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	};
	//删除
	function deleteType(){
		var btid = document.getElementById("nameid").value;
		if(btid == null ){
			layer.msg("请选择您要删除的类型名!!!", {
				icon : 7,
				time : 1000
				});
			return;
		}
		var param ="btid="+btid;
		$.ajax({
	        type: "post",
	        url: "${path}/bookType.s?op=delete",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#formControls-btypes').load('${path}/back/book/book_type_show.jsp');
				    	document.getElementById("namesecond").value = "";
				    	document.getElementById("namethird").value = "";	
						layer.msg(result.msg, {
							icon :6,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == 0){
		        	layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
						});
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        	return;
		        	}
				}
			});
	};
	//类型二修改验证
	$("#namesecond").on('input',function(){
		var namesecond = $("#namesecond").val().replace(/\ +/g,"");
		var param ="namesecond="+namesecond;
		$.ajax({
	        type: "post",
	        url: "${path}/bookType.s?op=checkNamesecond",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#secondTishi").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#secondTishi").text(result.msg).css("color", 'red');
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        		return;
		        	}
				}
			});
	});
	//类型三修改验证
	$("#namethird").on('input',function(){
		var namethird = $("#namethird").val().replace(/\ +/g,"");
		var param ="namethird="+namethird;
		$.ajax({
	        type: "post",
	        url: "${path}/bookType.s?op=checkNamethird",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#thirdTishi").text(result.msg).css("color", 'green');
						return;
		        	}
		        	if(result.code == 0){
		        		$("#thirdTishi").text(result.msg).css("color", 'red');
		        		return;
		        	}
		        	if(result.code == -1){
		        		layer.msg(result.msg, {
							icon : 2,
							time : 1000,
							title: "提示"
							});
		        		return;
		        	}
				}
			});
	});
</script>
</html>