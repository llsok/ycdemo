package com.yc.spring;

import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bank.biz.impl.AccountBizImpl;
import com.yc.spring.bbs.bean.User;

/**
 * 注解配置bean 类
 */
@Configuration   // ->  <beans>
//@ComponentScan("com.yc.spring")  // 配置spring扫描的包路径
public class BeanConfig {
	
	/**
	 * 创建 Account 对象的方法
	 * @return
	 */
	@Bean("accountBiz")
	public AccountBizImpl createAcountBiz() {
		return new AccountBizImpl();
	}
	
	@Bean("account")
	@Primary
	public Account createAcount() {
		return new Account();
	}
	
	@Bean("account1")
	@Scope("prototype")
	public Account createAcount1() {
		return new Account();
	}
	
	@Bean("account2")
	public Account createAcount2() {
		// 必须与 createAcount3 方法一样
		// 单例模式
		return Account.getInstance();
	}
	
	@Bean("account3")
	public Account createAcount3() {
		// 必须与 createAcount2 方法一样
		// 单例模式
		return Account.getInstance();
	}
	
	int count;
	@Bean("account4")
	@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public Account create1() {
		return count++ < 3 ? new Account() : Account.getInstance();
	}
	
	@Bean("myUser")
	public User createUser() {
		User user = new User();
		/**
		 * 使用java代码设置属性
		 */
		user.setUname("武松");
		user.setUpass("abc123");
		user.setHead("20.gif");
		user.setGender(1);
		return user;
	}
	
}
