package com.yc.damai.bean;

import java.util.List;

public class Category {

	private Integer cid;
	private String cname;
	private List<Categorysecond> csItems;
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
	public List<Categorysecond> getCsItems() {
		return csItems;
	}
	public void setCsItems(List<Categorysecond> csItems) {
		this.csItems = csItems;
	}
	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", csItems=" + csItems + "]";
	}
}
