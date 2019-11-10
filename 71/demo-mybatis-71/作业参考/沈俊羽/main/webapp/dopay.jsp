<%@page import="com.yc.damai.dao.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.damai.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
Orders orders=(Orders)session.getAttribute("orders");
session.removeAttribute("orders");
orders.setAddr(request.getParameter("order.addr"));
orders.setName(request.getParameter("order.name"));
orders.setPhone(request.getParameter("order.phone"));
List<Cartitem> cartitems=(List<Cartitem>)session.getAttribute("cartitems");
SqlSession sess=MyBatisHelper.getSession();
try{
	int result1=sess.insert("com.yc.damai.dao.OrdersMapper.createOrders",orders);
	
	Orderitem orderitem=null;
	for(Cartitem cartitem:cartitems){
		orderitem=new Orderitem();
		orderitem.setCount(cartitem.getCount());
		orderitem.setOid(orders.getOid());
		orderitem.setPid((long)cartitem.getProduct().getPid());
		orderitem.setSubtotal((float)(cartitem.getCount()*cartitem.getProduct().getShopPrice()));
		
		int result = sess.insert("com.yc.damai.dao.OrderitemMapper.createItem",orderitem);
		
		int result2 = sess.delete("com.yc.damai.dao.CartitemMapper.deleteCartitem", cartitem.getCiid());
	}
	response.sendRedirect("msg.jsp");
	sess.commit();
}catch(Exception e){
	response.sendRedirect("pay.jsp");
	sess.rollback();
}finally{
	sess.close();
}
%>