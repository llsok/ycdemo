package com.yc.spring.bean;

import java.util.List;

/**
 * 
 * 学生类
 *
 */
public class Student {
	
	
	private String name;
	private int age;
	private int grade;
	private String sn;
	
	private List<String> hobbys;
	
	public List<String> getHobbys() {
		return hobbys;
	}

	public void setHobbys(List<String> hobbys) {
		this.hobbys = hobbys;
	}

	// 电脑
	private Computer computer;
	
	
	// 无参数的构造方法 给 stu1 用       函数重载 ：函数名相同，参数不同（）
	public Student() {}
	
	public Student(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public Student(int age , String name) {
		this.name = name + "1";
		this.age = age + 10;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public Computer getComputer() {
		return computer;
	}

	public void setComputer(Computer computer) {
		this.computer = computer;
	}
	
}
