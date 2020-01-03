<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<ul class="b_P_Sort_list">
<li><i class="fa fa-users green"></i> <a href="javascript:;"
	onclick="selectAdmin('0');">全部管理员(${adminAll.size() }) </a></li>
<li><i class="fa fa-users orange"></i> <a href="javascript:;"
	onclick="selectAdmin('1');">超级管理员(${adminSize[0] }) </a></li>
<li><i class="fa fa-users orange"></i> <a href="javascript:;"
	onclick="selectAdmin('5');">普通管理员(${adminSize[1] }) </a></li>
	</ul>