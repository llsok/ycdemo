package com.yc.ebuy;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.yc.ebuy.dao.EasybuyUserMapper;

@SpringBootTest
public class EbuyApplicationTests {

	@Resource
	EasybuyUserMapper um;

	@Test
	public void test2() {
		System.out.println(um.selectByExample(null));
	}

}
