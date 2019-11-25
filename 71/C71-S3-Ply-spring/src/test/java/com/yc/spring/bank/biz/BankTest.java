package com.yc.spring.bank.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.spring.bank.biz.BankBiz;
import com.yc.spring.bank.biz.BizException;
import com.yc.spring.bank.dao.AccountDao;
import com.yc.spring.bank.dao.oprecordDao;

@RunWith(SpringRunner.class)
@ContextConfiguration("/bank.xml")
public class BankTest {

	@Resource
	private AccountDao adao;

	@Resource
	private oprecordDao odao;

	@Resource
	private BankBiz bbiz;

	/**
	 * 作业：
	 * 1、实现以上空方法，并为每个业务方法设计单元测试并测试通过
	 * 2、生成100个用户，进行随机转账，金额在2000~10000之间，转账 10000 次
	 * 3、每笔转账都要抽取手续费，手续费按千分之一计算，，不足一元按一元收取。请统计转账一共产生的手续费总额
	 * 4、设计测试方法检查每个账号的余额，是否与流水表统计结果一致
	 * 5、阅读 Spring 官方文档（或度娘）实现注解方式配置Spring事务
	 * 6、Spring容器也使用纯注解方式配置
	 * @throws BizException 
	 */
	@Test
	public void test2() throws BizException {
		/**
		   *  请在此处完成 作业题 的测试
		 */
		odao.deleteAll();
		adao.deleteAll();
		System.out.println("清空数据完成");

		List<Integer> accountList = new ArrayList<>();
		for (int i = 1; i < 101; i++) {
			// 随机生成账号余额（5万~10万），做了个取整，只是为了方便观察结果
			long balance = (long) (Math.random() * 50000d + 50000);
			bbiz.regisiter(i, (float) balance);
			accountList.add(i);
		}
		System.out.println("100个账号初始化完成");

		for (int i = 0; i < 10000; i++) {
			boolean success = false;
			while (success == false) {
				// 随机生成取款账号
				int aid1 = (int) (Math.random() * accountList.size() + 1);
				// 随机生成存款款账号
				int aid2 = -1;
				do {
					aid2 = (int) (Math.random() * accountList.size() + 1);
				} while (aid1 == aid2);

				// 随机生成转账金额，进行取整，方便观察结果
				long money = (long) (Math.random() * 8000 + 2000);
				try {
					bbiz.transfar(aid1, aid2, money);
					success = true;
					System.out.println(String.format("第 %s 笔转账成功！转出账号：%s，转入账号：%s，转账金额：%s",
							i + 1, aid1, aid2, money));
				} catch (BizException e) {
					System.out.println(String.format("转账失败！转出账号：%s，转入账号：%s，转账金额：%s，原因：%s",
							i + 1, aid1, aid2, money, e.getMessage()));
				}
			}
		}
		System.out.println("10000次转账完成");

		System.out.println("开始验证");
		Assert.assertEquals(100, adao.countAll());
		Assert.assertEquals(20100, odao.countAll()); // 10000次转出流水 + 10000次转入流水
														// + 100开户流水

		System.out.println("一共产生 " + odao.sumCharge() + " 元的手续费");
	}

	@Test
	public void test1() throws BizException {
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
