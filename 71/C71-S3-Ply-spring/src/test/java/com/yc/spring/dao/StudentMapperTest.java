package com.yc.spring.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import com.yc.spring.bean.Student;
import com.yc.spring.mybatis.SqlSession;

public class StudentMapperTest {

	@Test
	public void test() {
		SqlSession session = new SqlSession();

		StudentMapper sm = session.getMapper(StudentMapper.class);

		List<Student> list = sm.selectAll();

		Assert.assertEquals(true, list.size() > 0);

	}

}
