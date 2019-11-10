<%@page import="java.util.ArrayList"%>
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
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	SqlSession sess=MyBatisHelper.getSession();
	ProductMapper pm=sess.getMapper(ProductMapper.class);
	
	
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
	
	
	//数据的处理和转化
	int priceType=0;
	int imageType=0;
	List<Integer> hotList = new ArrayList<Integer>();
	List<Integer> cidList = new ArrayList<Integer>();
	
	Timestamp fromTime=null;
	Timestamp toTime =null;
	
	//String --> timestamp 时间格式的转化
	if(from!=null && from.equals("")==false){
		fromTime=new Timestamp(System.currentTimeMillis());
		fromTime=Timestamp.valueOf(from+" 00:00:00");
	}
	if(to!=null && to.equals("")==false){
		toTime =new Timestamp(System.currentTimeMillis());
		toTime=Timestamp.valueOf(to+" 00:00:00");
	}
	//价格转化
	if( combo_price!=null ){
		switch(combo_price){
			case "百元以下":
				priceType= 1; 
				break;
			case "101 ~ 500":
				priceType=2;
				break;
			case "501 ~ 1000":
				priceType=3;
				break;
			case "1001 ~ 5000":
				priceType=4;
				break;
			case "5001 ~ 10000":
				priceType=5;
				break;
			case "万元以上":
				priceType=6;
				break;
			case "--请选择--":
				priceType=0;
				break;
		}
	}
	//图片转化
	if(combo_pic!=null){
		switch(combo_pic){
		case"--请选择--":
			imageType=0;
			break;
		case"已传图片":
			imageType=1;
			break;
		case"未上传图片":
			imageType=2;
			break;
		}
	}
	//热卖&非热卖
	if(hot!=null&&hot.equals("true")){
		hotList.add(1);
	}
	if(noHot!=null&& noHot.equals("true")){
		hotList.add(0);
	}
	
	if(cloth!=null&& cloth.equals("true")){
		cidList.add(1);
	}
	if(shoe!=null&& shoe.equals("true")){
		cidList.add(2);
	}
	if(sport!=null&& sport.equals("true")){
		cidList.add(3);
	}
	if(jewelry!=null&& jewelry.equals("true")){
		cidList.add(4);
	}
	if(phone!=null&& phone.equals("true")){
		cidList.add(5);
	}
	if(offical!=null&& offical.equals("true")){
		cidList.add(6);
	}
	if(makeUp!=null&& makeUp.equals("true")){
		cidList.add(7);
	}
	
	if(pname==null  &&   from==null   &&   to==null  &&  combo_price==null && combo_pic==null && hot==null 
			&& noHot==null && shoe==null&& sport==null && jewelry==null && phone==null  
			&& offical==null && cloth==null && makeUp==null){
		
		List<Product> productList=sess.selectList("com.lzy.damai.dao.ProductMapper.selectAll");
		Gson gson=new GsonBuilder().setDateFormat("yyyy-mm-dd HH:MM:SS").create();
		String json=gson.toJson(productList);
		response.getWriter().append(json);

	}else{
		List<Product> productList=pm.selectByCondition(pname, fromTime, toTime, priceType, imageType, hotList, cidList);
		Gson gson=new GsonBuilder().setDateFormat("yyyy-mm-dd HH:MM:SS").create();
		String json=gson.toJson(productList);
		response.getWriter().print(json);
	}
	
	
	
	
	
%>