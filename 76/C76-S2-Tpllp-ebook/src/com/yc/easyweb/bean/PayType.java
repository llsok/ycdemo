package com.yc.easyweb.bean;

import java.io.Serializable;

public class PayType implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long eopaytypeid;//id
	private String eopayname;//Ö§¸¶Ãû×Ö
	private int eopaystate;//×´Ì¬
	private String eopaytemp;
	public long getEopaytypeid() {
		return eopaytypeid;
	}
	public void setEopaytypeid(long eopaytypeid) {
		this.eopaytypeid = eopaytypeid;
	}
	public String getEopayname() {
		return eopayname;
	}
	public void setEopayname(String eopayname) {
		this.eopayname = eopayname;
	}
	public int getEopaystate() {
		return eopaystate;
	}
	public void setEopaystate(int eopaystate) {
		this.eopaystate = eopaystate;
	}
	public String getEopaytemp() {
		return eopaytemp;
	}
	public void setEopaytemp(String eopaytemp) {
		this.eopaytemp = eopaytemp;
	}
	@Override
	public String toString() {
		return "PayType [eopaytypeid=" + eopaytypeid + ", eopayname=" + eopayname + ", eopaystate=" + eopaystate
				+ ", eopaytemp=" + eopaytemp + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((eopayname == null) ? 0 : eopayname.hashCode());
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
		PayType other = (PayType) obj;
		if (eopayname == null) {
			if (other.eopayname != null)
				return false;
		} else if (!eopayname.equals(other.eopayname))
			return false;
		return true;
	}
	
}
