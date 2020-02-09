package com.yc.easyweb.bean;

import java.io.Serializable;

public class Notice implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long nid;//公告id
	private String ntime;//发布时间
	private long nnumber;//浏览量
	private String nauthor;//发布者
	private String ncontent;//内容
	private int nstate;//状态（1.未过期2.已过期）
	private String ntemp;//备用字段
	private String ntitle;//标题
	
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public long getNid() {
		return nid;
	}
	public void setNid(long nid) {
		this.nid = nid;
	}
	public String getNtime() {
		return ntime;
	}
	public void setNtime(String ntime) {
		this.ntime = ntime;
	}
	
	public long getNnumber() {
		return nnumber;
	}
	public void setNnumber(long nnumber) {
		this.nnumber = nnumber;
	}
	public String getNauthor() {
		return nauthor;
	}
	public void setNauthor(String nauthor) {
		this.nauthor = nauthor;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNtemp() {
		return ntemp;
	}
	public void setNtemp(String ntemp) {
		this.ntemp = ntemp;
	}
	public int getNstate() {
		return nstate;
	}
	public void setNstate(int nstate) {
		this.nstate = nstate;
	}
	
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", ntime=" + ntime + ", nnumber=" + nnumber + ", nauthor=" + nauthor
				+ ", ncontent=" + ncontent + ", nstate=" + nstate + ", ntemp=" + ntemp + ", ntitle=" + ntitle + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nauthor == null) ? 0 : nauthor.hashCode());
		result = prime * result + ((ncontent == null) ? 0 : ncontent.hashCode());
		result = prime * result + ((ntitle == null) ? 0 : ntitle.hashCode());
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
		Notice other = (Notice) obj;
		if (nauthor == null) {
			if (other.nauthor != null)
				return false;
		} else if (!nauthor.equals(other.nauthor))
			return false;
		if (ncontent == null) {
			if (other.ncontent != null)
				return false;
		} else if (!ncontent.equals(other.ncontent))
			return false;
		if (ntitle == null) {
			if (other.ntitle != null)
				return false;
		} else if (!ntitle.equals(other.ntitle))
			return false;
		return true;
	}
	
}
