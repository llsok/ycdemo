<%@page import="java.util.List"%>
<%@page import="com.yc.favorite.dao.FavoriteMapper"%>
<%@page import="com.yc.favorite.dao.TagMapper"%>
<%@page import="com.yc.favorite.bean.Favorite"%>
<%@page import="com.yc.favorite.bean.Tag"%>
<%@page import="com.yc.favorite.util.MyBatisHelper"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en-US">
  <head>
    
    <title>搜藏</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	
	<script type="text/javascript">
	function add(){
		window.open ('add.jsp', 'newwindow', 
		'height=300, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	}
	</script>
  </head>
  <body>
    <form name="favForm" method="post" action="/cang/fav.do;jsessionid=FF8C0487A99814B144B07E5633524A0F">
      <input type="hidden" name="op" value="toList" />
    
    <div class="banner" valign="top">
    	 搜藏
    </div>
      <%
      SqlSession sess =  MyBatisHelper.getSession();
      TagMapper tm = sess.getMapper(TagMapper.class);
      FavoriteMapper fm  = sess.getMapper(FavoriteMapper.class);
      Tag tag = new Tag();
      // Favorite favorite = new Favorite();
      List<Tag> tlist= tm.selectAll();
      List<Favorite> flist = fm.selectAll();
    		  
      
      %>
	<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td style="text-align:right;" valign="top">
			<!-- 左边Tag列表 -->
				<div class="left_labels" >
				 
				
				<table class="labels_table" cellspacing="0" cellpadding="0" border="0">
					<tr><td><a href="#" onclick="add();" style="font-weight:bold;">添加书签</a></td></tr>
					<tr>
						<td class="selected_label">
							<a href="fav.do?op=toList&type=-1">全部</a>
						</td>
					</tr>
					<tr>
						<td >
							<a href="fav.do?op=toList&type=0">未分类</a>
						</td>
					</tr>
					
						<%for(Tag t:tlist){ %>
						
					<tr><td><a href="fav.do?op=toList&type=<%=t.gettName()%>"><%=t.gettName()%></a></td></tr>
						
					
					<%} %>
					<tr>
						<td>
							<a style="font-weight:bold;" href="fav.do?op=toCloud">云图</a>
						</td>
					</tr>
				</table>
				</div>
			</td>
			<td>
			<!-- 右边fav内容 -->
				<div class="content_links">
				
				<div style="padding:6px 10px;">	
					<div>
						<a href="http://www.apache.org/struts/" style="color:blue;font-size:18px;" target="_blank">Apache Struts</a>
					</div>
					<div style="color:black;font-size:16px;">	
						Struts官方站点
					</div>
					<div style="color:green;font-size:14px;">
						http://www.apache.org/struts/
					</div>
				</div>	
				
				<div style="padding:6px 10px;">	
					<div>
						<a href="http://www.sougaou.com" style="color:blue;font-size:18px;" target="_blank">搜狗</a>
					</div>
					<div style="color:black;font-size:16px;">	
						aa
					</div>
					<div style="color:green;font-size:14px;">
						http://www.sougaou.com
					</div>
				</div>	
				
				<div style="padding:6px 10px;">	
					<div>
						<a href="http://www.sina.com" style="color:blue;font-size:18px;" target="_blank">新浪</a>
					</div>
					<div style="color:black;font-size:16px;">	
						国内外著名门户网站
					</div>
					<div style="color:green;font-size:14px;">
						http://www.sina.com
					</div>
				</div>	
				
				<div style="padding:6px 10px;">	
					<div>
						<a href="http://www.taobao.com" style="color:blue;font-size:18px;" target="_blank">淘宝</a>
					</div>
					<div style="color:black;font-size:16px;">	
						这是一个好网站在。。
					</div>
					<div style="color:green;font-size:14px;">
						http://www.taobao.com
					</div>
				</div>	
				
				</div>
			</td>
		</tr>
	</table> 
	
    </form>
  </body>
</html>