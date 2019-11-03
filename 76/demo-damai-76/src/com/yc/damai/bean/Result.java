package com.yc.damai.bean;

/**
 * 用于封装 ajax 请求返回的数据的类
 */
public class Result {
	
	// 返回的消息
	private String msg;
	// 返回的结果码 0 失败  1 成功
	private int code;
	// 返回的数据
	private Object data;
	
	/**
	 * 默认成功的结果对象
	 * @param msg
	 * @return
	 */
	public static Result success(String msg){
		Result result = new Result();
		result.code = 1;
		result.msg = msg;
		return result;
	}
	
	/**
	 * 默认成功的结果对象
	 * @param msg
	 * @return
	 */
	public static Result failure(String msg){
		Result result = new Result();
		result.code = 0;
		result.msg = msg;
		return result;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	

}
