package com.yc.net.http.v3;

public class RedirectServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		// ????
		
		/**
		 * 1、页面跳转（请求转发、响应重定向）
		 * 
		 * 2、直接输出 html 内容   或者  json 数据
		 * 
		 */
		
		response.sendRedirect("index.html");
		
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
	
	

}
