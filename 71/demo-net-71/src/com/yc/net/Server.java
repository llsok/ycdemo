package com.yc.net;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.Scanner;

public class Server {

	public static void main(String[] args) throws IOException, InterruptedException {
		
		// 屏幕录入对象
		Scanner scanner = new Scanner(System.in);

		// 创建套接字服务器
		ServerSocket server = new ServerSocket(8888);
		System.out.println("服务器启动完成，监听端口：8888");
		// 当前线程进入阻塞状态
		Socket client = server.accept();

		// 获取网络地址对象
		InetAddress addr = client.getInetAddress();
		System.out.println("客户端的主机地址：" + addr.getHostAddress());
		System.out.println("客户端的IP地址：" + Arrays.toString(addr.getAddress()));

		InputStream in = client.getInputStream();
		OutputStream out = client.getOutputStream();

		Thread t1 = new Thread() {
			public void run() {
				boolean running = true;
				while (running) {
					System.out.print("我说：");
					String msg = scanner.nextLine();
					try {
						out.write(msg.getBytes());
						// 文件：e:/a.txt
						if(msg.startsWith("文件：")){
							String filename = msg.substring("文件：".length());
							sendFile(out, filename);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		};
		t1.start();

		Thread t2 = new Thread() {
			public void run() {
				boolean running = true;
				while (running) {
					try {
						byte[] buf = new byte[1024];
						int count = in.read(buf);
						String msg = new String(buf, 0, count);
						// 文件：e:/a.txt
						if (msg.startsWith("文件：")) {
							String filename = msg.substring("文件：".length());
							filename = filename.substring(filename.lastIndexOf("/") + 1);
							saveFile(in, filename);
						} else {
							System.out.println("服务器说：" + msg);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		};
		t2.start();

		t1.join();
		t2.join();
		
		scanner.close();
		client.close();
		server.close();
		
		/**
		 * 1、实现使用屏幕录入发送的消息
		 * 2、可以无限制的发送消息
		 * 		步话机
		 * 		qq
		 * 
		 * 3、 如何实现文件的发送
		 * 		例如：文件：c:/a.txt
		 * 
		 * 作业：使用SWT 实现聊天界面
		 * 
		 * 
		 */
		
	}
	
	static void saveFile(InputStream in, String filename) throws IOException {
		FileOutputStream fos = new FileOutputStream("d:/" + filename);
		try {
			byte[] buf = new byte[1024];
			int count;
			while ((count = in.read(buf)) > 0) {
				fos.write(buf, 0, count);
			}
		} finally {
			fos.close();
		}
		System.out.println("文件保存成功：" + "d:/" + filename);
	}
	
	static void sendFile(OutputStream out, String filename) throws IOException {
		FileInputStream fis = new FileInputStream( filename);
		try {
			byte[] buf = new byte[1024];
			int count;
			while ((count = fis.read(buf)) > 0) {
				out.write(buf, 0, count);
			}
		} finally {
			fis.close();
		}
		System.out.println("文件发送成功：" + "d:/" + filename);
	}

}
