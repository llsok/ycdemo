package com.yc.net;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class Demo1 {
	
	/**
	 * 网络编程
	 * ISO 7层网路协议
	 * 
	 * TCP/IP
	 * 
	 * IP 是计算机在网路中的数字地址 192.168.1.120;   IPv4 ==> IPv6
	 * 端口：0~65535    1024以下的端口是预留给系统的
	 */
	
	/**
	 * URL 类：用于访问网络上的资源
	 * 
	 * Socket 类：用于两个计算机之间的通讯
	 * @throws IOException 
	 */
	
	public static void main(String[] args) throws IOException {
		// URL 全局资源定位器
		URL url = new URL("http://www.hyycinfo.com/index.html");
		URLConnection conn = url.openConnection();
		System.out.println(conn);
		conn.getContentType();// 网络资源类型
		conn.getLastModified();//最后修改时间
		conn.getContentLength(); //获取大小
		
		InputStream in = conn.getInputStream();
		
		byte[] buffer = new byte[1024];
		int count;
		while(   (  count = in.read(buffer)  )  > 0   ){
			String s = new String(buffer,0,count,"utf-8");
			System.out.println(s);
		}
		
	}

}
