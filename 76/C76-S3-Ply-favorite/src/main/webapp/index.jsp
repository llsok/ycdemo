<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
  <head>
    
    <title>搜藏</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	<script type="text/javascript">
	function add(){
		window.open ('fav.do?op=toAdd', 'newwindow', 
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
					
						
						
					<tr><td><a href="fav.do?op=toList&type=Hibernate">Hibernate</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=Java">Java</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=JPA">JPA</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=JSF">JSF</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=Spring">Spring</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=Struts">Struts</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=不能说的秘密">不能说的秘密</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=盗墓笔记">盗墓笔记</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=电影">电影</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=断臂山">断臂山</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=购物">购物</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=花钱">花钱</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=交易">交易</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=教育">教育</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=连续剧">连续剧</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=刘烨">刘烨</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=门户">门户</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=士兵突击">士兵突击</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=王筝">王筝</a></td></tr>
						
					
						
						
					<tr><td><a href="fav.do?op=toList&type=赚钱">赚钱</a></td></tr>
						
					
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