<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.lzy.damai.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.lzy.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String name=request.getParameter("name");
	System.out.println(name);
	SqlSession sess=MyBatisHelper.getSession();
	List<Product> productList=sess.selectList("com.lzy.damai.dao.ProductMapper.selectAll");
	Gson gson=new GsonBuilder().setDateFormat("yyyy-mm-dd HH:MM:SS").create();
	String json=gson.toJson(productList);
	response.getWriter().append(json);
%>