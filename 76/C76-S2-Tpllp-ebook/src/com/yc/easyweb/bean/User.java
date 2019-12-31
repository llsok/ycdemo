package com.yc.easyweb.bean;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private long uid;//用户id
	private String uname;//用户名
	private String uphone;//用户电话
	private String university;//用户所在大学
	private String ucollege;//用户所在学院
	private String umajor;//用户所在专业
	private String uclass;//用户所在年级
	private String upassword;//用户密码
	private int ustate;//用户状态（1.可用2.冻结3.删除）
	private String utemp;//备用字段
	private int utype;//级别(2用户，3会员，4钻石会员，5普通管理员，1超级管理员)
	private String uemail;//邮箱
	private String utime;//注册时间
	private int usex;//性别(1.男2.女)
	private int uage;//年龄
	private String uminname;//昵称
	
	public String getUclass() {
		return uclass;
	}
	public void setUclass(String uclass) {
		this.uclass = uclass;
	}
	public String getUminname() {
		return uminname;
	}
	public void setUminname(String uminname) {
		this.uminname = uminname;
	}
	public int getUtype() {
		return utype;
	}
	public void setUtype(int utype) {
		this.utype = utype;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUtime() {
		return utime;
	}
	public void setUtime(String utime) {
		this.utime = utime;
	}
	public int getUsex() {
		return usex;
	}
	public void setUsex(int usex) {
		this.usex = usex;
	}
	public int getUage() {
		return uage;
	}
	public void setUage(int uage) {
		this.uage = uage;
	}
	public int getUstate() {
		return ustate;
	}
	public void setUstate(int ustate) {
		this.ustate = ustate;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getUcollege() {
		return ucollege;
	}
	public void setUcollege(String ucollege) {
		this.ucollege = ucollege;
	}
	public String getUmajor() {
		return umajor;
	}
	public void setUmajor(String umajor) {
		this.umajor = umajor;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUtemp() {
		return utemp;
	}
	public void setUtemp(String utemp) {
		this.utemp = utemp;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", uphone=" + uphone + ", university=" + university
				+ ", ucollege=" + ucollege + ", umajor=" + umajor + ", uclass=" + uclass + ", upassword=" + upassword
				+ ", ustate=" + ustate + ", utemp=" + utemp + ", utype=" + utype + ", uemail=" + uemail + ", utime="
				+ utime + ", usex=" + usex + ", uage=" + uage + ", uminname=" + uminname + "]";
	}
	//重写hashCode 和equals方法去重
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		return true;
	}
	

	
}
