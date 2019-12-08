package com.yc.springmvc.bean;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class User implements Serializable {
	private static final long serialVersionUID = -4750369623346428567L;

	private String userid;
	@Length(min=4,max=12,message="用户名的长度需要在4和12之间 ")
	private String uname;
	@Length(min=4,max=12)
	private String upass;
	private String head;
	@NotEmpty(message="籍贯不能为空")
	private String sheng;  // 籍贯
	
	@NotEmpty(message="请填写邮件地址")
	@Email(message="请填写正确邮件格式")
	private String email;  // 邮件
	
	private Date regtime;
	private Integer gender;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSheng() {
		return sheng;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

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

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public User(String userid, String uname, String upass, String head,
			Date regtime, int gender) {
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
