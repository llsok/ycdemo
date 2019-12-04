package com.yc.spring.bank.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.spring.bank.dao.AccountDao;
import com.yc.spring.bank.dao.oprecordDao;

@Service // 业务类组件
/**
 * 注解方式使用注解，可以不用配置切点，因为注解直接加到了类上了
 * 另外： @Transactional 也可以直接加到方法上
 */
@Transactional(transactionManager = "txManager", 
		propagation = Propagation.REQUIRED, 
		isolation = Isolation.READ_COMMITTED, 
		readOnly = false, 
		timeout = 1000, 
		rollbackFor = BizException.class)
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

		// boolean b = true;
		// int i=1/0; // 抛出运行期异常
		/*if (b) {
			// 抛出编译器异常
			throw new BizException("我要抛出的异常（编译期）");
		}*/

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
		int result = adao.update(accountid, -money);
		if (result == 0) {
			throw new BizException("账户余额不足！");
		}
		odao.insert(accountid, -money);
	}

	/**
	 * 转账，将资金从 account1 转到 account2， 
	 * 意味着 account1 要调用取款方法，account2 要调用存款方法
	 * 此外，还要计算手续费，按千分之一收取
	 * @throws BizException 
	 */
	public void transfar(int accountid1, int accountid2, float money) throws BizException {
		if (adao.selectById(accountid1) == null) {
			throw new BizException("取款账号不存在：" + accountid1);
		}
		// 计算手续费
		float charge = money * 0.001f;
		if (charge < 1) {
			charge = 1;
		}
		// 账户减金额
		int result = adao.update(accountid1, -(money + charge));
		if (result == 0) {
			throw new BizException("取款账户余额不足！");
		}
		// 注意：这里“写流水记录”的方法，和取款方法中“写流水记录”的方法有什么不同
		odao.insert(accountid1, -money, charge);

		// 存款直接调用上面的存款方法
		diposit(accountid2, money);

		/**
		   *  请思考：Spring是如何管理事务的？
		 */
	}

}
