package com.yc.spring.bbs.bean;

import java.sql.Timestamp;
import java.util.List;

public class Topic {

	private Integer topicid;
	private String title;
	private String content;
	private Timestamp publishtime;
	private Timestamp modifytime;
	private Integer uid;
	private Integer boardid;
	/**
	 * 关联的用户对象
	 */
	private User user;
	/**
	 * 关联的板块对象
	 */
	private Board board;
	/**
	 * 跟帖列表
	 */
	private List<Reply> replyList;

	public Integer getTopicid() {
		return topicid;
	}

	public void setTopicid(Integer topicid) {
		this.topicid = topicid;
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

	public Timestamp getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(Timestamp publishtime) {
		this.publishtime = publishtime;
	}

	public Timestamp getModifytime() {
		return modifytime;
	}

	public void setModifytime(Timestamp modifytime) {
		this.modifytime = modifytime;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getBoardid() {
		return boardid;
	}

	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

}
