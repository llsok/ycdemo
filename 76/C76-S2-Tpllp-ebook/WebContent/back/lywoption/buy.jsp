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
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script src="${path}/back/assets/js/bootstrap.min.js"></script>
<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/icheck/jquery.icheck.min.js"></script>
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
<script type="text/javascript"
	src="${path}/back/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="${path}/back/js/lrtk.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript" src="${path}/back/js/H-ui.admin.js"></script>

<title>填写订单</title>
</head>
<body >
	<div class="page_right_style" id="page_right_style">
		<div class="type_title">填写订单</div>
		<div id="user-buy-order">
		<form class="form form-horizontal"
			id="form-article-add">
			<div class="clearfix cl">
				<label class="form-label col-2"><span class="c-red">*</span>地&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						placeholder="请输入地址" id="eoaddr" name="eoaddr" value="${eorderMessage['eoaddr'] }"
						style="margin-left: 10px; width:600px;">
						<span id="eoaddrTishi" style="margin-left: 10px;"></span>
				</div>
			</div>
			
			<div class=" clearfix cl">
				<div class="clearfix cl" id ="showleft">
					<img id="imghead" name="imghead"border=0 src="${customerOrderAdd['bimg']}" 
										style="width:300px;height:200px; margin-left:100px;"/>
				</div>
				<div id ="showRight">
					<div class="Add_p_s">
						<label class="form-label col-2"><span class="c-red">*</span>收&nbsp;件&nbsp;人:</label>
						<div class="formControls col-2">
							<input type="text" class="input-text"
								placeholder="请输入汉字或字母" id="uname" name="uname" value="${eorderMessage['uname'] }">
							<span id="unameTishi"></span>
					</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2"><span class="c-red">*</span>电&nbsp;&nbsp;&nbsp;&nbsp;话:</label>
						<div class="formControls col-2">
							<input type="text" class="input-text"
								placeholder="请输入11位数字" id="uphone" name="uphone" value="${eorderMessage['uphone'] }">
							<span id="uphoneTishi"></span>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">数&nbsp;&nbsp;&nbsp;&nbsp;量:</label>
						<div class="formControls col-2">
							<input type="number" class="input-text"
								id="count" name="count" value="${customerOrderAdd['count'] }" oninput="checkCount(${customerOrderAdd['count'] });">本
							<span id="countTishi"></span>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">*送货类别:</label>
						<div class="formControls col-2">
							<span class="select-box"> <select class="select"
							id="payType" name="payType">
								<option>请选择</option>
								<option value="货到付款">货到付款</option>
								<option value="在线支付">在线支付</option>
								<option value="店面接取">店面接取</option>
						</select>
						</span>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">*支付方式:</label>
						<div class="formControls col-2">
							<span class="select-box"> <select class="select"
							id="payOption" name="payOption">
								<option>请选择</option>
								<c:if test="${payType.size()> 0}" var="flag" scope="session">						
									<c:forEach items="${payType}" var="pt">
										<option value="${pt.eopaytypeid}">${pt.eopayname}</option>
									</c:forEach>
								</c:if>
								<c:if test="${not flag}">	
									<option value="1">支付宝</option>
									<option value="2">线下支付</option>				   	
								</c:if>
						</select>
						</span>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">书&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
						<div class="formControls col-2">
							<span class="input-text" id="bname" >${customerOrderAdd['bname']}</span>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">价&nbsp;&nbsp;&nbsp;&nbsp;格:</label>
						<div class="formControls col-2">
							<span class="input-text" id="bprice" >${customerOrderAdd['bprice']}</span>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">总&nbsp;&nbsp;&nbsp;&nbsp;价:</label>
						<div class="formControls col-2">
							<input class="input-text" id="total" name ="total"readonly="readonly" value="${customerOrderAdd['total']}">
						</div>
					</div>
				</div>
			</div>
			<div style="display:none;">
					<input type="text" id="bid" name="bid" >
			</div>
			<div class="clearfix cl">
				<div class="Button_operation">
					<input class="btn btn-primary radius" type="button" onclick="addEorder();"
						id="btn btn-primary radius" value="提交">
					<button onClick="window.location.href='${path}/back/lywoption/list.jsp';" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){  
	var bid ="${param.bid}";
	 if(bid != ''){
		 document.getElementById("bid").value = bid; 
		 var param ="bid="+bid;
		 $.ajax({
		        type: "post",
		        url: "${path}/eorder.s?op=showEorder",
		        data: param,
		        async:true, // 异步请求
		        cache:true, // 设置为 false 将不缓存此页面
		        dataType: 'json', // 返回对象
		        success: function(result) {
		            if(result.code == -1){
		            	alert(result.msg);
		            }
		            if(result.code == 0){
		            	alert(result.msg);
		            }
		            if(result.code == 1){
		            	if(location.href.indexOf('#user-buy-order')==-1){
		        	        location.href=location.href+"#user-buy-order";
		        	        location.reload();
		        	     } 
		            }
		        }
		    });
	 }
});
/********添加订单的输入框失去焦点正则判断********/
//地址
$("#eoaddr").on('input',function(){
	var bnameText = $("#eoaddr").val().replace(/\ +/g,"");
	var param = "eoaddr=" + bnameText;
	$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=checkEoaddr",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#eoaddrTishi").text(result.msg).css("color", 'green'); 
			        	return ;
			        }
			        if(result.code == 0){
			        	$("#eoaddrTishi").text(result.msg).css("color", 'red');
			        	return ;
			        }
			        if(result.code == -1){
			        	alert(result.msg);
			        	return ;
			        }
			}
	});
});
//收件人
$("#uname").on('input',function(){
	var btempText = $("#uname").val().replace(/\ +/g,"");
	var param = "uname=" + btempText;
	$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=checkUname",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#unameTishi").text(result.msg).css("color", 'green');
		        		return ;
		        	}
		        	if(result.code == 0){
		        		$("#unameTishi").text(result.msg).css("color", 'red');
		        		return ;
		        	}
		        	if(result.code == -1){
		        		alert(result.msg);
		        		return ;
		        	}
	}
	});
});
//电话
$("#uphone").on('input',function(){
	var bauthorText = $("#uphone").val().replace(/\ +/g,"");
	var param = "uphone=" + bauthorText;
	$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=checkUphone",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#uphoneTishi").text(result.msg).css("color", 'green');
		        		return ;
		        	}
		        	if(result.code == 0){
		        		$("#uphoneTishi").text(result.msg).css("color", 'red');
		        		return ;
		        	}
		        	if(result.code == -1){
		        		alert(result.msg);
		        		return ;
		        	}
				}
		});
});
//数量
function checkCount(num){
	var count = $("#count").val().replace(/\ +/g,"");
	var price =  document.getElementById("bprice").innerText;
	var param = "count=" +count+"&price=" + price;
	$.ajax({
	        type: "post",
	        url: "${path}/eorder.s?op=checkCount",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$("#countTishi").text(result.msg).css("color", 'green');
		        		document.getElementById("total").value = result.data;
		        		return ;
		        	}
		        	if(result.code == 0){
		        		$("#countTishi").text(result.msg).css("color", 'red');
		        		document.getElementById("count").value = num; 
		        		return ;
		        	}
		        	if(result.code == -1){
		        		alert(result.msg);
		        		document.getElementById("count").innerText = result.data;
		        		return ;
		        	}
				}
		});
}

function addEorder(){
	var param = $('#form-article-add').serialize();
	  $.ajax({
        type: "post",
        url: "${path}/eorder.s?op=add",
        data: param,
        async:true, // 异步请求
        cache:false, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
            if(result.code == 1){
            	$("#countTishi").text("");
				$("#eoaddrTishi").text("");
				$("#unameTishi").text("");
				$("#uphoneTishi").text("");
				alert(result.msg);
            	return ;
            }
            if(result.code == -1){
            	alert(result.msg);
            	return ;
            }
            if(result.code == 0){
            	alert(result.msg);
            	return ;
            }
            if(result.code == -2){
            	alert(result.msg);
            	var check = result.data.split("/");
            	if(check[1] == "-1"){
            		$("#countTishi").text("输入不合法或为输入！！！").css("color", 'red');
            	}
				if(check[2] == "-1"){
					$("#eoaddrTishi").text("输入不合法或为输入！！！").css("color", 'red');
            	}
				if(check[3] == "-1"){
					$("#unameTishi").text("输入不合法或为输入！！！").css("color", 'red');
				}
				if(check[4] == "-1"){
					$("#uphoneTishi").text("输入不合法或为输入！！！").css("color", 'red');
				}
				return;
            }
        }
    }); 
}
</script>
</html>