package com.yc.spring.bank.bean;

import org.springframework.stereotype.Component;

/**
 * 银行账户
 * @author Administrator
 *
 */
@Component("account")   // 组件 表示该类是spring管理的   bean   @Bean
public class Account {
	
	private Integer id;		// 主键
	private String name;	// 姓名
	private Double money;	// 余额
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	} 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	/**
	 * 这是一个不完整的单例模式，少了私有的构造方法
	 */
	private static Account singleAccount; 
	public static Account getInstance() {
		if(singleAccount == null) {
			singleAccount = new Account();
		}
		return singleAccount;
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", name=" + name + ", money=" + money + "]";
	}

}
