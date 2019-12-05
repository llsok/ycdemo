package com.yc.springmvc.bean;

import java.io.Serializable;

public class Reply implements Serializable {
	private Integer replyid;
	private String title;
	private String content;
	private String publishtime;
	private String modifytime;
	private Integer userid;
	private Integer topicid;

	public Integer getReplyid() {
		return replyid;
	}

	public void setReplyid(Integer replyid) {
		this.replyid = replyid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getTopicid() {
		return topicid;
	}

	public void setTopicid(Integer topicid) {
		this.topicid = topicid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}

	public String getModifytime() {
		return modifytime;
	}

	public void setModifytime(String modifytime) {
		this.modifytime = modifytime;
	}

	public Reply() {
		super();
	}

	private String uname;
	private String head;
	private String regtime;

	@Override
	public String toString() {
		return "Reply [content=" + content + ", modifytime=" + modifytime + ", publishtime=" + publishtime
				+ ", replyid=" + replyid + ", title=" + title + ", topicid=" + topicid + ", userid=" + userid + "]";
	}

}
