package com.yc.spring.dao;

import java.util.List;

import com.yc.spring.anno.Select;
import com.yc.spring.bean.Student;

public interface StudentMapper {
	
	@Select("select * from student")
	public Student selectBySn(String sn);
	
	@Select("select * from student")
	public List<Student> selectAll();
	
	@Select("update student set age=#{age} grade=#{grade} where sn = #{sn}")
	public void update(Student student);
	

}
