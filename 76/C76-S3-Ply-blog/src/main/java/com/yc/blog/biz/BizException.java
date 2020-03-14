package com.yc.blog.biz;

public class BizException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	// 错误的名称
	private String name;
	
	// 错误编码
	private int code;
	
	public BizException(int code, String name, String msg) {
		super(msg);
		this.code = code;
		this.name = name;
	}

	public BizException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public BizException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public BizException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public BizException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}



}
