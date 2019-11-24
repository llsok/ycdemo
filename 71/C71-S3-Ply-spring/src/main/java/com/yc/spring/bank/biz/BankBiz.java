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
	
}
