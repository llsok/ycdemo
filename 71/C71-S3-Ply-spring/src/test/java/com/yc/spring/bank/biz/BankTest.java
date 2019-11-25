package com.yc.spring.bank.biz;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.spring.bank.biz.BankBiz;
import com.yc.spring.bank.biz.BizException;
import com.yc.spring.bank.dao.AccountDao;


@RunWith(SpringRunner.class)
@ContextConfiguration("/bank.xml")
public class BankTest {
	
	@Resource
	private AccountDao adao;
	
	@Resource
	private BankBiz bbiz;
	
	/**
	 * 作业：
	 * 1、实现以上空方法，并为每个业务方法设计单元测试并测试通过
	 * 2、随机生成100个用户，进行随机转账，金额在2000~10000之间，转账 10000 次
	 * 3、每笔转账都要抽取手续费，手续费按千分之一计算，，不足一元按一元收取。请统计转账一共产生的手续费总额
	 * 4、设计测试方法检查每个账号的余额，是否与流水表统计结果一致
	 * 5、阅读 Spring 官方文档（或度娘）实现注解方式配置Spring事务
	 * 6、Spring容器也使用纯注解方式配置
	 */
	public void test2() {
		/**
		   *  请在此处完成 作业题 的测试
		 */
		
	}
	
	@Test
	public void test1() throws BizException{
		bbiz.diposit(1, 500);
	}
	
	@Test
	public void test() {
		adao.deleteAll();
		adao.insert(1, 1000);
		Assert.assertEquals(new Float(1000), adao.selectById(1).getBalance());
		adao.insert(2, 2000);
		Assert.assertEquals(2, adao.selectAll().size());
	}

}
