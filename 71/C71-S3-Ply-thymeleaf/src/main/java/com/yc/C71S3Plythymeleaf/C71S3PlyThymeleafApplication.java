package com.yc.C71S3Plythymeleaf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@SpringBootApplication
public class C71S3PlyThymeleafApplication {

	public static void main(String[] args) {
		SpringApplication.run(C71S3PlyThymeleafApplication.class, args);
	}
	
	@Bean 
	public ServerEndpointExporter serverEndpointExporter() { 
		return new ServerEndpointExporter(); 
	} 


}
