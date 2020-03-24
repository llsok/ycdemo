package com.yc.ebuy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//MyBatis 接口组件扫描
@MapperScan("com.yc.ebuy")
public class EbuyBackAppcation {
	public static void main(String[] args) {
		SpringApplication.run(EbuyBackAppcation.class, args);
	}
}

