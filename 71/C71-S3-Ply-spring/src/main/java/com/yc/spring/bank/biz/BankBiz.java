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
		/**
		 *    Spring 事务处理有2中方式：
		 *    	1、编程式事务处理     	自己写 try catch 手动提交、回滚、关闭
		 *    	2、声明式事务处理	通过 xml 配置  或者  注解配置，实现事务处理（强烈推荐）
		 */

		// 查找账号
		if (adao.selectById(accountid) == null) {
			throw new BizException("账号不存在：" + accountid);
		}
		// 存入金额
		adao.update(accountid, money);

		boolean b = true;
		// int i=1/0;		// 抛出运行期异常
		if (b) {
			// 抛出编译器异常
			throw new BizException("我要抛出的异常（编译期）");
		}

		// 记录流水
		odao.insert(accountid, money);
		// 没有异常就提交

	}

	/**
	 * 开户
	 */
	public void regisiter(int accountid, float money) throws BizException {
		// 新增账号（没有写流水表）
		adao.insert(accountid, 0);
		// 存款
		diposit(accountid, money);
	}

	/**
	 * 取款，注意要判断账号余额够不够
	 */
	public void withdraw(int accountid, float money) throws BizException {

	}

	/**
	 * 转账，将资金从 account1 转到 account2， 
	 * 意味着 account1 要调用取款方法，account2 要调用存款方法
	 * 此外，还要计算手续费，按千分之一收取
	 */
	public void transfar(int accountid1, int accountid2, float money) {

	}

}
