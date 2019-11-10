<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.yc.damai.dao.MyBatisHelper"%>
<%@page import="com.yc.damai.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User user=(User)session.getAttribute("user");
Product product=(Product)session.getAttribute("product");
if(product!=null){
	session.removeAttribute("product");
}
Cartitem cartitem=new Cartitem();
cartitem.setUser(user);
cartitem.setProduct(product);
SqlSession sess= MyBatisHelper.getSession();
cartitem = sess.selectOne("com.yc.damai.dao.CartitemMapper.selectCartByIds", cartitem);

try{
	if(null!=cartitem){
		//修改
		cartitem.setCount(Integer.parseInt(request.getParameter("count")));
		int result = sess.update("com.yc.damai.dao.CartitemMapper.updateCount", cartitem);
		if(result>0){
			sess.commit();
			response.sendRedirect("cart.jsp");
		}else{
			sess.rollback();
		}
	}else{
		//添加
		cartitem=new Cartitem();
		cartitem.setUser(user);
		cartitem.setProduct(product);
		cartitem.setCount(Integer.parseInt(request.getParameter("count")));
		int result = sess.insert("com.yc.damai.dao.CartitemMapper.addCart", cartitem);
		if(result>0){
			sess.commit();
			response.sendRedirect("cart.jsp");
		}else{
			sess.rollback();
		}
	}
}catch(Exception e){
	sess.rollback();
}finally{
	sess.close();
}

%>