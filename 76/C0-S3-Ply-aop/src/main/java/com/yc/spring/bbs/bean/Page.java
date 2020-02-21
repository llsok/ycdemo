package com.yc.spring.bbs.bean;

import java.util.List;

/**
 * 分页查询类
 * @author Administrator
 *
 */

public class Page {
	
	private long total;   	// 总行数
	private List<Object> rows;  	// 查询的数据
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<Object> getRows() {
		return rows;
	}
	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

}
