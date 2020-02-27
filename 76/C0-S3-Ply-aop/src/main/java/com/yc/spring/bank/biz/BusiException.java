package com.yc.spring.bank.biz;

/**
 * 自定义的编译期异常
 */
public class BusiException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BusiException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BusiException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public BusiException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public BusiException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public BusiException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	
}
