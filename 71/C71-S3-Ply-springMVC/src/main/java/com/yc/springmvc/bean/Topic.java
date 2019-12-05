package com.yc.springmvc.bean;

import java.io.Serializable;

public class Topic implements Serializable {
	private static final long serialVersionUID = -4666196229407434784L;
	private Integer topicid;
	private String title;
	private String content;
	private String publishtime;
	private String modifytime;
	private Integer userid;
	private Integer boardid;

	public Integer getTopicid() {
		return topicid;
	}

	public void setTopicid(Integer topicid) {
		this.topicid = topicid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
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

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

	private String uname;
	private int replycount;

	public Topic() {
		super();
	}

	@Override
	public String toString() {
		return "Topic [boardid=" + boardid + ", content=" + content + ", modifytime=" + modifytime + ", publishtime="
				+ publishtime + ", replycount=" + replycount + ", title=" + title + ", topicid=" + topicid + ", uname="
				+ uname + ", userid=" + userid + "]";
	}

}
