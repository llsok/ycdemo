package com.yc.http.tomcat.v3;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

/**
 * 处理器
 * 
 * @author Administrator
 *
 */
public class Processor {
	
	private static Map<String,HttpServlet> servletMap = new HashMap<>();
	
	static {
		// 将Servlet 配置到服务器中
		servletMap.put("/photo/hello.do", new HelloServlet());
	}

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
		
		/**
		 * 1、判断当前的请求地址是否是动态请求
		 * 		判断当前地址是否在服务器中注册，那么根据地址可以获取到 Servlet 对象
		 * 2、如果是，则使用 Servlet 的方法处理请求，返回结果
		 * 3、不过不是则当成静态请求处理
		 */
		
		HttpServlet servlet = servletMap.get(request.getRequestURI());
		if(servlet != null){
			// 动态请求
			servlet.service(request, response);
			// 默认设置响应结果码
			if(response.getStatus() == 0) {
				response.setStatus(200, "OK");
			}
		} else {
			// 静态请求
			if(file.exists()){
				response.setStatus(200, "OK");
			} else {
				response.setStatus(404, "Not Found");
			}
		}
		
		response.commit();
		
		socket.close();

	}

}
