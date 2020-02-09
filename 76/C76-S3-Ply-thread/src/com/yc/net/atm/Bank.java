package com.yc.net.atm;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.DataOutputStream;
import java.io.DataOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 银行类
 */
public class Bank {

	private ServerSocket server;
	{
		try {
			server = new ServerSocket(8888);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) throws IOException {
		Bank bank = new Bank();
		bank.begin();
	}

	private void begin() throws IOException {
		// 建立服务器，等待客户端连接
		System.out.println("银行服务器启动完成！");
		Socket client = server.accept();
		System.out.println("客户端连接成功！");
		// 当客户端连接成功之后，fwq进入就绪状态
		InputStream in = client.getInputStream();
		OutputStream out = client.getOutputStream();
		DataInputStream dis = new DataInputStream(in);
		DataOutputStream dos = new DataOutputStream(out);
		System.out.println("客户端就绪！");
		while (true) {
			String cmd = dis.readUTF();
			String card;
			// 当客户端发送命令过来，解析命令
			switch (cmd) {
			case "login":
				card = dis.readUTF();
				String pwd = dis.readUTF();
				System.out.println("登录判断");
				if (login(card, pwd)) {
					dos.writeUTF("登录成功！");
				} else {
					dos.writeUTF("登录失败！");
				}
				break;
			case "register":
				break;
			case "deposit":
				card = dis.readUTF();
				int	money = dis.readInt();
				if(deposit(card,money)){
					dos.writeUTF("存款成功！");
				} else {
					dos.writeUTF("存款失败！");
				}
				break;
			case "details":
				card = dis.readUTF();
				List<OpRecord> ret = details(card);
				ObjectOutputStream oos = new ObjectOutputStream(out);
				oos.writeObject(ret);
				oos.flush();
				break;
			default:
				// 错误的命令
			}
		}

		// 执行对应的操作，并返回结果
	}

	private List<OpRecord> details(String card) {
		// TODO Auto-generated method stub
		List<OpRecord> ret = new ArrayList<>();
		ret.add(new OpRecord(1,"123456",1000,0,new Timestamp(System.currentTimeMillis())));
		ret.add(new OpRecord(2,"123456",-2000,0,new Timestamp(System.currentTimeMillis())));
		ret.add(new OpRecord(3,"123456",8888,0,new Timestamp(System.currentTimeMillis())));
		ret.add(new OpRecord(4,"123456",-6666,7,new Timestamp(System.currentTimeMillis())));
		return ret;
	}

	private boolean deposit(String card, int money) {
		// TODO Auto-generated method stub
		return true;
	}

	private boolean login(String card, String pwd) {
		if ("123456".equals(card) && "123".equals(pwd)) {
			return true;
		} else {
			return false;
		}
	}

}
