package com.yc.easyweb.bean;

import java.io.Serializable;

public class Usercontrol implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private long ucon;
	private long uid;
	private long conid;
	public long getUcon() {
		return ucon;
	}
	public void setUcon(long ucon) {
		this.ucon = ucon;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public long getConid() {
		return conid;
	}
	public void setConid(long conid) {
		this.conid = conid;
	}
	
	@Override
	public String toString() {
		return "Usercontrol [ucon=" + ucon + ", uid=" + uid + ", conid=" + conid + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (ucon ^ (ucon >>> 32));
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
		Usercontrol other = (Usercontrol) obj;
		if (ucon != other.ucon)
			return false;
		if (uid != other.uid)
			return false;
		return true;
	}
	
}
