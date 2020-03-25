package com.yc.ebuy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@SpringBootApplication
//MyBatis 接口组件扫描
@MapperScan("com.yc.ebuy")
//开启声明式远程服务调用
@EnableFeignClients
//服务熔断降级开关
@EnableCircuitBreaker
// Spring会话共享注解
@EnableRedisHttpSession
public class EbuyIndexAppcation {
	public static void main(String[] args) {
		SpringApplication.run(EbuyIndexAppcation.class, args);
	}
}

