package com.yc.net.UI_bank;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.MessageBox;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Arrays;

import org.eclipse.swt.SWT;
import org.eclipse.wb.swt.SWTResourceManager;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;

public class LoginWin {

	protected Shell shlAtm;
	private Text text_user;
	private Text text_pwd;
	
	//需要用到的属性
	private DataOutputStream dos;
	private DataInputStream dis;
	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			LoginWin window = new LoginWin();
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Open the window.
	 * @throws IOException 
	 * @throws UnknownHostException 
	 */
	public void open() throws UnknownHostException, IOException {
		Display display = Display.getDefault();
		createContents();
		shlAtm.open();
		shlAtm.layout();
		while (!shlAtm.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}

	/**
	 * Create contents of the window.
	 * @throws IOException 
	 * @throws UnknownHostException 
	 */
	protected void createContents() throws UnknownHostException, IOException {
		shlAtm = new Shell();
		shlAtm.setSize(449, 290);
		shlAtm.setText("ATM");
		shlAtm.setLayout(null);
		
		Label label = new Label(shlAtm, SWT.NONE);
		label.setBounds(60, 45, 51, 25);
		label.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 11, SWT.NORMAL));
		label.setText("账号：");
		
		Label label_1 = new Label(shlAtm, SWT.NONE);
		label_1.setBounds(60, 113, 58, 22);
		label_1.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 11, SWT.NORMAL));
		label_1.setText("密码：");
		
		text_user = new Text(shlAtm, SWT.BORDER);
		text_user.setBounds(152, 45, 172, 23);
		
		text_pwd = new Text(shlAtm, SWT.BORDER);
		text_pwd.setBounds(152, 113, 172, 23);
		
		Button Btn_login = new Button(shlAtm, SWT.NONE);
		
		Btn_login.setBounds(60, 201, 108, 27);
		Btn_login.setText("登录");
		
		Button Btn_register = new Button(shlAtm, SWT.NONE);
		
		Btn_register.setText("开户");
		Btn_register.setBounds(241, 201, 108, 27);
		
		//登录点击事件
		Btn_login.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				String command ="login";
				try {
					dos.writeUTF(command);
					dos.writeUTF(text_user.getText());
					dos.writeUTF(text_pwd.getText());
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		});
		//注册点击事件
		Btn_register.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try {
					new RegisterWin(shlAtm,SWT.OK,dos,dis).open();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		});
		connectServer();
	}
	
	private void connectServer() throws UnknownHostException, IOException {
		Socket server = new Socket("127.0.0.1", 8888);
		System.out.println("成功连接服务器");
		InetAddress addr = server.getInetAddress();
		System.out.println("服务器主机地址：" + addr.getHostAddress());
		System.out.println("服务器ip地址" + Arrays.toString(addr.getAddress()));
		
		InputStream in=server.getInputStream();
		OutputStream out = server.getOutputStream();
		
		dos = new DataOutputStream(out);
		dis = new DataInputStream(in);
	
		new Thread() {
			boolean running=true;
			public void run() {
				while(running) {
					 String status;
					 String id;
					 try {
						status=dis.readUTF();
						if(status.equals("登录成功")) {
							id=dis.readUTF();
							shlAtm.getDisplay().asyncExec(new Runnable() {
								@Override
								public void run() {
									shlAtm.dispose();
									try {
										new MainWin(id,server,dos,dis).open();
									} catch (Exception e) {
										e.printStackTrace();
									}
									running= false;
								}
							});
						}else {
							
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}.start();
	}
}
