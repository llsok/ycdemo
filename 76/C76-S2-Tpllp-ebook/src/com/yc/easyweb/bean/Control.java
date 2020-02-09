package com.yc.easyweb.bean;

import java.io.Serializable;

public class Control implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long conid;
	private String coname;
	private String conamesecond;
	private int conadd;
	private int condelete;
	private int coninsert;
	private int conupdate;
	private int concheck;
	private long uid;
	private int constate;
	private String contemp;
	public long getConid() {
		return conid;
	}
	public void setConid(long conid) {
		this.conid = conid;
	}
	public String getConame() {
		return coname;
	}
	public void setConame(String coname) {
		this.coname = coname;
	}
	public String getConamesecond() {
		return conamesecond;
	}
	public void setConamesecond(String conamesecond) {
		this.conamesecond = conamesecond;
	}
	public int getConadd() {
		return conadd;
	}
	public void setConadd(int conadd) {
		this.conadd = conadd;
	}
	public int getCondelete() {
		return condelete;
	}
	public void setCondelete(int condelete) {
		this.condelete = condelete;
	}
	public int getConinsert() {
		return coninsert;
	}
	public void setConinsert(int coninsert) {
		this.coninsert = coninsert;
	}
	public int getConupdate() {
		return conupdate;
	}
	public void setConupdate(int conupdate) {
		this.conupdate = conupdate;
	}
	public int getConcheck() {
		return concheck;
	}
	public void setConcheck(int concheck) {
		this.concheck = concheck;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public int getConstate() {
		return constate;
	}
	public void setConstate(int constate) {
		this.constate = constate;
	}
	public String getContemp() {
		return contemp;
	}
	public void setContemp(String contemp) {
		this.contemp = contemp;
	}
	@Override
	public String toString() {
		return "Control [conid=" + conid + ", coname=" + coname + ", conamesecond=" + conamesecond + ", conadd="
				+ conadd + ", condelete=" + condelete + ", coninsert=" + coninsert + ", conupdate=" + conupdate
				+ ", concheck=" + concheck + ", uid=" + uid + ", constate=" + constate + ", contemp=" + contemp + "]";
	}
	//重写hashCode和equals方法
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((coname == null) ? 0 : coname.hashCode());
		result = prime * result + ((conamesecond == null) ? 0 : conamesecond.hashCode());
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
		Control other = (Control) obj;
		if (coname == null) {
			if (other.coname != null)
				return false;
		} else if (!coname.equals(other.coname))
			return false;
		if (conamesecond == null) {
			if (other.conamesecond != null)
				return false;
		} else if (!conamesecond.equals(other.conamesecond))
			return false;
		return true;
	}
	
}
