package com.yc.spring.test.ioc;


import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.spring.bbs.biz.UserBiz;

@RunWith(SpringRunner.class)
@ContextConfiguration("/bbs-aop.xml")
public class BbsTest {
	
	@Resource
	private UserBiz ubiz;
	
	@Test
	public void test() throws Exception{
		ubiz.create(null);
		ubiz.remove(null);
	}

}
