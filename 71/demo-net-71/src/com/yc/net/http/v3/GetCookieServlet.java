package com.yc.net.http.v3;

import java.io.PrintWriter;

/**
 * 实现响应输出流 输出 html 代码
 */
public class GetCookieServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		
		pw.print("<h1>测试  获取 cookie 值!</h1>");
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null){
			for(Cookie c : cookies){
				pw.print(c.getName() + " = " + c.getValue() + "<br>");
			}
		}
		
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
	
	

}
