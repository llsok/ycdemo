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
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="${path}/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
        <script src="${path}/back/assets/js/bootstrap.min.js"></script>
		<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${path}/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${path}/back/js/H-ui.js" type="text/javascript"></script>
        <script src="${path}/back/js/displayPart.js" type="text/javascript"></script>
<title>文章分类</title>
</head>

<body>
<div class="margin clearfix">
 <div class="sort_style">
  <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()"id="add_page" class="btn btn-warning" onclick="add_article_sort()"><i class="fa fa-plus"></i> 添加分类</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
       <span class="r_f">共：<b>5</b>分类</span>
     </div>
     <!--分类类表-->
     <div class="article_sort_list">
       	<jsp:include page="article-sort-show.jsp"></jsp:include>
     </div>
 </div>
</div>
<!--添加文章分类图层-->
<div id="addsort_style" style="display:none" class="article_style">
 <div class="add_content" id="form-article-add">
    <ul>
     <li class="clearfix Mandatory"><label class="label_name"><i>*</i>分类名称</label>
     <span class="formControls w_txt"><input name="分类名称" type="text" id="form-field-1" class="col-xs-7 col-sm-5 "></span>
     </li>
     <li class="clearfix"><label class="label_name">排序</label>
     <span class="formControls w_txt"><input name="排序" type="text" id="form-field-1" value="0" class="col-xs-7 col-sm-2 "></span>
     </li>
     <li class="clearfix"><label class="label_name">简介</label>
     <span class="formControls w_txt"><textarea name="权限描述" class="form-control" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea><span  style=" margin-left:10px;">剩余字数：<span id="sy" style="color:Red;">200</span>字</span></span>
     </li>
    </ul>
 </div>
</div>
</body>
</html>
<script>
$(function() {
  var oTable1 = $('#sample-table').dataTable( {
  "aaSorting": [[ 1, "desc" ]],//默认第几个排序
  "bStateSave": true,//状态保存
  "aoColumnDefs": [
	//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	{"orderable":false,"aTargets":[0,2,3,4,6,7,]}// 制定列不参与排序
  ]});
		  $('table th input:checkbox').on('click' , function(){
			  var that = this;
			  $(this).closest('table').find('tr > td:first-child input:checkbox')
			  .each(function(){
				 this.checked = that.checked;
				 $(this).closest('tr').toggleClass('selected');
	 });						
  });
})
/**添加分类**/
 function add_article_sort(index){	 
	 layer.open({
        type: 1,
        title: '添加文章分类',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['600px' , ''],
        content:$('#addsort_style'),
		btn:['提交','取消'],
		yes:function(index,layero){
			 var num=0;
		 var str="";
     $(".Mandatory input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  
			
		}
	 })	 	 
}
/*文章-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
