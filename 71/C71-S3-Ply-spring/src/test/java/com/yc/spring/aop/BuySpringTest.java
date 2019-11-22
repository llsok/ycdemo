package com.yc.spring.aop;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration("/buy-beans.xml")
public class BuySpringTest {
	
	@Resource
	private Buy myself;
	//private Myself myself; // Myself 未实现 Buy 接口  返回 cglib 对象
	
	
	@Test
	public void test(){
		System.out.println(myself);
		myself.buy();
	}

}
