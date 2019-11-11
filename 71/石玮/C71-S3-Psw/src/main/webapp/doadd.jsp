<%@page import="com.yc.favorite.biz.FavoriteBiz"%>
<%@page import="com.yc.favorite.util.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.yc.favorite.dao.FavoriteMapper"%>
<%@page import="com.yc.favorite.bean.Favorite"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%


	
	// 设置字符集编码
	request.setCharacterEncoding("utf-8");

	String fLabel = request.getParameter("fName");
	String fUrl = request.getParameter("fUrl");
	String fTags=request.getParameter("fTags");
	String fDesc = request.getParameter("fDesc");
	
	Favorite favorite= new Favorite();
	favorite.setfDesc(fDesc);
	favorite.setfLabel(fLabel);
	favorite.setfUrl(fUrl);
	favorite.setfTags(fTags);

	FavoriteBiz fb = new FavoriteBiz();

	String msg =	fb.addFavorite(favorite);
		
	System.out.print(msg+"=========");	
	response.getWriter().append(msg);
	
	//request.getRequestDispatcher("add.jsp").forward(request, response);
		
	
		
		
	


%>