package com.yc.spring.bbs.bean;

import java.util.List;

public class Board {
	/**
	 * 主键
	 */
	private Integer boardid;
	/**
	 * 板块名
	 */
	private String boardname;
	/**
	 * 父板块ID
	 */
	private Integer parentid;
	/**
	 * 父板块对象
	 */
	private Board parent;
	/**
	 * 板块所属主题列表
	 */
	private List<Topic> topicList;
	/**
	 * 构造方法注入
	 * @param boardid
	 * @param boardname
	 * @param parentid
	 */
	public Board(Integer boardid, String boardname, Integer parentid) {
		this.boardid = boardid;
		this.boardname = boardname;
		this.parentid = parentid;
	}

	public Integer getBoardid() {
		return boardid;
	}

	public String getBoardname() {
		return boardname;
	}

	public Integer getParentid() {
		return parentid;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public Board getParent() {
		return parent;
	}

	public void setParent(Board parent) {
		this.parent = parent;
	}

}
