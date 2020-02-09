package com.yc.springboot.C71S3PlyBlog;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.yc.springboot.C71S3PlyBlog")
public class C71S3PlyBlogApplication {

	public static void main(String[] args) {
		SpringApplication.run(C71S3PlyBlogApplication.class, args);
	}

}
