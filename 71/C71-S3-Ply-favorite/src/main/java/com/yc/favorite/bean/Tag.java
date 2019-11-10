package com.yc.favorite.bean;

import java.util.List;

public class Tag implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer tId;
	private String tName;
	private Integer tCount;
	
	private List<Favorite> fList;
	
	public List<Favorite> getfList() {
		return fList;
	}
	public void setfList(List<Favorite> fList) {
		this.fList = fList;
	}
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public Integer gettCount() {
		return tCount;
	}
	public void settCount(Integer tCount) {
		this.tCount = tCount;
	}
}
