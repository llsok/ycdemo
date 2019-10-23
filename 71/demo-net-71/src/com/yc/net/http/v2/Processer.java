package com.yc.net.http.v2;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class Processer {
	
	public void process(Socket socket){
		InputStream in;
		OutputStream out;
		try {
			in = socket.getInputStream();
			out = socket.getOutputStream();
			
			// 读取请求报文内容
			byte[] buf = new byte[1024];
			int count;
			count = in.read(buf);
			String content = new String(buf, 0, count);
			System.out.println(content);
			// 解析请求报
			HttpServletRequest request = parseRequest(content);
			HttpServletResponse response = new HttpServletResponse(request, out);
			response.commit();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			socket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public HttpServletRequest parseRequest(String content){
		HttpServletRequest request = new HttpServletRequest(content);
		return request;
	}

}
