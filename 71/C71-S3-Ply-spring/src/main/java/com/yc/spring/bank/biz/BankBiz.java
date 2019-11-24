package com.yc.spring.bank.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.spring.bank.dao.AccountDao;
import com.yc.spring.bank.dao.oprecordDao;

@Service // 业务类组件
public class BankBiz {

	@Resource
	private AccountDao adao;

	@Resource
	private oprecordDao odao;

	/**
	 * 存款业务方法
	 * @throws BizException 
	 */
	public void diposit(int accountid, float money) throws BizException {

		// 查找账号
		if (adao.selectById(accountid) == null) {
			throw new BizException("账号不存在：" + accountid);
		}

		// 存入金额
		adao.update(accountid, money);

		// 记录流水
		odao.insert(accountid, money);

	}

}
