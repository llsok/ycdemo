<%@page import="com.yc.damai.biz.*"%>
<%@page import="java.util.*"%>
<%@page import="com.yc.damai.bean.Lottery"%>
<%@page import="com.yc.damai.dao.LotteryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>好运双色球</title>
<link rel="stylesheet" type="text/css" href="css/detail.css" />
</head>

<body>
	<div id="ball_header" class="ball_header">
		<div class="header_01" id="header_01">
			<img src="img/index.jpg" title="双色球开奖信息"
				style="width: 50px; height: 50px;" /> <span class="title_span01"
				id="title_span01">双色球开奖信息</span>
		</div>
		<div class="header_02" id="header_02">
			<span>[每周二、四、日开奖]</span>
		</div>
		<div class="header_03" id="header_04">
			<input type="button" value="返回"
				onclick="window.location.href = 'index.jsp'" />
		</div>

	</div>
	<%
		String id = request.getParameter("id");
		Lottery lottery = new Lottery();
		LotteryBiz biz = new LotteryBiz();
		lottery.setNum(id);
		List<Lottery> list = biz.query(lottery);
		// 将 商品 map 添加到页面上下文中， 就是用 EL 表达式输出值
		if (list.size() != 0) {
			pageContext.setAttribute("list", list.get(0));
			String year = list.get(0).getOpendate();
			String[] numbers = year.split("-");
			year = numbers[0];
			pageContext.setAttribute("year", year);
		}
	%>
	<div class="ballheader" id="ballheader">
		<table class="ball_table01" id="ball_table01" width="100%"
			cellspacing="0" cellpadding="0" bordercolor="#ADD3EF" border="1">
			<tbody>
				<tr>
					<td class="td_title01" id="td_title01"><span>第<b
							style="color: red;">${list.num }</b>期
					</span> <span class="td_title01_span">开奖日期：${list.opendate }
							兑奖截止日期：${year }年12月22日</span></td>

				</tr>
				<tr>
					<td class="td_title02" id="td_title02">
						<div class="div_table">
							<table class="ball_table02" id="ball_table02" width="100%"
								cellspacing="0" cellpadding="1" border="1" bordercolor="#ADD3EF">
								<tr>
									<td width="80px">开奖号码</td>
									<td>
										<div class="ball" id="ball">
											<ul>
												<li class="ball_red">${list.redone }</li>
												<li class="ball_red">${list.redtwo }</li>
												<li class="ball_red">${list.redthree }</li>
												<li class="ball_red">${list.redfour }</li>
												<li class="ball_red">${list.redfive }</li>
												<li class="ball_red">${list.redsix }</li>
												<li class="ball_blue">${list.blue }</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td width="80px">出球顺序</td>
									<td style="padding-left: 46px;">${list.redone }
										${list.redtwo } ${list.redthree } ${list.redfour }
										${list.redfive } ${list.redsix } ${list.blue }</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="td_title02_span01" id="td_title02_span01">
							本期销量：<span>${list.sale }元</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="empty"></div>
		<table class="detail" id="detail" width="100%" cellspacing="0"
			cellpadding="0" bordercolor="#ADD3EF" border="1">
			<tr>
				<td class="td_title03" id="td_title03" colspan="3">
					<div class="td_title03_div">
						<b>开奖详情</b>
					</div>
				</td>
			</tr>
			<tr align="center">
				<td>奖项</td>
				<td>中奖注数</td>
				<td>单注奖金(元)</td>
			</tr>
			<tr align="center">
				<td>一等奖</td>
				<td>${list.firstprize }</td>
				<td>10,000,000</td>
			</tr>
			<tr align="center">
				<td>二等奖</td>
				<td>${list.secondeprize }</td>
				<td>200,000</td>
			</tr>

		</table>
	</div>
		
</body>
</html>