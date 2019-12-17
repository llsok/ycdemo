package com.yc.net;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.Scanner;

/**
 * Socket 套接字，两台计算机的输入输出流的对接
 */
public class Server {

	public static void main(String[] args) throws IOException {

		// 创建 Socket 服务端
		ServerSocket server = new ServerSocket(8888);
		System.out.println("服务器启动成功，等待客户端连接: 8888");
		// server 等待客户端的连接，进入阻塞状态
		Socket socket = server.accept();

		// 获取客户端地址对象
		InetAddress addr = socket.getInetAddress();
		System.out.println(addr.getHostName());
		System.out.println(Arrays.toString(addr.getAddress()));

		InputStream in = socket.getInputStream();
		OutputStream out = socket.getOutputStream();
		Scanner sc = new Scanner(System.in);

		// 读的线程
		new Thread() {
			public void run() {
				while (true) {
					try {
						byte[] buffer = new byte[1024];
						// read 是哟一个阻塞方法
						int count;
						count = in.read(buffer);
						String s = new String(buffer, 0, count);
						System.out.println(s);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		}.start();
		
		// 写的线程
		new Thread() {
			public void run() {
				while (true) {
					try {
						out.write(sc.nextLine().getBytes());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		}.start();
	}

}
