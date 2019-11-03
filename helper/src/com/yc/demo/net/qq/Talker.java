package com.yc.demo.net.qq;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;

/**
 *  聊天类
 */
public class Talker extends Thread{

	private InputStream in;
	private OutputStream out;
	private MsgListener listener;

	/**
	 * 
	 * @param socket
	 *            连接的Socket
	 * @param listener
	 *            监听消息的监听器
	 * @throws IOException
	 */
	public Talker(Socket socket, MsgListener listener) throws IOException {
		this.listener = listener;
		// 获取网络地址对象
		listener.onConnect(socket.getInetAddress());
		in = socket.getInputStream();
		out = socket.getOutputStream();
		// 启动线程，开始接受消息
		start();
	}

	public void run() {
		while (true) {
			int count;
			byte[] buf = new byte[1024];
			try {
				count = in.read(buf);
				String msg = new String(buf, 0, count);
				// 调用监听器的方法
				listener.onMessage(msg);
			} catch (Exception e) {
				e.printStackTrace();
				break;
			}
		}
	}

	/**
	 * 发送消息
	 */
	public String send(String name, String msg) throws IOException {
		String ret = name + " 说：" + msg;
		out.write(ret.getBytes());
		return ret;
	}

}

/**
 *	接收消息的监听器
 */
interface MsgListener {
	// 当接收到消息时执行的方法
	public void onMessage(String msg);
	// 当连接成功时执行的方法
	public void onConnect(InetAddress addr);
}
