package com.yc.damai.bean;

public class Cart {

	private Integer cartid;
	private Integer total;
	private Cartitem cartitem;
	public Integer getCartid() {
		return cartid;
	}
	public void setCartid(Integer cartid) {
		this.cartid = cartid;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Cartitem getCartitem() {
		return cartitem;
	}
	public void setCartitem(Cartitem cartitem) {
		this.cartitem = cartitem;
	}
	@Override
	public String toString() {
		return "Cart [cartid=" + cartid + ", total=" + total + ", cartitem=" + cartitem + "]";
	}
}
