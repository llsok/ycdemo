<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<ul class="b_P_Sort_list">
	<li><i class="orange  fa fa-reorder"></i><a href="javascript:;"
		onclick="selectDate('0')">全部订单(${eorderHand.size()}) </a></li>
	<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:;"
		onclick="selectDate('6')">已完成(${orderNum[3]})</a></li>
	<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:;"
		onclick="selectDate('1')">待付款(${orderNum[0]})</a></li>
	<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:;"
		onclick="selectDate('2')">待发货(${orderNum[1]})</a></li>
	<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:;"
		onclick="selectDate('3')">待收货(${orderNum[2]})</a></li>
</ul>