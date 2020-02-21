package com.yc.spring.bbs.bean;

import java.sql.Timestamp;
import java.util.List;

/**
 * 用户实体类
 */
public class User {

	/**
	 * 用户ID
	 */
	private Integer uid;
	/**
	 * 用戶名
	 */
	private String uname;
	/**
	 * 用户密码
	 */
	private String upass; // 加密后的长度比较长
	/**
	 * 用户头像
	 */
	private String head; // 头像的图片路径
	/**
	 * 注册时间
	 */
	private Timestamp regtime; // 注册时间     Timestamp 带时分秒的日期
	/**
	 * 用户性别：1男，0女
	 */
	private Integer gender; // 性别   1男，0女
	
	/**
	 * 用户发帖集合
	 */
	private List<Topic> topicList;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
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

	public Timestamp getRegtime() {
		return regtime;
	}

	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

}
