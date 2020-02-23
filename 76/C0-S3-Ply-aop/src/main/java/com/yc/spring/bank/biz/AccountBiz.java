package com.yc.spring.bank.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bank.bean.Record;
import com.yc.spring.bank.dao.AccountDao;
import com.yc.spring.bank.dao.RecordDao;

@Service
public class AccountBiz {
	
	@Autowired
	private AccountDao aDao;
	@Autowired
	private RecordDao rDao;
	
	/**
	 * 	存款业务
	 */
	public void deposit(Account account) {
		System.out.println("模拟存款业务！");
		aDao.update(account);
		rDao.insert(new Record());
	}
	
	/**
	 * 	取款业务
	 */
	public void withdraw(Account account) {
		System.out.println("模拟取款业务！");
		aDao.update(account);
		rDao.insert(new Record());
	}
	
	/**
	 * 	转账业务
	 */
	public void transfer(Account account1, Account account2) {
		System.out.println("模拟转账业务！");
		aDao.update(account1);
		aDao.update(account2);
		rDao.insert(new Record());
		rDao.insert(new Record());
	}
	
	/**
	 *  查询明细
	 * @return
	 */
	public List<Record> details(){
		return new ArrayList<Record>();
	}
	
	public List<Record> details1(){
		int a = 1/0;
		return new ArrayList<Record>();
	}
	
}
