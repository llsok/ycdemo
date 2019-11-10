package com.yc.damai.bean;

public class Cartitem {

	private Integer ciid;
	private User user;
	private Product product;
	private Integer count;
	public Integer getCiid() {
		return ciid;
	}
	public void setCiid(Integer ciid) {
		this.ciid = ciid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Cartitem [ciid=" + ciid + ", user=" + user + ", product=" + product + ", count=" + count + "]";
	}
}
