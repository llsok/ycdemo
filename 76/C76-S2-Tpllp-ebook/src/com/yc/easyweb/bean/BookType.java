package com.yc.easyweb.bean;

import java.io.Serializable;

public class BookType implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long btid;//类别id
	private String btname;//类别名一
	private String btnamesecond;//类别名二
	private String btnamethird;//类别名三
	private String bttemp;// 备用字段
	private int btstate;//状态(1.正在使用2.未使用3.已删除)
	public int getBtstate() {
		return btstate;
	}
	public void setBtstate(int btstate) {
		this.btstate = btstate;
	}
	public long getBtid() {
		return btid;
	}
	public void setBtid(long btid) {
		this.btid = btid;
	}
	public String getBtname() {
		return btname;
	}
	public void setBtname(String btname) {
		this.btname = btname;
	}
	public String getBtnamesecond() {
		return btnamesecond;
	}
	public void setBtnamesecond(String btnamesecond) {
		this.btnamesecond = btnamesecond;
	}
	public String getBtnamethird() {
		return btnamethird;
	}
	public void setBtnamethird(String btnamethird) {
		this.btnamethird = btnamethird;
	}
	public String getBttemp() {
		return bttemp;
	}
	public void setBttemp(String bttemp) {
		this.bttemp = bttemp;
	}
	@Override
	public String toString() {
		return "BookType [btid=" + btid + ", btname=" + btname + ", btnamesecond=" + btnamesecond + ", btnamethird="
				+ btnamethird + ", bttemp=" + bttemp + "]";
	}
	//重写hashCode和equals方法
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((btname == null) ? 0 : btname.hashCode());
		result = prime * result + ((btnamesecond == null) ? 0 : btnamesecond.hashCode());
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
		BookType other = (BookType) obj;
		if (btname == null) {
			if (other.btname != null)
				return false;
		} else if (!btname.equals(other.btname))
			return false;
		if (btnamesecond == null) {
			if (other.btnamesecond != null)
				return false;
		} else if (!btnamesecond.equals(other.btnamesecond))
			return false;
		return true;
	}
}
