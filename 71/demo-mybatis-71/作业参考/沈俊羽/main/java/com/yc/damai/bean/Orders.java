package com.yc.damai.bean;

import java.sql.Timestamp;
import java.util.List;

public class Orders {

	private Long oid;
	private Float total;
	// java.sql.Date 只表示日期 年月日
	private Timestamp ordertime;
	private Integer state;
	private String addr;
	private String phone;
	private Long uid;
	private String name;
	
	private List<Orderitem> items;

	public List<Orderitem> getItems() {
		return items;
	}
	public void setItems(List<Orderitem> items) {
		this.items = items;
	}
	
	public Long getOid() {
		return oid;
	}
	public void setOid(Long oid) {
		this.oid = oid;
	}
	public Float getTotal() {
		return total;
	}
	public void setTotal(Float total) {
		this.total = total;
	}
	public Timestamp getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Timestamp ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", total=" + total + ", ordertime=" + ordertime + ", state=" + state + ", addr="
				+ addr + ", phone=" + phone + ", uid=" + uid + ", name=" + name + ", items=" + items + "]";
	}
	
}