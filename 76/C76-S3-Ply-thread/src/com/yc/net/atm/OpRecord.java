package com.yc.net.atm;

import java.sql.Timestamp;

public class OpRecord implements java.io.Serializable{
	
	private int id;
	private String accountid;
	private double opmoney;
	private double charge;
	private Timestamp optime;
	
	/**
	 * JavaBean 规范
	 * 1、所有的属性都是私有
	 * 2、所有的属性都提供 getter 和 setter 方法
	 * 3、必须提供无参数的构造方法
	 * ....
	 */
	public OpRecord(){}
	
	public OpRecord(int id, String accountid, double opmoney, double charge, Timestamp optime) {
		super();
		this.id = id;
		this.accountid = accountid;
		this.opmoney = opmoney;
		this.charge = charge;
		this.optime = optime;
	}
	
	@Override
	public String toString() {
		return "OpRecord [id=" + id + ", accountid=" + accountid + ", opmoney=" + opmoney + ", charge=" + charge
				+ ", optime=" + optime + "]";
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccountid() {
		return accountid;
	}
	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}
	public double getOpmoney() {
		return opmoney;
	}
	public void setOpmoney(double opmoney) {
		this.opmoney = opmoney;
	}
	public double getCharge() {
		return charge;
	}
	public void setCharge(double charge) {
		this.charge = charge;
	}
	public Timestamp getOptime() {
		return optime;
	}
	public void setOptime(Timestamp optime) {
		this.optime = optime;
	}
	

}
