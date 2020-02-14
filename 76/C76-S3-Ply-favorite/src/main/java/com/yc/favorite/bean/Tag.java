package com.yc.favorite.bean;

import java.util.List;

public class Tag implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int tId;
	
	private String tName;
	
	private int tCount;
	
	private List<Favorite> favorites;

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public int gettCount() {
		return tCount;
	}

	public void settCount(int tCount) {
		this.tCount = tCount;
	}

	public List<Favorite> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	@Override
	public String toString() {
		return "Tag [tId=" + tId + ", tName=" + tName + ", tCount=" + tCount + ", favorites=" + favorites + "]";
	}
	
}
