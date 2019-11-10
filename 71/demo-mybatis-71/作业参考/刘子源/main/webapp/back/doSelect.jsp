<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.lzy.damai.dao.ProductMapper"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.lzy.damai.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.lzy.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	Timestamp fromTime=new Timestamp(System.currentTimeMillis());
	Timestamp toTime =new Timestamp(System.currentTimeMillis());
	String pname=request.getParameter("pname");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	String combo_price=request.getParameter("combo_price");
	String combo_pic=request.getParameter("combo_pic");
	String hot=request.getParameter("hot");
	String noHot=request.getParameter("noHot");
	String shoe=request.getParameter("shoe");
	String sport=request.getParameter("sport");
	String jewelry=request.getParameter("jewelry");
	String phone=request.getParameter("phone");
	String offical=request.getParameter("offical");
	String cloth=request.getParameter("cloth");
	String makeUp=request.getParameter("makeUp");
	
	if(from!=""){
		fromTime=Timestamp.valueOf(from);
	}
	if(to!=""){
		toTime=Timestamp.valueOf(to);
	}
	
	System.out.println("     ======>"+pname+"<======");
	System.out.println("     ======>"+from+"<======");
	System.out.println("     ======>"+fromTime+"<======");
	System.out.println("     ======>"+toTime+"<======");
	System.out.println("     ======>"+to+"<======");
	System.out.println("     ======>"+combo_price+"<======");
	System.out.println("     ======>"+combo_pic+"<======");
	System.out.println("     ======>"+hot+"<======");
	System.out.println("     ======>"+noHot+"<======");
	System.out.println("     ======>"+shoe+"<======");
	System.out.println("     ======>"+sport+"<======");
	System.out.println("     ======>"+jewelry+"<======");
	System.out.println("     ======>"+phone+"<======");
	System.out.println("     ======>"+offical+"<======");
	System.out.println("     ======>"+cloth+"<======");
	System.out.println("     ======>"+makeUp+"<======");
	
	SqlSession sess=MyBatisHelper.getSession();
	ProductMapper pm=sess.getMapper(ProductMapper.class);
	List<Product> productList=sess.selectList("com.lzy.damai.dao.ProductMapper.selectAll");
	Gson gson=new GsonBuilder().setDateFormat("yyyy-mm-dd HH:MM:SS").create();
	String json=gson.toJson(productList);
	response.getWriter().append(json);
%>