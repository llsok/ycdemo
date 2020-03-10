package com.yc.blog;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//MyBatis 接口组件扫描
@MapperScan("com.yc.blog")
public class BlogAppcation {
	public static void main(String[] args) {
		SpringApplication.run(BlogAppcation.class, args);
	}
}

