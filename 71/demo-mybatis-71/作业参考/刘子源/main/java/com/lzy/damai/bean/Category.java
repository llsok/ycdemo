package com.lzy.damai.bean;

import java.util.List;

public class Category {
	private Integer cid;
	private String cname;
	
	//Ò»¶Ô¶à
	private List<CategorySecond> csItems;

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

	public List<CategorySecond> getCsItems() {
		return csItems;
	}

	public void setCsItems(List<CategorySecond> csItems) {
		this.csItems = csItems;
	}
}
