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
		// 编程式事务处理
		/*try{*/
		
		
			// 查找账号
			if (adao.selectById(accountid) == null) {
				throw new BizException("账号不存在：" + accountid);
			}
			// 存入金额
			adao.update(accountid, money);
			
			boolean b = true;
			// int i=1/0;
			if(b){
				throw new BizException("我要抛出的异常（编译期）");
			}
			
			// 记录流水
			odao.insert(accountid, money);
			// 没有异常就提交
			
			
		/*} catch (Exception e ){
			// 有异常就回滚
		} finally {
			// 最后都要关系连接
		}*/

	}
	
	/**
	 * 开户
	 */
	public void regisiter(int accountid, float money) throws BizException{
		// 新增账号
		adao.insert(accountid, 0);
		// 存款
		diposit(accountid, money);
	}
	
	/**
	 * 取款，注意要判断账号余额够不够
	 */
	public void withdraw(int accountid, float money) throws BizException{
		
	}
	
	/**
	 * 转账，将资金从 account1 转到 account2， 
	 * 意味着 account1 要调用取款方法，account2 要调用存款方法
	 * 此外，还要计算手续费，按千分之一收取
	 */
	public void transfar(int accountid1, int accountid2, float money){
		
	}
	
	/**
	 * 作业：
	 * 1、实现以上空方法，并为每个业务方法设计单元测试并测试通过
	 * 2、随机生成100个用户，进行随机转账，金额在2000~10000之间，转账 10000 次
	 * 3、请统计转账所产生手续费，并且测试每个账号的余额，是否与流水表统计一致
	 * 
	 */

}
