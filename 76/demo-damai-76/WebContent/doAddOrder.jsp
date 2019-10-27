<%@page import="java.util.List"%>
<%@page import="com.yc.damai.util.DBHelper"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	Map<String,Object> user = (Map<String,Object>)session.getAttribute("loginedUser");
	Integer uid = (Integer)user.get("uid");
	String addr = request.getParameter("order.addr");
	String phone = request.getParameter("order.phone");
	String name = request.getParameter("order.name");
	
	// total 字段 暂时设置为 null
	String sql = "insert into orders values(null, null, now(), 1, ?, ?, ? , ?)";
	DBHelper.update(sql, addr, phone, uid, name);
	
	// 获取刚才添加的订单编号
	String oid = "" + DBHelper.selectValue("select max(oid) from orders");
	
	sql = "select a.*,b.shop_price from cartitem a join product b on a.pid=b.pid where uid=?";
	
	List<Map<String,Object>> list = DBHelper.selectList(sql, uid);
	
	// 写入订单明细
	for(Map<String,Object> cartitem : list){
		sql = "insert into orderitem values (null, ?, ? * ?, ?, ?)";
		DBHelper.update(sql, cartitem.get("count"),
				cartitem.get("count"),
				cartitem.get("shop_price"),
				cartitem.get("pid"),
				oid);
	}
	
	// 清空购物车！！！！注意：是当前用户的购物车
	DBHelper.update("delete from cartitem where uid=?", uid);

	request.setAttribute("msg", "订单提交成功！您的订单编号：" + oid);
	request.getRequestDispatcher("msg.jsp").forward(request, response);

%>