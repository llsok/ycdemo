<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>大麦商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="css/style.css" rel="stylesheet" type="text/css"/>
  </head>
  
  <body>
<div id="divcontent">
<table width="850px" border="0" cellspacing="0">
  <tr>
    <td style="padding:30px; text-align:center"><table width="60%" border="0" cellspacing="0" style="margin-top:70px">
      <tr>
        <td style="width:98"><img src="images/IconTexto_WebDev_009.jpg" width="128" height="128" /></td>
        <td style="padding-top:30px"><font style="font-weight:bold; color:#FF0000">	<ul class="actionMessage">
        		<%-- 使用 EL 表达式 输出 request 的对象属性 msg， 等效于 request.getAttribute("msg") --%>
                <li><span>${msg}</span></li>
	</ul>
</font><br />
            <br />
          <a href="index.jsp">首页</a>
          <a href="reg.jsp">注册</a>
          <a href="login.jsp">登录</a>
         </td>
      </tr>
    </table>
    <h1>&nbsp;</h1></td>
    </tr>
</table>
</div>
</body>
</html>
    