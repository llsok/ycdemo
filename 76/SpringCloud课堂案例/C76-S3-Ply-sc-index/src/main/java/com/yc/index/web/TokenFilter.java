package com.yc.index.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;

/**
 * 令牌过滤器:
 * 	令牌  === sessionId
 * @author 廖彦
 *
 */
@Component
public class TokenFilter extends ZuulFilter {

	@Override
	// 方法则是判断是否需要执行该过滤器
	public boolean shouldFilter() {
		return true;
	}

	@Override
	// 是所要执行的具体过滤动作
	public Object run() throws ZuulException {
		// 获取 zuul 的请求上下文对象
		RequestContext requestContext = RequestContext.getCurrentContext();
		// 获取 Servlet请求对象
		HttpServletRequest req = requestContext.getRequest();
		// 获取令牌
		String token = req.getParameter("token");
		if (token == null) {
			// 设置是否发送 zuul 响应
			requestContext.setSendZuulResponse(false);
			// 设置结果码 401 ==> 4xx 客户端错误
			requestContext.setResponseStatusCode(401);
			// 设置响应的信息
			requestContext.setResponseBody("{\"result\":\"accessToken is empty!\"}");
		}
		return null;
	}

	@Override
	// pre 前置, post 后置, route 路由中, error 错误
	public String filterType() {
		return "pre";
	}

	@Override
	// 拦截的顺序 0 表示第一个
	public int filterOrder() {
		return 0;
	}

}
