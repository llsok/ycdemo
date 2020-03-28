package com.yc.ebuy.web;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcInterceptorConfig implements WebMvcConfigurer {

	@Resource
	private LoginInterceptor loginInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor)
				// 排除对其他资源的拦截
				//.excludePathPatterns("/**")
				// 添加拦截规则
				.addPathPatterns("/addCart");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}