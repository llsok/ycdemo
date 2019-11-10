package com.yc.damai.bean;

public class Categorysecond {

	private Integer csid;
	private String csname;
	private Category category;
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Categorysecond [csid=" + csid + ", csname=" + csname + ", category=" + category + "]";
	}
	
	
	
	
}
