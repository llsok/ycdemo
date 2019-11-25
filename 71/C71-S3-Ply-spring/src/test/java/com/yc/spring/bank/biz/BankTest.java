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
