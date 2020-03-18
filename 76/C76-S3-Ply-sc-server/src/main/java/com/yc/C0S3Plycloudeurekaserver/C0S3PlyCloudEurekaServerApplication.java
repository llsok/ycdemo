package com.yc.C0S3Plycloudeurekaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class C0S3PlyCloudEurekaServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(C0S3PlyCloudEurekaServerApplication.class, args);
	}

}
