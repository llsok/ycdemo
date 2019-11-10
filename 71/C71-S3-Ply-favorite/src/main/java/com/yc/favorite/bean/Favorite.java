package com.yc.favorite.bean;

public class Favorite implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer tId;
	private String tLabel;
	private String tUrl;
	private String tTags;
	private String tDesc;
	
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String gettLabel() {
		return tLabel;
	}
	public void settLabel(String tLabel) {
		this.tLabel = tLabel;
	}
	public String gettUrl() {
		return tUrl;
	}
	public void settUrl(String tUrl) {
		this.tUrl = tUrl;
	}
	public String gettTags() {
		return tTags;
	}
	public void settTags(String tTags) {
		this.tTags = tTags;
	}
	public String gettDesc() {
		return tDesc;
	}
	public void settDesc(String tDesc) {
		this.tDesc = tDesc;
	}

}
