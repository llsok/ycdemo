package com.yc.http.tomcat.v2;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

public class HttpServletRequest {
	private String method;
	private String requestURI;
	private String protocol;
	private HashMap<String, String> headerMap = new HashMap<>();

	public HttpServletRequest(InputStream in) throws IOException {
		// 将 请求头行的 三段 保存为 三个字符串变量
		byte[] buffer = new byte[1024];
		int count = in.read(buffer);
		if (count > 0) {
			String reqstring = new String(buffer, 0, count);
			System.out.println(reqstring);

			String[] lines = reqstring.split("\r\n");
			method = lines[0].split("\\s")[0];
			// 获取资源路径
			requestURI = lines[0].split("\\s")[1];
			protocol = lines[0].split("\\s")[2];

			// 将 头域中的键值对 保存在 map 中 \r\n CRLF
			
			for (int i = 1; i < lines.length && lines[i - 1].isEmpty() != true; i++) {
				// 只能请求头域的内容
				String[] kv = lines[i].split(":\\s");
				headerMap.put(kv[0], kv[1]);
			}
		}
	}

	public String getMethod() {
		return method;
	}

	public String getProtocol() {
		return protocol;
	}

	public String getRequestURI() {
		return requestURI;
	}

	public String getHeader(String headerName) {
		return headerMap.get(headerName);
	}
	
	/**
	 * 获取单值请求参数
	 * 	URL例子：127.0.0.1/photo/index.html?user=root&pwd=123
	 * 	可以分别获 user 和 pwd 的值
	 * @param parameter
	 * @return
	 */
	public String getParameter(String parameter){
		return null;
	}
	
	/**
	 * 获取数组型请求参数
	 * 	URL例子：127.0.0.1/photo/index.html?like=book&like=movie&user=root&pwd=123
	 * 	获取 like 参数，返回2个元素{"book","movie"}的数组
	 * @param parameter
	 * @return
	 */
	public String[] getParameterValues(String parameter){
		return null;
	}
	
	/**
	 * 完成以上2个方法之后，再完成下面的需求
	 * 1、解析 POST 请求中的请求参数
	 * 		以表单方式发起POST请求，发送请求参数，观察报文结构，解析出请求参数
	 * 		注意：如果请求实体内容获取不完整，请调整 byte[] buffer 的数组大小
	 * 
	 * 2、观察 文件上传方式提交的请求报文，不需要解析，但请打印出报文结构
	 */
}
