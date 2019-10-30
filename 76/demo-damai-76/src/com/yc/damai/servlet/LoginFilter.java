package com.yc.damai.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 过滤器也是服务器组件
 * 
 * 过滤器的配置： web.xml  注解
 */
public class LoginFilter implements Filter {

	/**
	 * 销毁方法
	 */
	public void destroy() { }

	/**
	 *  过滤方法
	 *  FilterChain chain  过滤器链对象
	 */
	public void doFilter(
			ServletRequest request, 
			ServletResponse response, 
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		
		if(session.getAttribute("loginedUser") == null){
			request.setAttribute("msg", "请先登录系统！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		// 正常情况下，必须执行该代码，表示跳转一个过滤器或目标资源
		chain.doFilter(request, response);
		
	}

	/**
	 * init 初始化方法
	 */
	public void init(FilterConfig fConfig) throws ServletException { }

}
