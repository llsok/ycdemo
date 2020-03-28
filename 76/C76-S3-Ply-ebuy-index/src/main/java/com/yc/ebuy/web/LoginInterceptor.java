package com.yc.ebuy.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * dingyi 
 * @author 廖彦
 *
 */
@Component
public class LoginInterceptor implements HandlerInterceptor{

	/**
	 * 	返回 true 允许访问目标资源
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginedUser") == null) {
			response.sendRedirect("tologin");
			return false;
		}
		return true;
	}

}
