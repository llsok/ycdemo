package com.yc.http.tomcat.v2;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/**
 * 处理器
 * 
 * @author Administrator
 *
 */
public class Processor {

	private Socket socket;
	private InputStream in;
	private OutputStream out;

	/**
	 * 构造方法
	 * 
	 * @param socket
	 * @throws IOException
	 */
	public Processor(Socket socket) throws IOException {
		// 将socket 保存在属性中
		this.socket = socket;
		// 获取 输入输出流 保存属性中
		in = socket.getInputStream();
		out = socket.getOutputStream();
	}

	/**
	 * 处理的方法
	 * 
	 * @throws IOException
	 */
	public void process() throws IOException {

		// 创建请求
		HttpServletRequest request = new HttpServletRequest(in);
		
		// 创建响应对象
		HttpServletResponse response = new HttpServletResponse(request,out);
		
		File file = new File(Server.WEBAPPS + request.getRequestURI());
		
		if(file.exists()){
			response.setStatus(200, "OK");
		} else {
			response.setStatus(404, "Not Found");
		}
		
		response.commit();
		
		socket.close();

	}

}
