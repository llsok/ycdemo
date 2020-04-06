package com.yc.ebuy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yc.ebuy.web.LoginInterceptor;

@SpringBootApplication
// MyBatis 接口组件扫描
@MapperScan("com.yc.ebuy")
// 开启声明式远程服务调用
@EnableFeignClients
// 服务熔断降级开关
@EnableCircuitBreaker
// Spring会话共享注解
@EnableRedisHttpSession
public class EbuyIndexAppcation implements WebMvcConfigurer {
	public static void main(String[] args) {
		SpringApplication.run(EbuyIndexAppcation.class, args);
	}
	
	/**
	 * SpringBoot定义拦截器
	 * 1. 如果没有引入资源, 可以不用加组件注解
	 * 2. 简单配置实现 WebMvcConfigurer , 高级配置继承 WebMvcConfigurationSupport
	 * 3. SpringBoot 启动类可以直接继承或实现
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
				// 添加拦截规则
				.addPathPatterns("/addCart");
	}

}
