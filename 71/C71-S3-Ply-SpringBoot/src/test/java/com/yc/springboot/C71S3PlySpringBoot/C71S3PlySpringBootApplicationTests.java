package com.yc.springboot.C71S3PlySpringBoot;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.yc.springboot.C71S3PlySpringBoot.bean.Category;
import com.yc.springboot.C71S3PlySpringBoot.dao.CategoryDao;

@SpringBootTest
class C71S3PlySpringBootApplicationTests {
	
	@Resource
	private CategoryDao cdao;

	@Test
	void contextLoads() {
		List<Category> list = cdao.selectAll();
		System.out.println(list);
	}

}
