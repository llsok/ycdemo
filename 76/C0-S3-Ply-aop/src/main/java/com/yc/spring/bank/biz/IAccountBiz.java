package com.yc.spring.bank.biz;

import java.util.List;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bank.bean.Record;

public interface IAccountBiz {
	public void deposit(Account account) throws BusiException ;
	public void withdraw(Account account);
	public void transfer(Account account1, Account account2);
	public List<Record> details();
	public List<Record> details1();
}
