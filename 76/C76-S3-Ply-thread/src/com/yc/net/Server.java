package com.yc.net;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
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

/**
 * Socket 套接字，两台计算机的输入输出流的对接
 */
public class Server {

	public static final String FILE_HOME = "f:/";

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
						if (s.startsWith("文件：")) {
							String filename = s.substring("文件：".length());
							filename = filename.substring(filename.lastIndexOf("/") + 1);
							saveFile(in, filename);
						} else {
							System.out.println(s);
						}
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
						String msg = sc.nextLine();
						out.write(msg.getBytes());
						// 文件：e:/a.html
						if (msg.startsWith("文件：")) {
							String filename = msg.substring("文件：".length());
							sendFile(out, filename);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		}.start();

	}

	static void saveFile(InputStream in, String filename) throws IOException {
		// 读取发送过来的文件大小
		DataInputStream dis = new DataInputStream(in);
		long filesize = dis.readLong();
		// 定义文件输出流
		FileOutputStream fos = new FileOutputStream(FILE_HOME + filename);
		try {
			byte[] buf = new byte[1024];
			int count;
			int readsize = 0;
			while (readsize < filesize && (count = in.read(buf)) > 0) {
				fos.write(buf, 0, count);
				readsize += count;
			}
		} finally {
			fos.close();
		}
		System.out.println("文件保存成功：" + FILE_HOME + filename);
	}

	static void sendFile(OutputStream out, String filepath) throws IOException {
		// 发送文件大小，好让对方的流知道文件何时结束文件的接收
		DataOutputStream dos = new DataOutputStream(out);
		File f = new File(filepath);
		dos.writeLong(f.length());

		// 将文件发送给对方
		FileInputStream fis = new FileInputStream(f);
		try {
			byte[] buf = new byte[1024];
			int count;
			while ((count = fis.read(buf)) > 0) {
				out.write(buf, 0, count);
			}
		} finally {
			fis.close();
		}
		System.out.println("文件发送成功：" + filepath);
	}
}
