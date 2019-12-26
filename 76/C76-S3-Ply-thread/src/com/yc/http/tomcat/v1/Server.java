package com.yc.http.tomcat.v1;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
	
	// 测试的地址 : 127.0.0.1/photo/index.html
	public final static String WEBAPPS = "/Tomcat/webapps";

	public static void main(String[] args) throws IOException {

		ServerSocket server = new ServerSocket(80);
		System.out.println("服务器启动成功：80");
		
		Socket socket;
		while ((socket = server.accept()) != null) {
			InputStream in = socket.getInputStream();
			OutputStream out = socket.getOutputStream();
			byte[] buffer = new byte[1024];
			int count = in.read(buffer);
			if(count > 0 ){
				// 获取请求报文
				String reqstring = new String(buffer, 0, count);
				System.out.println(reqstring);
				
				String[] lines = reqstring.split("\r\n");
				// 获取资源路径
				String srcpath = lines[0].split("\\s")[1];
	
				// 响应头行
				out.write("HTTP/1.1 200 OK\n".getBytes());
				// 响应头域
				// Context-Type 返回的类型必须按照http协议标准返回
				
				String contextType = getContextType(srcpath);
				
				out.write(("Context-Type: "+contextType+"\n").getBytes());
				// 空行 CRLF
				out.write("\n".getBytes());
				// 响应实体
				// out.write("<html><body>hello world！</body></html>".getBytes());
				
				String filepath = WEBAPPS + srcpath;
				File file = new File(filepath);
				if(file.exists() == false){
					file = new File(WEBAPPS + "/photo/404.html");
				}
				FileInputStream fos = new FileInputStream(file);
				while ((count = fos.read(buffer)) > 0) {
					out.write(buffer, 0, count);
				}
				fos.close();
				
			}
			// 请返回一个 html 文件
			// 正常响应必须关闭 socket
			socket.close();
		}

		/**
		 * 请求报文：
		 * 请求头行：  GET /index.jsp?a=100&b=200 HTTP/1.1
		 * 		头行分成3段  方法名 空格  服务器资源地址 空格 协议版本
		 * 头域：每行一个键值对，以冒号分隔
		 * 		设置请求信息的相关属性
		 * CRLF：空行，作用分隔头域和实体
		 * 实体：POST 有实体内容  GET 没有实体
		 */
	}

	private static String getContextType(String srcpath) {
		int beginIndex = srcpath.lastIndexOf(".");
		String suffix = srcpath.substring(beginIndex);
		switch (suffix) {
		case ".css":
			return "text/css";
		case ".js":
			return "application/javascript";
		case ".jpg":
			return "image/jpeg";
		case ".gif":
			return "image/gif";
		case ".png":
			return "image/png";
		}
		return "text/html";
		
		/** 作业：
		 *  请使用 tomcat/conf/web.xml 中 配置，实现文件后缀与contexttype的映射
		 */
	}

}
