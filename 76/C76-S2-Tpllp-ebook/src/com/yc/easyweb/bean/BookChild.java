package com.yc.easyweb.bean;

import java.io.Serializable;

public class BookChild extends Book implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String btname;//类型
	private String btnamesecond;
	private String btnamethird;
	private long bid;//id
	private String bname;//书名
	private String buniversity;//书籍分类学校
	private String bucollege;//书籍分类学院
	private String bumajor;//书籍分类专业
	private String bclass;//书籍分类年级
	
	private String bcontent;//描述
	private String bimg;//图片
	private double bprice;//价格
	private int bstate;//状态(1已上架，2.已下架3.售罄4.审核不通过5.未审核6.已删除)
	private Long btid;//类别
	private String btemp;//所属系列
	private String btemp1;//预留字段
	private Long bnum;//库存
	private String bauthor ;//作者或出版社
	private String bdate;//上传时间
	private long uid;//上传者
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
	public String getBtname() {
		return btname;
	}
	public void setBtname(String btname) {
		this.btname = btname;
	}
	//tosing方法
	@Override
	public String toString() {
		return "BookChild [btname=" + btname + ", btnamesecond=" + btnamesecond + ", btnamethird=" + btnamethird
				+ ", bid=" + bid + ", bname=" + bname + ", buniversity=" + buniversity + ", bucollege=" + bucollege
				+ ", bumajor=" + bumajor + ", bclass=" + bclass + ", bcontent=" + bcontent + ", bimg=" + bimg
				+ ", bprice=" + bprice + ", bstate=" + bstate + ", btid=" + btid + ", btemp=" + btemp + ", btemp1="
				+ btemp1 + ", bnum=" + bnum + ", bauthor=" + bauthor + ", bdate=" + bdate + ", uid=" + uid + "]";
	}
	//重写hashCode和equals方法
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((bauthor == null) ? 0 : bauthor.hashCode());
		result = prime * result + ((bname == null) ? 0 : bname.hashCode());
		result = prime * result + ((btemp == null) ? 0 : btemp.hashCode());
		result = prime * result + ((btnamesecond == null) ? 0 : btnamesecond.hashCode());
		result = prime * result + ((btnamethird == null) ? 0 : btnamethird.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookChild other = (BookChild) obj;
		if (bauthor == null) {
			if (other.bauthor != null)
				return false;
		} else if (!bauthor.equals(other.bauthor))
			return false;
		if (bname == null) {
			if (other.bname != null)
				return false;
		} else if (!bname.equals(other.bname))
			return false;
		if (btemp == null) {
			if (other.btemp != null)
				return false;
		} else if (!btemp.equals(other.btemp))
			return false;
		if (btnamesecond == null) {
			if (other.btnamesecond != null)
				return false;
		} else if (!btnamesecond.equals(other.btnamesecond))
			return false;
		if (btnamethird == null) {
			if (other.btnamethird != null)
				return false;
		} else if (!btnamethird.equals(other.btnamethird))
			return false;
		return true;
	}
	
	
}
