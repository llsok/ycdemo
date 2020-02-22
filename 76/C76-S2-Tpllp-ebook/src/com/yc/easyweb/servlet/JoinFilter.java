package com.yc.easyweb.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 过滤器也是服务器组件
 * 过滤器的配置： web.xml 注解
 */
public class JoinFilter implements Filter {
	public void destroy() {	}

	/**
	 * 过滤方法
	 *  FilterChain  过滤器链对象
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(
			ServletRequest request,
			ServletResponse response, 
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse)response;
		HttpSession session  = httpRequest.getSession();
		String path = httpRequest.getSession().getServletContext().getContextPath();
		path = path +"/join.jsp";
		if(session.getAttribute("loginedUser") == null) {
			request.setAttribute("msg", "请先登录系统");
			response2.sendRedirect(path);
			return;
		}
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
