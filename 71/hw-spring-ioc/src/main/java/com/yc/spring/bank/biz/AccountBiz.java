package com.yc.spring.bank.biz;

import com.yc.spring.bank.bean.Account;

public interface AccountBiz {
	
	void register(Account account);
	
	void diposit(Integer id, double money);

}
