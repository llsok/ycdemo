package com.yc.spring.test.ioc;


import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.spring.bbs.biz.UserBiz;
import com.yc.spring.bbs.dao.UserDao;

@RunWith(SpringRunner.class)
@ContextConfiguration("/bbs-aop.xml")
public class BbsTest {
	
	@Resource
	private UserBiz ubiz;
	
	@Autowired
	private UserDao udao;
	
	@Test
	public void test() throws Exception{
		ubiz.create(null);
		ubiz.remove(null);
		
		udao.insert(null);
		udao.selectOne(null);
		udao.selectList(null, null, null);
		udao.update(null);
	}

}
