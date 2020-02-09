<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link
	href="${path}/back/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/back/css/style.css" />
<link
	href="${path}/back/assets/css/codemirror.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="${path}/back/assets/css/font-awesome.min.css" />
<script
	src="${path}/back/assets/js/jquery.min.js"></script>
<script type="text/javascript">
		window.jQuery || document.write("<script src='${path}/back/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${path}/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
<script
	src="${path}/back/assets/js/bootstrap.min.js"></script>
<script
	src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
<script
	src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.admin.js"></script>
<script
	src="${path}/back/assets/layer/layer.js"
	type="text/javascript"></script>
	
<title>用户列表</title>
</head>

<body >
	<div class="page-content clearfix">
		<div id="Member_Ratings">
			<div class="d_Confirm_Order_style">
				<div class="search_style">
					<ul class="search_content clearfix">
						<li><label class="l_f">用户名</label><input name="username" id="username" type="text"
							class="text_add" placeholder="请输入用户名" style="width: 200px" /></li>
						<li><label class="l_f">电话</label><input name="phone" id="phone"type="text"
							class="text_add" placeholder="请输入电话" style="width: 200px" /></li>
						<li><label class="l_f">邮箱</label><input name="email" id="email"type="text" 
							class="text_add" placeholder="请输入邮箱" style="width: 200px" /></li>
						<li style="width: 90px;"><button type="button" onclick="query();"
								class="btn_search">
								<i class="icon-search"></i>查询 
							</button></li>
					</ul>
				</div>
				<div class="border clearfix">
					<span class="l_f"> <a
						href="javascript:;"
						id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
						<a onclick="selectDelete();" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
					</span> <span class="r_f">共：<b>${customerAll.size() }</b>条
					</span>
				</div>
				<div class="table_menu_list" id="user_list_show_admin">
					<jsp:include page="user_list_show.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<div class="add_menber" id="add_menber_style" style="display:none;">
		<%@ include file='userAdd.jsp'%> 
	</div>
	<div class="add_menber" id="update_menber_style" style="display:none;">
		<%@ include file='userEdit.jsp'%> 
	</div>
</body>
<script>
//全选
var sbox = "";
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		] } );
				//设置全选				
				$('table th input:checkbox').on('click' , function(){
					if(sbox == "/"){
						sbox = "";
					}else{
						sbox = "/";
					}
					
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
				//设置单选
				$('table tr input:checkbox').on(
				'click',
				function() {
					var that = this;
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
//重置密码
function updatePwd(id){
	var uid = $("#uid").val().replace(/\ +/g,"");
	var param ="upassword="+1+"&uid="+id;
	$.ajax({
        type: "post",
        url: "${path}/user.s?op=updateState",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					layer.msg("重置成功！！！", {
						icon : 6,
						time : 1000,
						title: "提示"
						});
					return ;
	        	}
	        	if(result.code == 0){
	        		layer.msg("重置失败！！！", {
						icon : 5,
						time : 1000,
						title: "提示"
						});
	        		return ;
	        	}
	        	if(result.code == -1){
	        		layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title: "提示"
						});
	        		return ;
	        	}
			}
		});
}
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['900px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
			var utype = $("#utype").val().replace(/\ +/g,"");
			var param ="utype="+utype;
			$.ajax({
		        type: "post",
		        url: "${path}/user.s?op=add",
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
							$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
							layer.close(index);	
			        		return;
			        	}
			        	if(result.code == 0){
			        	layer.msg(result.msg, {
								icon : 5,
								time : 1000,
								title: "提示"
							});
			        		return false;
			        	}
			        	if(result.code == -1){
			        		layer.msg(result.msg, {
								icon : 2,
								time : 1000,
								title: "提示"
								});
			        		return false;
			        	}
			        	if(result.code == -2){
			        		layer.msg(result.msg, {
								icon : 5,
								time : 1000,
								title: "提示"
								});
			        		var m = rusult.data.split("/");
							if(m[1] == "-1"){
								$("#unameTishi").text("用户名未输入或不合法！").css("color", 'red');
							}
							if(m[3] == "-1"){
								$("#uphoneTishi").text("电话未输入或不合法！").css("color", 'red');
							}
							if(m[2] == "-1"){
								$("#uemailTishi").text("邮箱未输入或不合法！").css("color", 'red');
							}
			        		return false;
			        	}
					}
				});
		  }		  		     				
    });
});

/*用户查询*/
function query(){
	var username =  document.getElementById("username").value.replace(/\ +/g,"");
	var phone= document.getElementById("phone").value.replace(/\ +/g,"");
	var email = document.getElementById("email").value.replace(/\ +/g,"");
	var param ="uname="+username+"&uphone="+phone+"&uemail"+email;
	$.ajax({
        type: "post",
        url: "${path}/user.s?op=queryUser",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
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
/*用户-查看*/
function member_show(title,url,id,w,h){
	var param ="uid="+id;
	$.ajax({
        type: "post",
        url: "${path}/book.s?op=showUserMessage",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
				if(result.code == 1){
					layer_show(title,url,w,h);
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
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		var param ="ustate=2&uid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=updateState",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
						layer.msg('已停用!',{icon: 1,time:1000});
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
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		var param ="ustate=1&uid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=updateState",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
						layer.msg('已启用!',{icon: 6,time:1000});
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
	});
}
/*用户-编辑*/
function member_edit(id){
	//1.进行数据查询
	var param ="uid="+id;
	$.ajax({
        type: "post",
        url: "${path}/user.s?op=showUserMessage",
        data: param,
        async:true, // 异步请求
        cache:true, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
        		$('#update_menber_style').load('${path}/back/user/userEdit.jsp');
				if(result.code == 1){
					  layer.open({
					        type: 1,
					        title: '修改用户信息',
							maxmin: true, 
							shadeClose:false, //点击遮罩关闭层
					        area : ['900px' , ''],
					        content:$('#update_menber_style'),
							btn:['提交','取消'],
							yes:function(index,layero){	
							 	//2.进行操作
							 	var uid = $("#uid").val().replace(/\ +/g,"");
								var utype = $("#utypeUpdate").val().replace(/\ +/g,"");
								var uname = $("#unameUpdate").val().replace(/\ +/g,"");
								var uphone = $("#uphoneUpdate").val().replace(/\ +/g,"");
								var uemail = $("#uemailUpdate").val().replace(/\ +/g,"");
								var param ="utype="+utype+"&uid="+uid+"&uname="+uname+"&uphone="+uphone+"&uemail="+uemail;
								$.ajax({
							        type: "post",
							        url: "${path}/user.s?op=adminUpdateUser",
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
												$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
												layer.close(index);	
								        		return;
								        	}
								        	if(result.code == 0){
								        	layer.msg(result.msg, {
													icon : 5,
													time : 1000,
													title: "提示"
												});
								        		return false;
								        	}
								        	if(result.code == -1){
								        		layer.msg(result.msg, {
													icon : 2,
													time : 1000,
													title: "提示"
													});
								        		return false;
								        	}
								        	if(result.code == -2){
								        		layer.msg(result.msg, {
													icon : 5,
													time : 1000,
													title: "提示"
													});
								        		var m = rusult.data.split("/");
												if(m[1] == "-1"){
													$("#unameTishi").text("用户名未输入或不合法！").css("color", 'red');
												}
												if(m[3] == "-1"){
													$("#uphoneTishi").text("电话未输入或不合法！").css("color", 'red');
												}
												if(m[2] == "-1"){
													$("#uemailTishi").text("邮箱未输入或不合法！").css("color", 'red');
												}
								        		return false;
								        	}
										}
									});
							}
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
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		var param ="uid="+id;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=delete",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
						layer.msg('已删除!',{icon:1,time:1000});
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
	});
}
/*用户-批量删除*/
function selectDelete(){
	layer.confirm('确认要删除吗？',function(index){
		if(sbox != "/"){
			var table = $('#sample-table').dataTable();//获取表格
			var nTrs = table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象
			for (var i = 0; i < nTrs.length; i++) {
				if ($(nTrs[i]).hasClass('selected')) {
					var bid = table.fnGetData(nTrs[i]);//fnGetData获取一行的数据
					 sbox =sbox +"/"+ bid[1];
				}
			}
		}else{
			layer.msg("不能进行该操作！！！", {
				icon : 2,
				time : 1000
				});
			return ;
		}
		if(sbox == ""){
			layer.msg("请选择要删除的用户！！！", {
				icon : 7,
				time : 1000
				});
			return ;
		}
		var param ="uid="+sbox;
		$.ajax({
	        type: "post",
	        url: "${path}/user.s?op=delete",
	        data: param,
	        async:true, // 异步请求
	        cache:true, // 设置为 false 将不缓存此页面
	        dataType: 'json', // 返回对象
	        success: function(result) {
					if(result.code == 1){
						$('#user_list_show_admin').load('${path}/back/user/user_list_show.jsp');
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
	});
}
/* laydate({
    elem: '#start',
    event: 'focus' 
});
 */
</script>
</html>
