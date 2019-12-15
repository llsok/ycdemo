package com.yc.springboot.C71S3PlyBlog;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.yc.springboot.C71S3PlyBlog.dao.UserMapper;

@SpringBootTest
class C71S3PlyBlogApplicationTests {
	
	@Resource
	private UserMapper um;
	

	@Test
	void contextLoads() {
		// 查询所有用户
		System.out.println(um.selectByExample(null));
	}

}
