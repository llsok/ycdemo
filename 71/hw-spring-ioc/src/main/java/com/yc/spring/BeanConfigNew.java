package com.yc.spring;

import javax.annotation.Resource;

import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bbs.bean.User;

@Configuration
public class BeanConfigNew {
	
	@Bean("account")
	@Primary
	public Account createAccount(){
		Account a =  new Account();
		a.setName("12321313");
		return a;
	}

	@Bean("account1")
	@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public Account createAccount1(){
		return new Account();
	}
	
	private static Account account = new Account();
	@Bean("account2")
	public Account createAccount2(){
		return account;
	}
	
	@Bean("account3")
	public Account createAccount3(){
		return account;
	}
	
	@Bean("myUser")
	public User createUser(){
		User user = new User();
		user.setUname("武松");
		user.setUpass("abc123");
		user.setHead("20.gif");
		user.setGender(1);
		return user;
	}
	
	@Resource(name = "account")
	private Account a;
	@Bean("aa")
	public Account getAccount() {
		return a;
	}
	
}
