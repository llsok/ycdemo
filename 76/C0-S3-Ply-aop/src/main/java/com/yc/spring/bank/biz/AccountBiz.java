package com.yc.spring.bank.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bank.bean.Record;
import com.yc.spring.bank.dao.AccountDao;
import com.yc.spring.bank.dao.RecordDao;

@Service
/**
 * 事务注解
 */
/*@Transactional(
		isolation=Isolation.DEFAULT,*//**隔离级别*//*
		propagation=Propagation.REQUIRED, *//**传播行为*//*
		readOnly=false,*//**只读事务*//*
		timeout=3000*//**事务超时设置，默认是不限时*//*
		transactionManager=“其他的事务管理器” *//**手工的设置事务管理器*//*
		rollbackFor *//**重点： Spring 默认情况下只会在运行期异常出现时，执行回滚，那么如果你有其他的类型的异常要回滚事务，
		 * 就必须设置该属性*//*
		noRollbackFor *//** 设置不回滚的异常类型 *//*)*/
@Transactional
public class AccountBiz {
	
	@Autowired
	private AccountDao aDao;
	@Autowired
	private RecordDao rDao;
	
	/**
	 * 	存款业务
	 */
	@Transactional
	public void deposit(Account account) {
		System.out.println("模拟存款业务！");
		aDao.update(account);
		Record r = new Record();
		r.setAccountId(account.getId());
		r.setMoney(account.getMoney());
		
		// 数学运算异常（运行期异常）
		int i = 1/0;
		
		rDao.insert(r);
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
