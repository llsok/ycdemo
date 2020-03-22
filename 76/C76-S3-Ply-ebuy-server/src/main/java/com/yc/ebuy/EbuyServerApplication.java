package com.yc.ebuy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EbuyServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(EbuyServerApplication.class, args);
	}

}
