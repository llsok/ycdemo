package com.yc.easyweb.bean;

import java.io.Serializable;

//订单详情数据
public class OrderDetial implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String eoid;//订单编号
	private String bname;//书名
	private double total;//总价
	private String eotime;//时间
	private String eotype;//配送类型
	private String eoaddr;//地址
	private String uname;//用户名
	private long uid;//用户id
	private long bid;//书id
	private long count;//数量
	private int eostate;//状态
	private String eoespress;//快递名字
	private String eopayname;//支付类型
	private String bimg;//图片
	private String eotemp;//电话
	
	public String getEotemp() {
		return eotemp;
	}
	public void setEotemp(String eotemp) {
		this.eotemp = eotemp;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public String getEoespress() {
		return eoespress;
	}
	public void setEoespress(String eoespress) {
		this.eoespress = eoespress;
	}
	public String getEopayname() {
		return eopayname;
	}
	public void setEopayname(String eopayname) {
		this.eopayname = eopayname;
	}
	public String getEoid() {
		return eoid;
	}
	public void setEoid(String eoid) {
		this.eoid = eoid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getEotime() {
		return eotime;
	}
	public void setEotime(String eotime) {
		this.eotime = eotime;
	}
	public String getEotype() {
		return eotype;
	}
	public void setEotype(String eotype) {
		this.eotype = eotype;
	}
	public String getEoaddr() {
		return eoaddr;
	}
	public void setEoaddr(String eoaddr) {
		this.eoaddr = eoaddr;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public long getBid() {
		return bid;
	}
	public void setBid(long bid) {
		this.bid = bid;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public int getEostate() {
		return eostate;
	}
	public void setEostate(int eostate) {
		this.eostate = eostate;
	}
	@Override
	public String toString() {
		return "OrderDetial [eoid=" + eoid + ", bname=" + bname + ", total=" + total + ", eotime=" + eotime
				+ ", eotype=" + eotype + ", eoaddr=" + eoaddr +  ", uname=" + uname + ", uid="
				+ uid + ", bid=" + bid + ", count=" + count + ", eostate=" + eostate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((eoaddr == null) ? 0 : eoaddr.hashCode());
		result = prime * result + ((eoid == null) ? 0 : eoid.hashCode());
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
		OrderDetial other = (OrderDetial) obj;
		if (eoaddr == null) {
			if (other.eoaddr != null)
				return false;
		} else if (!eoaddr.equals(other.eoaddr))
			return false;
		if (eoid == null) {
			if (other.eoid != null)
				return false;
		} else if (!eoid.equals(other.eoid))
			return false;
		if (uid != other.uid)
			return false;
		return true;
	}
	
	
}
