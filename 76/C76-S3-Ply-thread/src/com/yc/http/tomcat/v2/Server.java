package com.yc.http.tomcat.v2;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
	
	public static final String WEBAPPS = "/Tomcat/webapps";

	/**
	 * 启动服务器
	 * @throws IOException 
	 */
	public void startup() throws IOException{
		// 启动Socket服务器
		ServerSocket server = new ServerSocket(80);
		System.out.println("服务器启动成功：80");
		
		// 循环接受浏览器的请求
		Socket socket;
		while ((socket = server.accept()) != null) {
			final Socket innerSocket = socket;
			// 启动多线程，创建处理器处理客户端请求
			new Thread(){
				public void run(){
					// 创建处理器对象
					Processor p;
					try {
						p = new Processor(innerSocket);
						p.process();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}.start();
		}
		server.close();
	}
	
	/**
	 * 服务器停止
	 */
	public void shutdown(){
		
	}
	
	public static void main(String[] args) throws IOException {
		
		new Server().startup();
		
	}
	
}
