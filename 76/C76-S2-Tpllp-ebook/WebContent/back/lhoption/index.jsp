<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/css/index.css"/>
	<link rel="stylesheet" href="${path}/css/swiper3.07.min.css"/>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${path}/js/jquery-1.11.2.min.js"></script>
	<script src="${path}/js/koala.min.1.5.js"></script>
	<style>
		.swiper-container {
			width: 1100px;
			height: 300px;
			margin: 0 auto;
		}
	</style>
	<script type="text/javascript">
	Qfast.add('widgets', { path: "${path}/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
	Qfast(false, 'widgets', function () {
		K.tabs({
			id: 'fsD1',   //焦点图包裹id
			conId: "D1pic1",  //** 大图域包裹id
			tabId:"D1fBt",
			tabTn:"a",
			conCn: '.fcon', //** 大图域配置class
			auto: 1,   //自动播放 1或0
			effect: 'fade',   //效果配置
			eType: 'click', //** 鼠标事件
			pageBt:true,//是否有按钮切换页码
			bns: ['.prev', '.next'],//** 前后按钮配置class
			interval: 2750  //** 停顿时间
		})
	});
	//页面加载函数
	$(function(){
		$('#teachBook').load('${path}/back/lhoption/indexTeach.jsp');
		$('#toolBook').load('${path}/back/lhoption/indexTool.jsp');
	});
	//查询
function show(btid1,btid2,obj){
		if(obj != "0"){
			$("#index-book-show a").removeClass("on");
			$(obj).addClass("on"); 
		}
	var param = "btid1="+btid1+"&btid2=" +btid2 ;
	$.ajax({
        type: "post",
        url: "${path}/show.s?op=queryUserIndex",
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
        		if(btid1 !=  "0"){
        			$('#teachBook').load('${path}/back/lhoption/indexTeach.jsp');
        		}
        		if(btid2 !=  "0"){
        			var url = '${path}/back/lhoption/indexTool.jsp?time='+btid2;
        			$('#toolBook').load(url);
        		}
        	}
        }
    });
}
</script>
	<title>易书网</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="banner container" id="index-Show">
	<img src="${path}/images/notice.png" alt="" style="width: 1200px;height: auto;"/>
	<div class="clearfix">
		<div class="about fl">
			<h1>易书网</h1>
			<img src="${path}/images/logo9.png" alt=""/>
			<p><span>易书网</span>是一个网上书商城。力求打造网上最大的中文图书借换系统二手书交换系统力求打造是是网上最大的中文图书借换系统二手书交换系统。易书网来了,让爱书的你花极小的支出(1到2元)就可以读到你喜欢的书且没有后顾之忧哦！</p>
		</div>
		<div id="fsD1" class="focus fl">
			<div id="D1pic1" class="fPic">
				<div class="fcon">
					<a href="javascript:void();"><img src="${path}/images/focus1.jpg" /></a>
					<span class="shadow"><a href="${path }/back/lyw/list.jsp">便宜出售一本好书</a></span>
				</div>
				<div class="fcon">
					<a href="javascript:void();"><img src="${path}/images/focus2.jpg" /></a>
					<span class="shadow"><a href="${path }/back/lyw/list.jsp">便宜出售一本好书</a></span>
				</div>
				<div class="fcon">
					<a href="javascript:void();"><img src="${path}/images/focus3.jpg" /></a>
					<span class="shadow"><a href="${path }/back/lyw/list.jsp">便宜出售一本好书</a></span>
				</div>
				<div class="fcon">
					<a href="javascript:void();"><img src="${path}/images/focus4.jpg" /></a>
					<span class="shadow"><a href="${path }/back/lyw/list.jsp">便宜出售一本好书</a></span>
				</div>
				<div class="fcon">
					<a href="javascript:void();"><img src="${path}/images/focus5.jpg" /></a>
					<span class="shadow"><a href="${path }/back/lyw/list.jsp">便宜出售一本好书</a></span>
				</div>
			</div>
			<div class="fbg">
				<div class="D1fBt" id="D1fBt">
					<a href="javascript:void(0)" class="current"><i>1</i></a>
					<a href="javascript:void(0)"><i>2</i></a>
					<a href="javascript:void(0)"><i>3</i></a>
					<a href="javascript:void(0)"><i>4</i></a>
					<a href="javascript:void(0)"><i>5</i></a>
				</div>
			</div>
		</div>
		<div class="help fr">
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
			<h2>新手帮助</h2>
			<ul>
				<li><a href="${path}/back/lhoption/help.jsp">如何买书</a></li>
			</ul>
		</div>
	</div>
	<div id="index-book-show">
	<div class="item clearfix" id="item1">
		<h1>教材区<span></span>
		</h1>
		<div class="list fl">
			<ul class="one">
				<c:forEach items="${teachSecond}" var="teachSecond">
					<li><a class="on" href="javascript:;" onclick="show('${teachSecond.btid}','0','0')">${teachSecond.btnamesecond}</a>
						<ul class="two">
							<c:forEach items="${btypes}" var="bookTypes">
								<c:if test="${bookTypes.btnamesecond.equals(teachSecond.btnamesecond) && bookTypes.btnamethird != null && !bookTypes.btnamethird.isEmpty()}"  var="flag"  scope="session">	
									<li><a href="javascript:;" onclick="show('${bookTypes.btid}','0','0')">${ bookTypes.btnamethird}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="book-wrap fr">
			<div class="book clearfix" id="teachBook">
				<jsp:include page="indexTeach.jsp"></jsp:include>
			</div>
		</div>
	</div>	
	
	<div class="item clearfix" id="item2">
		<h1>工具书区<span></span></h1>
		<ul class="tab clearfix">
			<c:forEach items="${btypes}" var="bookTypes">
				<c:if test="${bookTypes.btname.equals('工具书区')}" var="flag" scope="session">	
					<c:if test="${bookTypes.btnamesecond != null && !bookTypes.btnamesecond.isEmpty()}" var="flag" scope="session">	
						<li><a   href="javascript:;" onclick="show('0','${bookTypes.btid}',this)">${bookTypes.btnamesecond}</a></li>	
					</c:if>
				</c:if>
			</c:forEach>
		</ul>
		
		<div class="tab0 tabs clearfix">
			<div class="book clearfix" id="toolBook">
				<jsp:include page="indexTool.jsp"></jsp:include>
			</div>
		</div>
	</div>
	</div>
	<div class="item clearfix" id="item3">
		<h1>分享区<span></span></h1>
		<div class="tabs book clearfix">
		<c:forEach   items="${shareBook}" var="share">
				<dl>
					<dt><a href="${path}/detail.jsp?bid=${share.bid}"><img src="${share.bimg}" /></a></dt>
					<dd>
						<p><a href="${path}/detail.jsp?bid=${share.bid}">${share.bname}</a></p>
						<p>数量：${share.bnum}</p>
						<p><s>价格：￥${share.bprice}</s> ${share.bprice}</p>
					</dd>
				</dl>
			</c:forEach>
		</div>
	</div>
</div>
<div class="fixnav">
	<ul>
		<li><a href="#" title="1">教材区</a></li>
		<li><a href="#" title="2">工具书区</a></li>
		<li><a href="#" title="3">分享区</a></li>
		<li><a href="#" title="4">返回顶部</a></li>
		<li><a  href="http://wpa.qq.com/msgrd?v=3&uin=2078140086&site=qq&menu=yes">联系客服</a></li>
	</ul>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>