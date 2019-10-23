package com.yc.net.http.v2;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.HashMap;

public class Processer {
	
	// 定义 Servlet 容器
	private HashMap<String,HttpServlet> servletContainer = new HashMap<>();
	
	{
		// 添加一个Servlet 实现响应重定向
		servletContainer.put("/redirect.s", new RedirectServlet());
		// 添加一个Servlet 实现请求转发
		servletContainer.put("/forward.s", new ForwardServlet());
	}
	
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
			
			/**
			 * 静态请求：对应着一个html、js、css。。。
			 * 动态请求：hello.s
			 * 非法404请求	  即没有物理问文件也没有虚拟的地址
			 */
			
			// 判断物理文件是否存在
			String rootPath = "/Tomcat/webapps/photo";
			String webPath = request.getRequestURL();
			// 判断访问文件是否存在			
			String diskPath = rootPath + webPath;
			if(new File(diskPath).exists() == true){
				// 静态请求直接commit
			} else if(servletContainer.containsKey(webPath)) {
				// 127.0.0.1:8080/hello.s
				// 判断虚拟路径中有没有该地址（Servlet容器 中去找）
				// 动态请求先由servlet 处理
				HttpServlet servlet = servletContainer.get(webPath);
				servlet.service(request, response);
			} else {
				// 404   改写 资源文件 为 404.html
				response.setStatus(404,"Not Found");
				request.setRequestURL("/404.html");
			}
			
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
