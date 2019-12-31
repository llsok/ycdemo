<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/css/index.css"/>
<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css">
<script type="text/javascript" src="${path}/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){  
	var nid = "nid="+"${param.nid}";
	$.ajax({
        type: "post",
        url: "${path}/notice.s?op=query",
        data: nid,
        async:true, // 异步请求
        cache:false, // 设置为 false 将不缓存此页面
        dataType: 'json', // 返回对象
        success: function(result) {
            if(result.code == -1){
            	$.messager.show({
    				title:'提示',
    				msg:result.msg,
    				showType:'fade',
    				timeout:300,
    				style:{
    					left:'',
    					right:0,
    					bottom:''
    				}
    			});
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
            }
            if(result.code == 1){
        	    if(location.href.indexOf('#mainbody')==-1){
        	        location.href=location.href+"#mainbody";
        	        location.reload();
        	     }   
           }
        }
    });
});
</script>
	<title>公告详情</title>
</head>
<body >
<jsp:include page="back/common/header.jsp"></jsp:include>
<div class="mainbody" id="mainbody"style="background: #FFF url(images/bodybg.png) repeat-x;">
	<div class="container clearfix" style="background-color: white">
		<div class="mainbody_topbg"></div>
		<div class="bread">当前位置：
			<a href="${path}/back/lhoption/index.jsp">首页</a> >
			<a href="${path}/back/lhoption/notice.jsp">公告</a> >
			<a href="${path}/back/notice-detail.jsp?nid=${noticeDetail.nid}">公告详情</a>
		</div>
		<div class="maincontent fl">
			<div class="post">
				<h2><a href="${path}/notice-detail.jsp?nid=${noticeDetail.nid}">${noticeDetail.ntitle}</a></h2>
				<div class="postdata">
					<div class="date">${date[0] }年${date[1] }月${date[2] }日</div>
					<div class="cate">发表于 <a href="#">公告</a> | </div>
					<div class="cate">浏览量: <span>${noticeDetail.nnumber}</span>次</div>
				</div>
				<div class="content">
					<p>${noticeDetail.ncontent}</p>
					<p style="text-align: right;">${noticeDetail.nauthor}<br />${noticeDetail.ntime}</p>
				</div>
			</div>
		</div>
		<div class="sidebar fr">
			<ul>
				<li>
					<h2>最新公告</h2>
					<ul>
						<c:if test="${noticeShow.size()> 0}" var="flag" scope="session">
						<c:forEach items="${noticeShow}" var="n">
							<li><i class="icon-bell red"></i><a href="${path}/notice-detail.jsp?nid=${n.nid}">${n.ntitle }</a></li>
						</c:forEach>
						</c:if>
						
						<c:if test="${not flag}">
						   	<li><i class="icon-bell red"></i>暂无新公告</li>
						</c:if>
					</ul>
				</li>
				<li>
					<h2>公告存档</h2>
					<select  style="width: 130px;margin-top: 10px;">
						<option value="">选择月份</option>
						<option> 2015年八月 </option>
						<option> 2015年七月 </option>
						<option> 2015年六月 </option>
						<option> 2015年五月 </option>
						<option> 2015年四月 </option>
						<option> 2015年三月 </option>
						<option> 2015年二月 </option>
						<option> 2015年一月 </option>
						<option> 2014年十二月 </option>
						<option> 2014年十一月 </option>
						<option> 2014年十月 </option>
						<option> 2014年九月 </option>
						<option> 2014年八月 </option>
						<option> 2014年七月 </option>
						<option> 2014年六月 </option>
						<option> 2014年五月 </option>
						<option> 2014年四月 </option>
						<option> 2014年三月 </option>
						<option> 2014年二月 </option>
						<option> 2014年一月 </option>
						<option> 2013年十二月 </option>
						<option> 2013年十一月 </option>
						<option> 2013年十月 </option>
						<option> 2013年九月 </option>
						<option> 2013年八月 </option>
						<option> 2013年七月 </option>
						<option> 2013年六月 </option>
						<option> 2013年五月 </option>
						<option> 2013年四月 </option>
						<option> 2013年三月 </option>
						<option> 2013年二月 </option>
						<option> 2013年一月 </option>
						<option> 2012年十二月 </option>
						<option> 2012年十一月 </option>
						<option> 2012年十月 </option>
						<option> 2012年九月 </option>
						<option> 2012年八月 </option>
						<option> 2011年九月 </option>
						<option> 2011年八月 </option>
						<option> 2011年七月 </option>
						<option> 2011年六月 </option>
						<option> 2011年四月 </option>
						<option> 2011年三月 </option>
						<option> 2011年二月 </option>
						<option> 2011年一月 </option>
						<option> 2010年十二月 </option>
						<option> 2010年十月 </option>
						<option> 2010年九月 </option>
						<option> 2010年八月 </option>
						<option> 2010年七月 </option>
						<option> 2010年六月 </option>
						<option> 2010年五月 </option>
					</select>
				</li>
			</ul>
			<div class="custom_ads"></div>
		</div>
		<div class="mainbody_bottombg"></div>
	</div>
</div>
<jsp:include page="back/common/footer.jsp"></jsp:include>
</body>
</html>