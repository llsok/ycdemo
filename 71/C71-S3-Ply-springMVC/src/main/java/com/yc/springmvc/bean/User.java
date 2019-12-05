package com.yc.springmvc.bean;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = -4750369623346428567L;

	private String userid;
	private String uname;
	private String upass;
	private String head;
	private String regtime;
	private Integer gender;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public User(String userid, String uname, String upass, String head,
			String regtime, int gender) {
		super();
		this.userid = userid;
		this.uname = uname;
		this.upass = upass;
		this.head = head;
		this.regtime = regtime;
		this.gender = gender;
	}

	public User() {
		super();
	}

	@Override
	public String toString() {
		return "User [gender=" + gender + ", head=" + head + ", regtime="
				+ regtime + ", uname=" + uname + ", upass=" + upass
				+ ", userid=" + userid + "]";
	}

}
