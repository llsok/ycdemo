<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/back/css/style.css" />
<link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
<link rel="stylesheet" href="${path}/back/font/css/font-awesome.min.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${path}/back/assets/css/ace-ie.min.css" />
		<![endif]-->

<title>个人信息管理</title>
</head>
<body>
	<div class="clearfix">
		<div class="admin_info_style">
			<div class="admin_modify_style" id="Personal">
				<div class="type_title">管理员信息</div>
				<div class="xinxi">
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">用&nbsp;户&nbsp;名： </label>
						<div class="col-sm-9">
							<input type="text" name="uname" id="uname"
								value="${loginedUser.uname }" class="col-xs-7 text_info"
								disabled="disabled" oninput="checkName('${ loginedUser.uid}');">
							&nbsp;&nbsp;&nbsp;<a href="javascript:;"
								onclick="change_Password()" class="btn btn-warning btn-xs">修改密码</a>
						</div>
						<span id="unameTishi" style="margin-left: 30px;"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
						</label>
						<div class="col-sm-9">
							<span class="sex">${userSex[loginedUser.usex] }</span>
							<div class="add_sex" id="add_sex">
								<label><input name="usex" type="radio" class="ace"
									checked="checked" value="0"><span class="lbl">保密</span></label>&nbsp;&nbsp;
								<label><input name="usex" type="radio" class="ace"
									value="1"><span class="lbl">男</span></label>&nbsp;&nbsp; <label><input
									name="usex" type="radio" class="ace" value="2"><span
									class="lbl">女</span></label>
							</div>
						</div>
						<span style="margin-left: 30px;"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：
						</label>
						<div class="col-sm-9">
							<input type="text" name="uage" id="uage"
								value="${loginedUser.uage }" class="col-xs-7 text_info"
								disabled="disabled" oninput="checkAge();">
						</div>
						<span id="uageTishi" style="margin-left: 30px;"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">移动电话： </label>
						<div class="col-sm-9">
							<input type="text" name="uphone" id="uphone"
								value="${loginedUser.uphone }" class="col-xs-7 text_info"
								disabled="disabled" oninput="checkPhone();">
						</div>
						<span id="uphoneTishi" style="margin-left: 30px;"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">电子邮箱： </label>
						<div class="col-sm-9">
							<input type="text" name="uemail" id="uemail"
								value="${loginedUser.uemail }" class="col-xs-7 text_info"
								disabled="disabled" oninput="checkEmail();">
						</div>
						<span id="uemailTishi" style="margin-left: 30px;"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限：
						</label>
						<div class="col-sm-9">
							<span>${adminType[loginedUser.utype] }</span>
						</div>
						<span style="margin-left: 30px;"></span>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="form-field-1">注册时间： </label>
						<div class="col-sm-9">
							<span>${loginedUser.utime}</span>
						</div>
						<span style="margin-left: 30px;"></span>
					</div>
					<div class="Button_operation clearfix">
						<button onclick="modify();" class="btn btn-danger radius"
							type="submit">修改信息</button>
						<button onclick="save_info();" class="btn btn-success radius"
							type="button">保存修改</button>
					</div>
				</div>
			</div>
			<div class="recording_style">
				<div class="type_title">管理员登录记录</div>
				<div class="recording_list">
					<jsp:include page="admin_info_show.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<!--修改密码样式-->
	<div class="change_Pass_style" id="change_Pass">
		<ul class="xg_style">
			<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input
				name="upwd" type="password" class="" id="upassword" oninput="checkOldPwd();"> <span
				id="oldpwd" style="margin-left: 10px;" ></span></li>
			<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input
				name="newpwd" type="password" class="" id="newupassword" oninput="checkNewPwd();"> <span
				id="newpwd" style="margin-left: 10px;"></span></li>
			<li><label class="label_name">确认密码</label><input name="repwd"
				type="password" class="" id="reupassword" oninput="checkPwd();"> <span id="repwd"
				style="margin-left: 10px;"></span></li>
		</ul>
		<!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
	</div>
</body>
<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
<script src="${path}/back/assets/js/bootstrap.min.js"></script>
<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script>
<script src="${path}/back/assets/js/jquery.dataTables.min.js"></script>
<script src="${path}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript"
	src="${path}/back/Widget/Validform/5.3.2/Validform.min.js"></script>
<script src="${path}/back/js/lrtk.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.js"></script>
<script type="text/javascript"
	src="${path}/back/js/H-ui.admin.js"></script>
<script src="${path}/back/assets/layer/layer.js" type="text/javascript"></script>
<script src="${path}/back/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script>
	//按钮点击事件
	function modify() {
		$('.text_info').attr("disabled", false);
		$('.text_info').addClass("add");
		$('#Personal').find('.xinxi').addClass("hover");
		$('#Personal').find('.btn-success').css({
			'display' : 'block'
		});
	};
	//用户名判断
	function checkName(id) {
		var uname = $("#uname").val().replace(/\ +/g, "");
		var param = "username=" + uname + "&uid=" + id;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=adminCheckName",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					$("#unameTishi").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#unameTishi").text(result.msg).css("color", 'red');
					return;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
			}
		});
	}
	//邮箱判断
	function checkEmail() {
		var uemail = $("#uemail").val().replace(/\ +/g, "");
		var param = "uemail=" + uemail;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=checkEmail",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					$("#uemailTishi").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#uemailTishi").text(result.msg).css("color", 'red');
					return;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
			}
		});
	}
	//年龄判断
	function checkAge() {
		var uage = $("#uage").val().replace(/\ +/g, "");
		var param = "uage=" + uage;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=checkUage",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					$("#uageTishi").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#uageTishi").text(result.msg).css("color", 'red');
					return;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
			}
		});
	}
	//电话
	function checkPhone() {
		var uphone = $("#uphone").val().replace(/\ +/g, "");
		var param = "uphone=" + uphone;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=checkPhone",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					$("#uphoneTishi").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#uphoneTishi").text(result.msg).css("color", 'red');
					return;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
			}
		});
	}
	function save_info() {
		var usex = $('#add_sex input[name="usex"]:checked ').val().replace(/\s/gi, "");
		var uname = $('#uname').val().replace(/\s/gi, "");
		var uphone = $('#uphone').val().replace(/\s/gi, "");
		var uemail = $('#uemail').val().replace(/\s/gi, "");
		var uage = $('#uage').val().replace(/\s/gi, "");
		var param = "usex=" + usex + "&uname=" +uname +"&uphone=" +uphone+ "&uemail="+uemail +"&uage=" +uage;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=adminUpdate",
			data : param,
			async : true, // 异步请求
			cache : true, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == 1) {
					layer.msg(result.msg, {
						icon : 6,
						time : 1000,
						title : "提示"
					});
					$('#Personal').find('.xinxi').removeClass("hover");
					$('#Personal').find('.text_info').removeClass("add").attr(
							"disabled", true);
					$('#Personal').find('.btn-success').css({
						'display' : 'none'
					});
					return;
				}
				if (result.code == 0) {
					layer.msg(result.msg, {
						icon : 5,
						time : 1000,
						title : "提示"
					});
					return false;
				}
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return false;
				}
				if (result.code == -2) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					var m = result.data.split("/");
					if (m[1] == "-1") {
						$("#unameTishi").text("用户名未输入或不合法！")
								.css("color", 'red');
					}
					if (m[4] == "-1") {
						$("#uphoneTishi").text("电话未输入或不合法！")
								.css("color", 'red');
					}
					if (m[2] == "-1") {
						$("#uemailTishi").text("邮箱未输入或不合法！")
								.css("color", 'red');
					}
					if (m[3] == "-1") {
						$("#uageTishi").text("年龄未输入或不合法！")
								.css("color", 'red');
					}
					return false;
				}
			}
		});
	};
	//验证原密码
	function checkOldPwd() {
		var oldpwd = $("#upassword").val();
		var param = "oldpassword=" + oldpwd;
		$.ajax({
			type : "post",
			url : "${path}/user.s?op=checkPwd",
			data : param,
			async : true, // 异步请求
			cache : false, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
				if (result.code == 1) {
					$("#oldpwd").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#oldpwd").text(result.msg).css("color", 'red');
					return;
				}
			}
		});
	};
	//验证新密码
	function checkNewPwd() {
		var pwd = $("#newupassword").val().replace(/\s/gi, "");
		var param = "upassword=" + pwd;
		$.ajax({
			type : "post",
			url : "${path}/reg.s?op=checkPassword",
			data : param,
			async : true, // 异步请求
			cache : false, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
				if (result.code == 1) {
					$("#newpwd").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#newpwd").text(result.msg).css("color", 'red');
					return;
				}
			}
		});
	};
	//验证密码一致
	function checkPwd() {
		var pwd = $("#newupassword").val().replace(/\s/gi, "");
		var repwd = $("#reupassword").val().replace(/\s/gi, "");
		var param = "confirm=" + repwd + "&upassword=" +pwd;
		$.ajax({
			type : "post",
			url : "${path}/reg.s?op=checkRePassword",
			data : param,
			async : true, // 异步请求
			cache : false, // 设置为 false 将不缓存此页面
			dataType : 'json', // 返回对象
			success : function(result) {
				if (result.code == -1) {
					layer.msg(result.msg, {
						icon : 2,
						time : 1000,
						title : "提示"
					});
					return;
				}
				if (result.code == 1) {
					$("#repwd").text(result.msg).css("color", 'green');
					return;
				}
				if (result.code == 0) {
					$("#repwd").text(result.msg).css("color", 'red');
					return;
				}
			}
		});
	};
	//修改密码
	function change_Password() {
		layer.open({
			type : 1,
			title : '修改密码',
			area : [ '600px', '300px' ],
			shadeClose : true,
			content : $('#change_Pass'),
			btn : [ '确认修改' ],
			yes : function(index, layero) {
				var param ="";
				$.ajax({
			        type: "post",
			        url: "${path}/user.s?op=adminUpdatePwd",
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
				        	if (result.code == -2) {
								layer.msg(result.msg, {
									icon : 2,
									time : 1000,
									title : "提示"
								});
								var m = rusult.data.split("/");
								if (m[1] == "-1") {
									$("#newpwd").text("新密码未输入或不合法！！！")
											.css("color", 'red');
								}
								if (m[2] == "-1") {
									$("#oldpwd").text("原密码未输入或不合法！！！")
											.css("color", 'red');
								}
								if (m[3] == "-1") {
									$("#repwd").text("确认密码未输入或不合法！！！")
											.css("color", 'red');
								}
								return false;
							}
						}
					});
			}
		});
	}
	//初始化宽度、高度    
	$(".admin_modify_style").height($(window).height());
	$(".recording_style").width($(window).width() - 400);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".admin_modify_style").height($(window).height());
		$(".recording_style").width($(window).width() - 400);
	});
</script>
<script>
	jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 2, 3, 4, 5, 6 ]
			} // 制定列不参与排序
			]
		});

		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});

				});
	});
</script>
</html>

