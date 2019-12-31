<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/css/style.css"/>       
<link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="${path}/back/font/css/font-awesome.min.css" />
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script src="${path}/back/assets/js/bootstrap.min.js"></script>
<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>           	
<script src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
<script src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${path}/back/assets/layer/layer.js" type="text/javascript" ></script>          
<script src="${path}/back/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="${path}/back/js/dragDivResize.js" type="text/javascript"></script>
<title>添加权限</title>
</head>

<body >
<div class="Competence_add_style clearfix">
  <div class="left_Competence_add">
   <div class="title_name">添加权限</div>
    <div class="Competence_add">
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" > 父栏目名:</label>
       <div class="col-sm-9"><input type="text" id="form-field-name" name="coname" class="col-xs-10 col-sm-5"></div>
	</div>
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" > 子栏目名: </label>
       <div class="col-sm-9"><input type="text" id="form-field-namesecond" name="conamesecond" class="col-xs-10 col-sm-5"></div>
	</div>
     <!-- <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 管理子栏目名称 </label>
      <div class="col-sm-9"><textarea name="权限描述" class="form-control" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">10</span>字</span></div>
	</div> -->
   <!--按钮操作-->
   <div class="Button_operation">
				<button onclick="type_save();" class="btn btn-primary radius" type="button"><i class="fa fa-save "></i> 保存并提交</button>
				<button  onclick="window.location.href='${path}/back/admin/admin_Competence.jsp'"class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
   </div>
   </div>
   <!--权限分配-->
   <div class="Assign_style">
      <div class="title_name">权限分配</div>
      <div class="Select_Competence">
      <c:forEach items="${conType}" var="type">
	      <dl class="permission-list">
			<dt><label class="middle"><input name="user-Character-0" class="ace" type="checkbox" id="id-disable-check"><span class="lbl">${type }</span></label></dt>
			<dd>
				 <c:forEach items="${conShow}" var="show">
					<c:if test="${type.equals(show.coname)}" var="flag" scope="session">
						<c:if test="${ show.conamesecond != null}" var="flag" scope="session">
						   <dl class="cl permission-list2">
						   <dt><label class="middle"><input type="checkbox"  class="ace"  name="user-Character-0-0" id="id-disable-check" value="${show.conid}"><span class="lbl">${show.conamesecond}</span></label></dt>
					       <dd>
						   <label class="middle"><input type="checkbox" value="" class="ace" name="user-Character-0-0-0" id="user-Character-0-0-0"><span class="lbl">添加</span></label>
						   <label class="middle"><input type="checkbox" value="" class="ace" name="user-Character-0-0-0" id="user-Character-0-0-1"><span class="lbl">修改</span></label>
						   <label class="middle"><input type="checkbox" value="" class="ace" name="user-Character-0-0-0" id="user-Character-0-0-2"><span class="lbl">删除</span></label>
						   <label class="middle"><input type="checkbox" value="" class="ace" name="user-Character-0-0-0" id="user-Character-0-0-3"><span class="lbl">查看</span></label>
						   <label class="middle"><input type="checkbox" value="" class="ace" name="user-Character-0-0-0" id="user-Character-0-0-4"><span class="lbl">审核</span></label>
						   </dd>
						   </dl>
						</c:if>
					</c:if>
				 </c:forEach>
			</dd>
		    </dl> 
	   </c:forEach>
	   </div>
      </div> 
  </div>
<script>
var xmlhttp;
//ajax
try {
	xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
	try {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new XMLHttpRequest();
		} catch (e) {
		}
	}
}

$(function(){  
	if(xmlhttp!=null){
		// 定义请求地址
		var url ="${path}/control.s?op=queryCom";
		// 以 POST 方式 开启连接
		// POST 请求 更安全（编码）  提交的数据大小没有限制
		xmlhttp.open("POST",url,true);
		// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
		// 每次的状态改变都会调用该方法
		xmlhttp.onreadystatechange=function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				// 替换空格
				var msg = xmlhttp.responseText.replace(/\s/gi,"");
				if(msg == 1){
					layer.msg('暂无信息！！！', {
						icon : 5,
						time : 1000
						});
				}
			}
		};
		// 发送请求
		xmlhttp.send(null);
	}else{
		alert('不能创建XMLHttpRequest对象实例')
	} 
});
/*添加权限*/
function type_save(){
	var cname = document.getElementById("form-field-name").value.trim();
	var cnamesecond = document.getElementById("form-field-namesecond").value.trim();
	if(cname == ""){
		layer.msg("请填写栏目名称", {
			icon : 2,
			time : 1000
			});
		return;
	}
	if(xmlhttp!=null){
		// 定义请求地址
		var url ="${path}/control.s?op=add&name="+cname+"&namesecond="+cnamesecond;
		// 以 POST 方式 开启连接
		// POST 请求 更安全（编码）  提交的数据大小没有限制
		xmlhttp.open("POST",url,true);
		// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
		// 每次的状态改变都会调用该方法
		xmlhttp.onreadystatechange=function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				// 替换空格
				var msg = xmlhttp.responseText.replace(/\s/gi,"");
				if(msg == 1){
					layer.msg('添加成功！！！', {
						icon : 6,
						time : 1000
						});
				}else {
					layer.msg('添加失败！！！', {
						icon : 5,
						time : 1000
						});
				}
			}
		};
		// 发送请求
		xmlhttp.send(null);
	}else{
		alert('不能创建XMLHttpRequest对象实例')
	} 
}
/*给角色添加权限*/
function type_add(){
  //jquery获取复选框值    
    var uid_val =[];//定义一个获取uid的数组    
    $('input[id="id-user"]:checked').each(function(){//遍历每一个名字为id-disable-check的复选框，其中选中的执行函数    
   			uid_val.push($(this).val());//将选中的值添加到数组chk_value中    
    });
    var uid_show;
    uid_show = uid_val.join('/');//该字符串为所有选中的管理员id-disable-check
    if(uid_show ==""){
    	layer.msg("请选择管理员", {
			icon : 2,
			time : 1000
			});
		return;
    }
    var control_val =[];//定义一个获取权限的数组    
    $('input[id="id-disable-check"]:checked').each(function(){//遍历每一个名字为id-disable-check的复选框，其中选中的执行函数    
   			control_val.push($(this).val());//将选中的值添加到数组中    
    });
    var control_show;
    control_show = control_val.join('/');//该字符串为所有选中的权限
    if(control_show ==""){
    	layer.msg("请选择添加的权限", {
			icon : 2,
			time : 1000
			});
		return;
    }
    if(xmlhttp!=null){
		// 定义请求地址
		var url ="${path}/control.s?op=addUserControl&uid="+uid_show+"&type="+control_show;
		// 以 POST 方式 开启连接
		// POST 请求 更安全（编码）  提交的数据大小没有限制
		xmlhttp.open("POST",url,true);
		// 设置回调函数   // 当收到服务器的响应时，会触发该函数（回调函数）
		// 每次的状态改变都会调用该方法
		xmlhttp.onreadystatechange=function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				// 替换空格
				var msg = xmlhttp.responseText.replace(/\s/gi,"");
				if(msg == 1){
					layer.msg('添加成功！！！', {
						icon : 6,
						time : 1000
						});
				}else {
					layer.msg('添加失败！！！', {
						icon : 5,
						time : 1000
						});
				}
			}
		};
		// 发送请求
		xmlhttp.send(null);
	}else{
		alert('不能创建XMLHttpRequest对象实例')
	} 
}
</script>
</body>
</html>
<script type="text/javascript">
//初始化宽度、高度  
$(".left_Competence_add,.Competence_add_style").height($(window).height()).val();; 
$(".Assign_style").width($(window).width()-500).height($(window).height()).val();
$(".Select_Competence").width($(window).width()-500).height($(window).height()-40).val();
 //当文档窗口发生改变时 触发  
   $(window).resize(function(){
	$(".Assign_style").width($(window).width()-500).height($(window).height()).val();
	$(".Select_Competence").width($(window).width()-500).height($(window).height()-40).val();
	$(".left_Competence_add,.Competence_add_style").height($(window).height()).val();;
	});
/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您出入的字数超多限制!',	
   });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};

/*按钮选择*/
$(function(){
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
		
	});
});
</script>
