package com.yc.spring.test.ioc;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.spring.bank.bean.Account;
/**
 * 配置Spring，让测试方法全部测试通过
 */
public class E02IocForXmlTest {
	ClassPathXmlApplicationContext cxt = 
			new ClassPathXmlApplicationContext("IOC02.xml");
	@Test
	public void test1() {
		Account a = cxt.getBean(Account.class);
		Account b = cxt.getBean(Account.class);
		Account c = (Account) cxt.getBean("account");
		Assert.assertEquals(a, b);  // a == b
		Assert.assertEquals(c, b);	// c == b
	}

	@Test
	public void test2() {
		Account a = (Account) cxt.getBean("account1");
		Account b = (Account) cxt.getBean("account1");
		Account c = (Account) cxt.getBean("account1");
		Assert.assertNotEquals(a, b);
		Assert.assertNotEquals(c, b);
		Assert.assertNotEquals(c, a);
	}
	
	@Test
	public void test3() {
		Account a1 = (Account) cxt.getBean("account2");
		Account a2 = (Account) cxt.getBean("account2");
		Account a3 = (Account) cxt.getBean("account3");
		Account a4 = (Account) cxt.getBean("account3");
		Assert.assertEquals(a1, a2);
		Assert.assertEquals(a3, a4);
		
		Assert.assertEquals(a1, a3);
		Assert.assertEquals(a2, a4);
	}
	
	/**
	 * 坑。。。
	 * 提示：	参考工厂方法，通过编程实现，但是仅仅自己编程还不能实现，
	 * 		还需要使用 bean 标签的一个属性。。。
	 */
	@Test
	public void test4() {
		Account a1 = (Account) cxt.getBean("account4");
		Account a2 = (Account) cxt.getBean("account4");
		Account a3 = (Account) cxt.getBean("account4");
		Account a4 = (Account) cxt.getBean("account4");
		Account a5 = (Account) cxt.getBean("account4");
		Account a6 = (Account) cxt.getBean("account4");
		Account a7 = (Account) cxt.getBean("account4");
		
		Assert.assertNotEquals(a1, a2);
		Assert.assertNotEquals(a1, a3);
		Assert.assertNotEquals(a1, a4);
		Assert.assertEquals(a4, a5);
		Assert.assertEquals(a4, a6);
		Assert.assertEquals(a4, a7);
	}
}
