<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/css/style.css" />
<link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/back/assets/css/font-awesome.min.css" />
<link href="${path}/back/Widget/icheck/icheck.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/back/Widget/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
<link href="${path}/back/css/button.css" rel="stylesheet"
	type="text/css" />
<title>新增书籍</title>
</head>
<body>
	<div class="type_title">新增书籍</div>
		<form class="form form-horizontal" id="form-article-add">
			<div class="clearfix cl">
				<label class="form-label col-2"><span class="c-red">*</span>书名：</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						placeholder="请输入至少两个字符至多五十个的汉字" id="bname" name="bname"
						style="margin-left: 40px;width:600px;">
						<span id="bnameTishi"></span>
				</div>
			</div>
			<div class=" clearfix cl">

				<div class="Add_p_s">
					<label class="form-label col-2">所属大学:</label>
					<div class="formControls col-2">
						<span class="select-box"> <select class="select"
							id="buniversity" name="buniversity">
								<option>请选择</option>
								<c:forEach items="${userUni}" var="uni">
									<option >${uni }</option>
								</c:forEach>
						</select>
						</span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">所属学院:</label>
					<div class="formControls col-2">
						<span class="select-box"> <select class="select"
							id="bucollege" name="bucollege">
								<option>请选择</option>
								<c:forEach items="${userUcol}" var="ucl">
									<option >${ucl }</option>
								</c:forEach>
						</select>
						</span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">所属专业:</label>
					<div class="formControls col-2">
						<span class="select-box"> <select class="select"
							name="bumajor" id="bumajor">
								<option>请选择</option>
								<c:forEach items="${userUmar}" var="uma">
									<option>${uma }</option>
								</c:forEach>
						</select>
						</span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">所属年级:</label>
					<div class="formControls col-2">
						<span class="select-box"> <select class="select"
							id="bclass" name="bclass">
								<option>请选择</option>
								<option value="大一">大一</option>
								<option value="大二">大二</option>
								<option value="大三">大三</option>
								<option value="大四">大四</option>
						</select>
						</span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">所属类别:</label>
					<div class="formControls col-2">
						<span class="select-box"> <select class="select"
							id="btid" name="btid">
								<option>请选择</option>
								<c:forEach items="${btypes}" var="bty">
									<option value="${bty.btid}">${btTypeEdit[bty.btid] }</option>
								</c:forEach>
						</select>
						</span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">所属系列:</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" placeholder="请输入字符或汉字"
							id="btemp" name="btemp" >
							<span id="btempTishi"></span>
					</div>
				</div>

				<div class="Add_p_s">
					<label class="form-label col-2">作&nbsp;&nbsp;&nbsp;&nbsp;者：</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" 
							placeholder="请输入字符或汉字" id="bauthor" name="bauthor">
							<span id="bauthorTishi"></span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">*价&nbsp;&nbsp;&nbsp;&nbsp;格:</label>
					<div class="formControls col-2">
						<input type="text" class="input-text"  
							placeholder="请输入数字" id="bprice" name="bprice">元
							<span id="bpriceTishi"></span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">库&nbsp;&nbsp;&nbsp;&nbsp;存:</label>
					<div class="formControls col-2">
						<input type="number" class="input-text" id="bnum" name="bnum" 
							>本
							<span id="bnumTishi"></span>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">上传时间:</label>
					<div class="formControls col-2">
						<input class="inline laydate-icon" id="bdate" name="bdate"
							type="date" style="width: 150px;" 
							>
					</div>
				</div>
				<div style="display: none;">
					<input type="text" id="img_path" name="img_path">
				</div>
			</div>
			<div class="clearfix cl">
				<label class="form-label col-2">图片上传：</label>
				<div class="formControls col-10">
					<div class="uploader-list-container">
						<div class="queueList">
							<div id="dndArea" class="placeholder">
									<img id="imghead" name="imghead"border=0 src="${bookDetail.bimg }" 
									style="width:300px;height:200px;"/>
								<div class="new-contentarea tc">
									<a href="javascript:void(0)" class="upload-img"><label
										for="upload-file">点击选择图片</label></a> <input type="file" class=""
										name="upload-file" id="upload-file" onblur="upImg();" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix cl">
				<label class="form-label col-2">描述：</label>
				<div class="formControls col-10">
					<textarea rows="3" cols="30" id="bcontent" name="bcontent">
				</textarea>
				</div>
			</div>
			<div class="clearfix cl">
				<div class="Button_operation">
					<input class="btn btn-primary radius" type="button" onclick="addBook()";
						id="btn btn-primary radius" value="保存并提交审核">
					<button
						onClick="window.location.href='${path}/back/book/Products_List.jsp';return false;"
						class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script src="${path}/back/assets/js/bootstrap.min.js"></script>
<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/icheck/jquery.icheck.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/ueditor/1.4.3/ueditor.all.min.js">
	
</script>
		<script src="${path}/back/assets/layer/layer.js" type="text/javascript"></script>
<script src="${path}/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${path}/back/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="${path}/back/js/lrtk.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript" src="${path}/back/js/H-ui.admin.js"></script>
	<script>
/********添加书籍的输入框失去焦点正则判断********/
$("#bname").on('input',function(){
	var bname = $("#bname").val().replace(/\ +/g,"");
	var param ="bname="+bname;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=checkBname",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#bnameTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#bnameTishi").text(result.msg).css("color", 'red');
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
$("#btemp").on('input',function(){
	var btemp = $("#btemp").val().replace(/\ +/g,"");
	var param ="btemp="+btemp;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=checkBtemp",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#btempTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#btempTishi").text(result.msg).css("color", 'red');
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
$("#bauthor").on('input',function(){
	var bauthor = $("#bauthor").val().replace(/\ +/g,"");
	var param ="bauthor="+bauthor;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=checkBauthor",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#bauthorTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#bauthorTishi").text(result.msg).css("color", 'red');
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
$("#bprice").on('input',function(){
	var bprice = $("#bprice").val().replace(/\ +/g,"");
	var param ="bprice="+bprice;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=checkBprice",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#bpriceTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#bpriceTishi").text(result.msg).css("color", 'red');
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
//库存
$("#bnum").on('input',function(){
	var bnum = $("#bnum").val().replace(/\ +/g,"");
	var param ="bnum="+bnum;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=checkBnum",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$("#bnumTishi").text(result.msg).css("color", 'green');
					return;
	        	}
	        	if(result.code == 0){
	        		$("#bnumTishi").text(result.msg).css("color", 'red');
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
$(function() { 
	$("#add_picture").fix({
		float : 'left',
		skin : 'green',	
		durationTime :false,
		stylewidth:'220',
		spacingw:0,
		spacingh:260,
	});
});
$( document).ready(function(){
//初始化宽度、高度
  
   $(".widget-box").height($(window).height()); 
   $(".page_right_style").height($(window).height()); 
   $(".page_right_style").width($(window).width()-220); 
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	 $(".widget-box").height($(window).height()); 
	 $(".page_right_style").height($(window).height()); 
	 $(".page_right_style").width($(window).width()-220); 
	});	
}); 
/******书籍数据保存数据库********/

function upImg(){
	// js 获取文件对象
	var fileObj = document.getElementById("upload-file").files[0]; // js 获取文件对象
	var form = new FormData(); // FormData 对象
    form.append("file", fileObj); // 文件对象
	$.ajax({
        url:'${path}/book.s?op=uploadImage', 
        type:'post',
        data: form,
        contentType: false,
        processData: false,
        success:function(result){
        	if(result.code == 1){
        		document.getElementById("imghead").src =result.data;
        		document.getElementById("img_path").value =result.data;
			}
        }
    });
}
function addBook(){
	var param = $('#form-article-add').serialize();
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=add",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					layer.msg(result.msg, {
						icon :6,
						time : 1000,
						title: "提示"
					});
					$("#bnumTishi").text(""); 
                	$("#btempTishi").text(""); 
                	$("#bnameTishi").text(""); 
                	$("#bauthorTishi").text(""); 
                	$("#bpriceTishi").text(""); 
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
	        	 if(result.code == -2){
	        		 layer.msg(result.msg, {
							icon : 5,
							time : 1000,
							title: "提示"
							});
	                	var check = result.data.split("/");
	                	if(check[1] == "-1"){
	                		$("#bnameTishi").text("书名未输入或不合法！！！").css("color", 'red'); 
	                	}
	                	if(check[2] == "-1"){
							$("#bpriceTishi").text("价格未输入或不合法！！！").css("color", 'red'); 
						}
						if(check[3] == "-1"){
							$("#bauthorTishi").text("作者未输入或不合法！！！").css("color", 'red'); 
	                	}
						if(check[4] == "-1"){
							$("#bauthorTishi").text("库存未输入或不合法！！！").css("color", 'red'); 
	                	}
						return ;
	                }
			}
		});
}
</script>

</body>
</html>