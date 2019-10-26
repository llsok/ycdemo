package com.yc.net.UI_bank;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class Server {
	public static void main(String[] args) throws IOException {
		new Server().start();
	}

	private DataOutputStream dos;
	private BankDao dao = new BankDao();

	public void start() throws IOException {
		// 创建套接字服务器
		ServerSocket server = new ServerSocket(8888);
		System.out.println("服务器启动完成，监听端口8888");
		boolean running = true;
		while (running) {
			// 当前线程处于阻塞状态
			Socket client = server.accept();
			// 创建线程处理业务
			new Thread() {
				public void run() {
					InetAddress addr = client.getInetAddress();
					System.out.println("客户端主机地址：" + addr.getHostAddress());
					System.out.println("ip地址" + Arrays.toString(addr.getAddress()));
					try {
						InputStream in = client.getInputStream();
						OutputStream out = client.getOutputStream();
						dos = new DataOutputStream(out);
						boolean running = true;
						while (running) {
							/**
							 * 业务约定==> 协议 如果客户端发送一个命令 ： diposit
							 */
							DataInputStream dis = new DataInputStream(in);
							try {
								String command = dis.readUTF();
								switch (command) {
								case "login":
									login(dis.readUTF(), dis.readUTF());
									break;
								case "register":
									register(dis.readUTF(), dis.readUTF(), dis.readUTF());
									break;
								case "diposit":
									diposit(dis.readUTF(), dis.readUTF());
									break;
								case "withdraw":
									withdraw(dis.readUTF(), dis.readFloat());
									break;
								case "transfer":
								}
							} catch (EOFException e) {
								break;
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}.start();
		}

	}

	public void register(String user, String pwd, String configurePwd) throws IOException {
		if(pwd!=configurePwd) {
			dos.writeUTF("两次密码输入不正确");
		}else {
			dao.register(user, pwd);
			dos.writeUTF("开户成功");
		}
		
		dos.flush();
	}

	public void login(String user, String pwd) throws IOException {
		List<Map<String, Object>> ret = dao.login(user, pwd);
		if (ret.size() > 0) {
			dos.writeUTF("登录成功");
			dos.writeUTF(user);
			dos.flush();
		} else {
			dos.writeUTF("登录失败，请检查账号和密码是否正确");
			dos.flush();
		}
	}

	// 存款
	public void diposit(String cardno, String money) throws IOException {
		dao.update(cardno, Float.parseFloat(money));
		dos.writeUTF("存款成功");
		dos.flush();
	}

	// 取款
	public void withdraw(String cardno, float money) throws IOException {
		dao.update(cardno, -money);
		dos.writeUTF("取款成功");
		dos.flush();
	}

	// 转账
	public void transfer(String cardno1, String cardno2, float money) {

	}
}
