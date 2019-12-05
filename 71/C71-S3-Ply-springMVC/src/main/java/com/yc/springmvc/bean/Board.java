package com.yc.springmvc.bean;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Board implements Serializable {
	private int boardid;
	private String boardname;
	private int parentid;

	

	public int getTopicsum() {
		return topicsum;
	}

	public void setTopicsum(int topicsum) {
		this.topicsum = topicsum;
	}

	public String getRecenttopicid() {
		return recenttopicid;
	}

	public void setRecenttopicid(String recenttopicid) {
		this.recenttopicid = recenttopicid;
	}

	public String getRecenttopictitle() {
		return recenttopictitle;
	}

	public void setRecenttopictitle(String recenttopictitle) {
		this.recenttopictitle = recenttopictitle;
	}

	public String getRecenttopicuserid() {
		return recenttopicuserid;
	}

	public void setRecenttopicuserid(String recenttopicuserid) {
		this.recenttopicuserid = recenttopicuserid;
	}

	public String getRecenttopicusername() {
		return recenttopicusername;
	}

	public void setRecenttopicusername(String recenttopicusername) {
		this.recenttopicusername = recenttopicusername;
	}

	public String getRecenttopicmodifytime() {
		DateFormat df = null;
		Date d = null;
		try {  //    4/4/2015 1:8:30    M/d/yyyy h:m:s
			df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");  //  2015-04-03 13:33:55.6
			d = df.parse(this.recenttopicmodifytime);

			df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
		return df.format(d);
	}

	public void setRecenttopicmodifytime(String recenttopicmodifytime) {
		this.recenttopicmodifytime = recenttopicmodifytime;
	}

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

	public String getBoardname() {
		return boardname;
	}

	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public Board(int boardid, String boardname, int parentid) {
		super();
		this.boardid = boardid;
		this.boardname = boardname;
		this.parentid = parentid;
	}

	public Board() {
		super();
	}
	
	/**
	 *附加属性
	 */
	private int topicsum;
	private String recenttopicid;
	private String recenttopictitle;
	private String recenttopicuserid;
	private String recenttopicusername;
	private String recenttopicmodifytime;

	@Override
	public String toString() {
		return "Board [boardid=" + boardid + ", boardname=" + boardname
				+ ", parentid=" + parentid + ", recenttopicid=" + recenttopicid
				+ ", recenttopicmodifytime=" + recenttopicmodifytime
				+ ", recenttopictitle=" + recenttopictitle
				+ ", recenttopicuserid=" + recenttopicuserid
				+ ", recenttopicusername=" + recenttopicusername
				+ ", topicsum=" + topicsum + "]";
	}

}
