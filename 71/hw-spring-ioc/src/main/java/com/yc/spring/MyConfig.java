package com.yc.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bbs.biz.UserBiz;

@Configuration
// 包扫描，扫描所有加了组件注解的类，并且将该类创建对象放入Spring容器中
@ComponentScan("com.yc.spring")
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
	
	/**
	 * 自动装配方式
	 */
	public UserBiz getUserBiz(){
		return new UserBiz();
	}

}
