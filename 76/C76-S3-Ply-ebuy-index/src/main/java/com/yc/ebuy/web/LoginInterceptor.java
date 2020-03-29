package com.yc.ebuy.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

/**
 * SpringBoot定义拦截器
 * 1. 如果没有引入资源, 可以不用加组件注解
 * 2. 简单配置实现 WebMvcConfigurer , 高级配置继承 WebMvcConfigurationSupport
 * 3. 启动类可以直接继承或实现
 */
public class LoginInterceptor implements HandlerInterceptor{

	/**
	 * 	返回 true 允许访问目标资源
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginedUser") == null) {
			String uri = request.getRequestURI();
			// 保存当前用户访问的地址和参数( GET )
			session.setAttribute("uri", uri);
			System.out.println("session id: " + session.getId());
			response.sendRedirect("http://127.0.0.1/tologin");
			return false;
		}
		return true;
	}

}
