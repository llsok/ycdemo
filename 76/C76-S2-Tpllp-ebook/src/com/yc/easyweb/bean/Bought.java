package com.yc.easyweb.bean;

import java.io.Serializable;

public class Bought implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String itemid;//购物车号
	private long count;//数量
	private long bid;//书id
	private double total;//总价
	private long uid;//用户id
	private int cartstate;//状态1.待下单2.已下单3.已删除
	private String carttime;//下单时间
	private String bucollege;//书籍分类学院
	private String bumajor;//书籍分类专业
	private String buniversity;//书籍分类大学
	private String bname;//书名
	private double bprice;//价格
	private String bimg;//图片
	private String uname;//用户名
	private String eoid;
	
	public String getEoid() {
		return eoid;
	}
	public void setEoid(String eoid) {
		this.eoid = eoid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public long getBid() {
		return bid;
	}
	public void setBid(long bid) {
		this.bid = bid;
	}
	public int getCartstate() {
		return cartstate;
	}
	public void setCartstate(int cartstate) {
		this.cartstate = cartstate;
	}
	public String getCarttime() {
		return carttime;
	}
	public void setCarttime(String carttime) {
		this.carttime = carttime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public double getBprice() {
		return bprice;
	}
	public void setBprice(double bprice) {
		this.bprice = bprice;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getBucollege() {
		return bucollege;
	}
	public void setBucollege(String bucollege) {
		this.bucollege = bucollege;
	}
	public String getBumajor() {
		return bumajor;
	}
	public void setBumajor(String bumajor) {
		this.bumajor = bumajor;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	
	public String getBuniversity() {
		return buniversity;
	}
	public void setBuniversity(String buniversity) {
		this.buniversity = buniversity;
	}
	
	@Override
	public String toString() {
		return "Bought [itemid=" + itemid + ", count=" + count + ", bid=" + bid + ", total=" + total + ", uid=" + uid
				+ ", cartstate=" + cartstate + ", carttime=" + carttime + ", bucollege=" + bucollege + ", bumajor="
				+ bumajor + ", buniversity=" + buniversity + ", bname=" + bname + ", bprice=" + bprice + ", bimg="
				+ bimg + ", uname=" + uname + ", eoid=" + eoid + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (bid ^ (bid >>> 32));
		result = prime * result + ((carttime == null) ? 0 : carttime.hashCode());
		result = prime * result + ((itemid == null) ? 0 : itemid.hashCode());
		result = prime * result + (int) (uid ^ (uid >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bought other = (Bought) obj;
		if (bid != other.bid)
			return false;
		if (carttime == null) {
			if (other.carttime != null)
				return false;
		} else if (!carttime.equals(other.carttime))
			return false;
		if (itemid == null) {
			if (other.itemid != null)
				return false;
		} else if (!itemid.equals(other.itemid))
			return false;
		if (uid != other.uid)
			return false;
		return true;
	}
	
}
