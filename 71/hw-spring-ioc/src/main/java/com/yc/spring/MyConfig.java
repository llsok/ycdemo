package com.yc.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;

import com.yc.spring.bank.bean.Account;

@Configuration
public class MyConfig {
	
	// <bean>  ==> @Bean
	@Bean(name="account")
	@Primary
	public Account getAccount(){
		return new Account();
	}
	
	@Bean(name="account1")  // <bean scope>  ==> @Scope
	@Scope("prototype")
	public Account getAccount1(){
		return new Account();
	}

}
