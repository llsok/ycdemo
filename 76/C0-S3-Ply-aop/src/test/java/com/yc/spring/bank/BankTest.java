package com.yc.spring.bank;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.spring.bank.action.BankAction;
import com.yc.spring.bank.bean.Account;

@RunWith(SpringRunner.class)
@ContextConfiguration("/bank-beans.xml")
public class BankTest {

	@Autowired
	private BankAction bankAction;
	
	@Test
	public void test1() {
		bankAction.deposit(new  Account());
		bankAction.withdraw(new  Account());
	}
	
}
