package com.yc.C76S3PlySpringBoot;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

import com.yc.C76S3PlySpringBoot.dao.TagMapper;

@SpringBootTest
class C76S3PlySpringBootApplicationTests {
	
	@Resource
	private TagMapper tm;

	@Test
	void contextLoads() {
		Assert.isTrue(tm.selectAll().size() > 0, "结果集数量不正确!");
	}

}
