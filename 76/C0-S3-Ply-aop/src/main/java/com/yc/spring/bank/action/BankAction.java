package com.yc.spring.bank.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.bank.biz.AccountBiz;
import com.yc.spring.bank.biz.BusiException;
import com.yc.spring.bank.biz.IAccountBiz;
import com.yc.spring.bank.biz.RecordBiz;

/**
 * SpringMVC 控制器
 */
@Controller
public class BankAction {

	@Autowired
	private IAccountBiz aBiz;

	@Autowired
	private RecordBiz rBiz;

	/**
	 * 存款
	 * @param account
	 * @return
	 * @throws BusiException 
	 */
	public String deposit(Account account) throws BusiException {
		aBiz.deposit(account);
		return "details";
	}

	/**
	 * 取款
	 * @param account
	 * @return
	 */
	public String withdraw(Account account) {
		aBiz.withdraw(account);
		return "details";
	}

	/**
	 * 转账
	 * @param account1
	 * @param account2
	 * @return
	 */
	public String transfer(Account account1, Account account2) {
		aBiz.transfer(account1, account2);
		return "details";
	}

	/**
	 * 查询交易明细
	 * @param accountId
	 * @return
	 */
	public String details(int accountId) {
		aBiz.details();
		return "details";
	}
	  
	public String details1(int accountId) {
		aBiz.details1();
		return "details";
	}

}
