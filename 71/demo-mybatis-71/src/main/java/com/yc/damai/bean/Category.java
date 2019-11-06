package com.yc.damai.bean;

import java.util.List;

public class Category {
	private Integer cid;
	private String cname;
	
	// 一对多
	private List<Categorysecond> csItems;
	
	public List<Categorysecond> getCsItems() {
		return csItems;
	}
	public void setCsItems(List<Categorysecond> csItems) {
		this.csItems = csItems;
	}
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}
