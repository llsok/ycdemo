<%@page import="java.sql.Timestamp"%>
<%@page import="com.yc.damai.dao.ProductMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.yc.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.yc.damai.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

//System.out.println(request.getParameter("types"));
String name=request.getParameter("name");
String putdate=request.getParameter("putdate");
String outdate=request.getParameter("outdate");
String price=request.getParameter("price");
String image=request.getParameter("image");
String isHot=request.getParameter("isHot");
String types=request.getParameter("types");
if(null==name || name==""){
	name=null;
}else if(null!=name){
	name="%"+name+"%";
}
if(putdate==""){
	putdate=null;
}
if(outdate==""){
	outdate=null;
}
Integer imageType=null;
Integer priceType=null;
if(null!=price && price.equals("百元以下")){
	priceType=1;
}else if(null!=price && price.equals("101 ~ 500")){
	priceType=2;
}else if(null!=price && price.equals("501 ~ 1000")){
	priceType=3;
}else if(null!=price && price.equals("1001 ~ 5000")){
	priceType=4;
}else if(null!=price && price.equals("5001 ~ 10000")){
	priceType=5;
}else if(null!=price && price.equals("万元以上")){
	priceType=6;
}

if(null!=image && image.equals("已传图片")){
	imageType=1;
}else if(null!=image && image.equals("未上传图片")){
	imageType=2;
}

System.out.println(types);
String[] hot=null;
Integer[] hotList=null;
if(isHot!=null && isHot!=""){
	hot=isHot.split(",");
	hotList=new Integer[hot.length];
	for(int i=0;i<hot.length;i++){
		hotList[i]=Integer.parseInt(hot[i]);
	}
}
String[] type=null;
Integer[] cidList=null;
if(types!=null && types!=""){
	type=types.split(",");
	cidList=new Integer[type.length];
	for(int i=0;i<type.length;i++){
		cidList[i]=Integer.parseInt(type[i]);
	}
}
Timestamp begin =null;
Timestamp end =null;
if(null!=putdate && putdate!=""){
	begin =Timestamp.valueOf(putdate+" 00:00:00");
}
if(null!=outdate && outdate!=""){
	end =Timestamp.valueOf(outdate+" 00:00:00");
}
SqlSession sess=MyBatisHelper.getSession();
ProductMapper pm=sess.getMapper(ProductMapper.class);
List<Product> products=pm.selectByCondition(name, begin, end, priceType, imageType, hotList, cidList);

Gson gson=new Gson();
String info1 =gson.toJson(products);
StringBuffer sb =new StringBuffer();
sb.append(info1);
response.getWriter().print(sb.toString());

sess.close();
%>