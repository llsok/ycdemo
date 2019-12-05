package com.yc.springmvc.bean;

import java.io.Serializable;
import java.util.List;

public class JsonModel implements Serializable {
	private static final long serialVersionUID = 2516541939788696370L;
	private Integer code;
	private Object obj;
	private String errmsg;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}

}
