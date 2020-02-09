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
		<script src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${path}/back/assets/js/bootstrap.min.js"></script>
		<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>  
<script type="text/javascript"
	src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.admin.js"></script>
<script
	src="${path}/back/assets/layer/layer.js"
	type="text/javascript"></script>         	
<script>
$(function() {
	var oTable1 = $('#sample-table-admin').dataTable( {
	"aaSorting": [],//默认第几个排序
	"bStateSave": false,//状态保存
	//"dom": 't',
	"bFilter":false,
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7]}// 制定列不参与排序
	] } );
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
})
</script>          
<script>
/*栏目-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用该栏目吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('停用!',{icon: 5,time:1000});
	});
}

/*栏目-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用该栏目吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('启用!',{icon: 6,time:1000});
	});
}
/*店铺-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
<title>系统栏目</title>
</head>
<body>
<div class="Columns_style margin">
  <jsp:include page="system-list.jsp"></jsp:include>
</div>
</body>
</html>

