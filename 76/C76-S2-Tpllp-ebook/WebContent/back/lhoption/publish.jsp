<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script
	src="${path}/back/js/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css">
	<script type="text/javascript" src="${path}/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		//图片上传预览    IE是用了滤镜。
		function previewImage(file){
			var fileObj = document.getElementById("bimg").files[0]; // js 获取文件对象
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
		        		document.getElementById("img_path").value =result.data;
					}
		        }
		    });
			var MAXWIDTH  = 260;
			var MAXHEIGHT = 180;
			var div = document.getElementById('preview');
			if (file.files && file.files[0])
			{
				
				div.innerHTML ='<img id=imghead>';
				var img = document.getElementById('imghead');
				img.onload = function(){
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
					img.width  =  rect.width;
					img.height =  rect.height;
					img.style.marginTop = rect.top+'px';
				}
				var reader = new FileReader();
				reader.onload = function(evt){img.src = evt.target.result;}
				reader.readAsDataURL(file.files[0]);
			}
			else //兼容IE
			{
				var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
				file.select();
				var src = document.selection.createRange().text;
				div.innerHTML = '<img id=imghead>';
				var img = document.getElementById('imghead');
				img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
				status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
				div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
			}
		}
		function clacImgZoomParam( maxWidth, maxHeight, width, height ){
			var param = {top:0, left:0, width:width, height:height};
			if( width>maxWidth || height>maxHeight )
			{
				rateWidth = width / maxWidth;
				rateHeight = height / maxHeight;

				if( rateWidth > rateHeight )
				{
					param.width =  maxWidth;
					param.height = Math.round(height / rateWidth);
				}else
				{
					param.width = Math.round(width / rateHeight);
					param.height = maxHeight;
				}
			}

			param.left = Math.round((maxWidth - param.width) / 2);
			param.top = Math.round((maxHeight - param.height) / 2);
			return param;
		}
		function upload(){
			location.href='upload.jsp';
		}
		//上传图片
		function upImg(){
			// js 获取文件对象
			var fileObj = document.getElementById("bimg").files[0]; // js 获取文件对象
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
		        		return ;
					}
		        	if(result.code == -1){
		        		$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
		        		return ;
		        	}
		        	if(result.code == 0){
		        		$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
		        		return ;
		        	}
		        }
		    });
		}
		//验证系列名
		function checkBtemp(){
			var btemp = $("#btemp").val();
			btemp = btemp.replace(/\s/gi,"");
			var param = "btemp=" + btemp;
			$.ajax({
	            type: "post",
	            url: "${path}/book.s?op=checkBtemp",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$("#btempMsg").text(result.msg).css("color", 'green'); 
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == 0){
	                	$("#btempMsg").text(result.msg).css("color", 'red'); 
	                	return ;
	                }
	            }
	        });
		}
		
		//验证书名
		function checkBname(){
			var bname = $("#bname").val();
			bname = bname.replace(/\s/gi,"");
			var param = "bname=" + bname;
			$.ajax({
	            type: "post",
	            url: "${path}/book.s?op=checkBname",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$("#bnameMsg").text(result.msg).css("color", 'green'); 
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == 0){
	                	$("#bnameMsg").text(result.msg).css("color", 'red'); 
	                	return ;
	                }
	            }
	        });
		}
		//验证作者名
		function checkBauthor(){
			var bauthor = $("#bauthor").val();
			bauthor = bauthor.replace(/\s/gi,"");
			var param = "bauthor=" + bauthor;
			$.ajax({
	            type: "post",
	            url: "${path}/book.s?op=checkBauthor",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$("#bauthorMsg").text(result.msg).css("color", 'green'); 
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == 0){
	                	$("#bauthorMsg").text(result.msg).css("color", 'red'); 
	                	return ;
	                }
	            }
	        });
		}
		//验证价格
		function checkBprice(){
			var bprice = $("#bprice").val();
			bprice = bprice.replace(/\s/gi,"");
			var param = "bprice=" + bprice;
			$.ajax({
	            type: "post",
	            url: "${path}/book.s?op=checkBprice",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$("#bpriceMsg").text(result.msg).css("color", 'green'); 
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == 0){
	                	$("#bpriceMsg").text(result.msg).css("color", 'red'); 
	                	return ;
	                }
	            }
	        });
		}
		//验证数量
		function checkBnum(){
			var bnum = $("#bnum").val();
			bnum = bnum.replace(/\s/gi,"");
			var param = "bnum=" + bnum;
			$.ajax({
	            type: "post",
	            url: "${path}/book.s?op=checkBnum",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$("#bnumMsg").text(result.msg).css("color", 'green'); 
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == 0){
	                	$("#bnumMsg").text(result.msg).css("color", 'red'); 
	                	return ;
	                }
	            }
	        });
		}
		//发布书籍
		function insertBook(){
			var param = $('#user-addBook').serialize();
			$.ajax({
	            type: "post",
	            url: "${path}/book.s?op=userAddBook",
	            data: param,
	            async:true, // 异步请求
	            cache:true, // 设置为 false 将不缓存此页面
	            dataType: 'json', // 返回对象
	            success: function(result) {
	                if(result.code == 1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	$("#bnumMsg").text(""); 
	                	$("#btempMsg").text(""); 
	                	$("#bnameMsg").text(""); 
	                	$("#bauthorMsg").text(""); 
	                	$("#bpriceMsg").text(""); 
	                	return ;
	                }
	                if(result.code == -1){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == 0){
	                	$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
	                	return ;
	                }
	                if(result.code == -2){
	                	var check = result.data.split("/");
	                	if(check[1] == "-1"){
	                		$("#bnameMsg").text("书名未输入或不合法！！！").css("color", 'red'); 
	                	}
	                	if(check[2] == "-1"){
							$("#bpriceMsg").text("价格未输入或不合法！！！").css("color", 'red'); 
						}
						if(check[3] == "-1"){
							$("#bauthorMsg").text("作者未输入或不合法！！！").css("color", 'red'); 
	                	}
						if(check[4] == "-1"){
							$("#bnumMsg").text("库存未输入或不合法！！！").css("color", 'red'); 
	                	}
						$.messager.show({
		    				title:'提示',
		    				msg:result.msg,
		    				showType:'fade',
		    				timeout:300,
		    				style:{
		    					right:'',
		    					bottom:''
		    				}
		    			});
						return ;
	                }
	            }
	        });
		}
	</script>
	<title>发布书籍</title>
</head>
<style>
	.help-main {
		padding: 0;
	}
	select{
		padding: 3px 10px;
		height:30px;
		width:200px;
	}
	.product-edit-item-r input {
  	  height: 30px;
	}
	
	#img_path{
		display:none;
	}
	#notice{
		display:none;
	}
</style>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="help-wrap">
	<div class="container clearfix">
		<div class="bread">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lywoption/member.jsp">个人中心</a> >
			<a href="${path}/back/lhoption/publish.jsp">发布书籍</a>
		</div>
		<jsp:include page="../common/middle.jsp"></jsp:include>
		<div class="help-r fr">
			<div class="help-item-title">发布书籍</div>
			<div class="help-main" id="help-main">
				<form id="user-addBook">
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl">
							<div class="fr">图书分类1：</div>
						</div>
						<div class="product-edit-item-r fl">
						
						<select name="buniversity" >
							<option >图书所属大学</option>
							<c:forEach items="${userUni}" var="uni">
								<option >${uni }</option>
							</c:forEach>
						</select>
							
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl">
							<div class="fr">图书分类2：</div>
						</div>
						<div class="product-edit-item-r fl">
							<select name="bucollege"  >
								<option >图书所属学院</option>
							
							<c:forEach items="${userUcol}" var="ucol">
								<option >${ucol }</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl">
							<div class="fr">图书分类3：</div>
						</div>
						<div class="product-edit-item-r fl">
							<select name="bumajor" >
									<option >图书所属专业</option>
								
								<c:forEach items="${userUmar}" var="umar">
										<option >${umar }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl">
							<div class="fr"></i>图书分类4：</div>
						</div>
						<div class="product-edit-item-r fl">
							<select name="bclass"  >
									<option >图书所属年级</option>
								
								<option >大一</option>
								<option >大二</option>
								<option >大三</option>
								<option >大四</option>
							</select>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl">
							<div class="fr"><i class="middle">*</i>图书分类5：</div>
						</div>
						<div class="product-edit-item-r fl">
							<select name="btid"  >
									<option >图书所属类型</option>					   	
								
								<c:forEach items="${btypes}" var="btType">
										<option value="${btType.btid }">${btTypeEdit[btType.btid]}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl">
							<div class="fr">图书分类6：</div>
						</div>
						<div class="product-edit-item-r fl">
							<input type="text" name="btemp" id="btemp"style="width: 200px"  onblur="checkBtemp();">
							<span id="btempMsg" style="width: 200px;margin-left:10px;"></span>
							<p >图书专属系列名称长度至少3个字符，最长10个汉字</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc">
							<div class="fr"><i class="middle">*</i>图书名称：</div>
						</div>
						<div class="product-edit-item-r fl">
							<input type="text"  name="bname" id="bname"style="width: 200px" onblur="checkBname();">
							<span id="bnameMsg" style="width: 200px;margin-left:10px;"></span>
							<p >图书标题名称长度至少1个字符，最长50个汉字</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc">
							<div class="fr"><i class="middle">*</i>图书作者：</div>
						</div>
						<div class="product-edit-item-r fl">
							<input type="text"  name="bauthor" id="bauthor"style="width: 200px"onblur="checkBauthor();">
							<span id="bauthorMsg" style="width: 200px;margin-left:10px;"></span>
							<p >图书作者名称长度至少1个字符，最长10个汉字</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc">
							<div class="fr"><i class="middle">*</i>图书价格：</div>
						</div>
						<div class="product-edit-item-r fl">
							<input type="text" name="bprice" id="bprice"style="width: 200px" onblur="checkBprice();" >
							<span id="bpriceMsg" style="width: 200px;margin-left:10px;"></span>
							<p >图书价格为整数或至多带两位小数</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc">
							<div class="fr"></i>图书数量：</div>
						</div>
						<div class="product-edit-item-r fl">
							<input type="text" name="bnum" id="bnum"style="width: 200px" onblur="checkBnum();" >
							<span id="bnumMsg" style="width: 200px;margin-left:10px;"></span>
							<p >图书数量为整数且在1-100000000之间(输入为空时默认为1)</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc">
							<div class="fr"><i class="middle">*</i>图书描述：</div>
						</div>
						<div class="product-edit-item-r fl">
							<textarea name="bcontent"  cols="30" rows="10" >
							</textarea>
							<p >请如实描述你所发布书籍的详细情况，以方便其他会员购买！</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc">
							<div class="fr"><i class="middle">*</i>上传封面：</div>
						</div>
						<div class="product-edit-item-r fl">
							<div id="preview">
									<img id="imghead" border=0 src="${path }/images/book.jpg" /> 	
							</div>
							<input type="text" id ="img_path" name="img_path" style="dispaly:none;" />
							<input type="file" name="bimg" id ="bimg"onchange="previewImage(this)" />
							<p >请上传图书封面，尽量保持图片清晰</p>
						</div>
					</div>
					<div class="product-edit-item clearfix">
						<div class="product-edit-item-l fl clearfixc" style="border: none;border-top:1px solid #E6E6E6">
						</div>
						<div class="product-edit-item-r fl" style="border: none;border-top:1px solid #E6E6E6">
						</div>
					</div>
					<div class="upload"><label><input type="button" value="点击发布" onclick="insertBook();"></label></div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>