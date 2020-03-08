package com.yc.C76S3PlySpringBoot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

import com.yc.C76S3PlySpringBoot.biz.FavoriteBiz;

/**
 * SpringBoot工程启动类
 * 
 * 1,会默认总启动类所在包开始扫描服务组件
 * 2,pom 启动器没有版本号, 自动添加的依赖没有版本号
 * 			<parent>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-starter-parent</artifactId>
				<version>2.2.5.RELEASE</version>
			</parent>
			当前工程基于的父工程
			
	3, resource 下的
		static : 存放静态资源, 如静态网页, js, css
		templates : 存放网页模板( ~= jsp )
		
		application.properties   != beans.xml
		配置参数, 
		
 * 
 * 
 */
@SpringBootApplication
// MyBatis 接口组件扫描
@MapperScan("com.yc.C76S3PlySpringBoot")
@EnableScheduling
public class C76S3PlySpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(C76S3PlySpringBootApplication.class, args);
	}
	
	/*@Bean("testFBiz")
	public FavoriteBiz getFBiz() {
		return new FavoriteBiz();
	}*/
	
	@Bean 
	public ServerEndpointExporter serverEndpointExporter() { 
		return new ServerEndpointExporter(); 
	} 
	
}
