package com.yc.favorite.bean;

public class Favorite implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int fId;
	
	private String fTags;
	
	private String fUrl;
	
	private String fLabel;
	
	private String fDesc;
	
	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getfTags() {
		return fTags;
	}

	public void setfTags(String fTags) {
		this.fTags = fTags;
	}

	public String getfUrl() {
		return fUrl;
	}

	public void setfUrl(String fUrl) {
		this.fUrl = fUrl;
	}

	public String getfLabel() {
		return fLabel;
	}

	public void setfLabel(String fLabel) {
		this.fLabel = fLabel;
	}

	public String getfDesc() {
		return fDesc;
	}

	public void setfDesc(String fDesc) {
		this.fDesc = fDesc;
	}
	
}
