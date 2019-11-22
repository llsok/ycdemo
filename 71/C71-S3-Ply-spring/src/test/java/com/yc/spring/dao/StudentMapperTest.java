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
		Assert.assertEquals(true, list.size() > 3);
		
		Student s = sm.selectBySn("1");
		Assert.assertEquals("李逵", s.getName());
		Assert.assertEquals(20, s.getAge());
		
		s.setName("宋江");
		s.setAge(10);
		sm.update(s);
		
		s = sm.selectBySn("1");
		Assert.assertEquals("宋江", s.getName());
		Assert.assertEquals(10, s.getAge());
	}

}
