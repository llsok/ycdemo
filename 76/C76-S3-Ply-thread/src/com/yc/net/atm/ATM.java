package com.yc.net.atm;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Scanner;

/**
 * 
 * 银行柜员机类
 *
 */
public class ATM {

	private Scanner sc = new Scanner(System.in);

	private Socket server;
	private DataOutputStream dos;
	private DataInputStream dis;
	// 记录当前登录的用户卡号
	private String card;

	public static void main(String[] args) throws UnknownHostException, IOException, ClassNotFoundException {
		new ATM().start();
	}

	public void start() throws UnknownHostException, IOException, ClassNotFoundException {
		System.out.println("开始连接银行服务器！");
		server = new Socket("127.0.0.1", 8888);
		System.out.println("银行服务器连接成功！");
		InputStream in = server.getInputStream();
		OutputStream out = server.getOutputStream();
		dis = new DataInputStream(in);
		dos = new DataOutputStream(out);
		System.out.println("银行服务器准备就绪！");
		int op = 0;
		boolean ok = false;
		while (ok == false) {
			System.out.println("******************************");
			System.out.println("*           我的银行                 *");
			System.out.println("******************************");
			System.out.println("*           1、登录                   *");
			System.out.println("*           2、开户                   *");
			System.out.println("******************************");
			System.out.print("请输入你要办理的业务编号：");
			op = sc.nextInt();
			switch (op) {
			case 1:
				if ((ok = login()) == false) {
					System.out.println("密码错误！");
				}
				break;
			case 2:
				register();
				break;
			}
		}

		while (true) {
			System.out.println("\n");
			System.out.println("******************************");
			System.out.println("*           我的银行                 *");
			System.out.println("******************************");
			System.out.println("*         1、查看余额                *");
			System.out.println("*         2、存       款                *");
			System.out.println("*         3、取       款                *");
			System.out.println("*         4、转       账                *");
			System.out.println("*         5、查询明细                *");
			System.out.println("*         0、退       出                *");
			System.out.println("******************************");
			System.out.print("请输入你要办理的业务编号：");
			op = sc.nextInt();
			switch (op) {
			case 0:
				System.exit(0);
			case 1:
				balance();
				break;
			case 2:
				deposit();
				break;
			case 3:
				withdraw();
				break;
			case 4:
				transfer();
				break;
			case 5:
				details();
				break;
			default:
				System.out.println("输入错误，请求重新输入！");
			}
		}

	}

	/**
	 * 注册
	 */
	private void register() {
		// TODO Auto-generated method stub

	}

	/**
	 * 余额
	 */
	private void balance() {
		// TODO Auto-generated method stub

	}

	/**
	 * 转账
	 */
	private void transfer() {
		// TODO Auto-generated method stub

	}

	/**
	 * 存款
	 * @throws IOException 
	 */
	private void deposit() throws IOException {
		System.out.print("请放入现金：");
		int money = sc.nextInt();
		dos.writeUTF("deposit");
		dos.writeUTF(card);
		dos.writeInt(money);
		String result = dis.readUTF();
		System.out.println(result);
	}

	/**
	 * 取款
	 */
	private void withdraw() {
		// TODO Auto-generated method stub

	}

	/**
	 * 查询明细
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 */
	private void details() throws IOException, ClassNotFoundException {
		dos.writeUTF("details");
		dos.writeUTF(card);
		ObjectInputStream oos = new ObjectInputStream(dis);
		@SuppressWarnings("unchecked")
		List<OpRecord> ret = (List<OpRecord>)oos.readObject();
		for(OpRecord o : ret){
			System.out.println(o);
		}
	}

	private boolean login() throws IOException {
		System.out.print("请输入卡号：");
		String card = sc.next();
		System.out.print("请输入密码：");
		String pwd = sc.next();

		dos.writeUTF("login");
		dos.writeUTF(card);
		dos.writeUTF(pwd);
		dos.flush();

		String result = dis.readUTF();

		System.out.println(result);

		boolean ret = "登录成功！".equals(result);
		if(ret == true){
			this.card = card;
		}
		return ret;
	}

}
