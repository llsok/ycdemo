package com.yc.net.UI_bank;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Button;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import org.eclipse.swt.SWT;
import org.eclipse.wb.swt.SWTResourceManager;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;

public class MainWin {

	protected Shell shlAtm;
	private static String id;
	private static Socket server;
	private Text text_money;
	private Text text_accountId;
	private DataOutputStream dos;
	private DataInputStream dis;

	public MainWin(String id, Socket server) {
		this.id = id;
		this.server = server;
	}

	/**
	 * Launch the application.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			MainWin window = new MainWin(id, server);
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Open the window.
	 * 
	 * @throws IOException
	 * @throws UnknownHostException
	 */
	public void open() {
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
	 * 
	 * @throws IOException
	 * @throws UnknownHostException
	 */
	protected void createContents() {
		shlAtm = new Shell();
		shlAtm.setSize(449, 244);
		shlAtm.setText("ATM");

		Button Btn_withdraw = new Button(shlAtm, SWT.NONE);

		Btn_withdraw.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 13, SWT.NORMAL));
		Btn_withdraw.setBounds(10, 26, 185, 33);
		Btn_withdraw.setText("取款");

		Button Btn_diposit = new Button(shlAtm, SWT.NONE);

		Btn_diposit.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 13, SWT.NORMAL));
		Btn_diposit.setBounds(238, 26, 185, 33);
		Btn_diposit.setText("存款");

		Button Btn_transfer = new Button(shlAtm, SWT.NONE);
		
		Btn_transfer.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 13, SWT.NORMAL));
		Btn_transfer.setBounds(10, 83, 185, 32);
		Btn_transfer.setText("转账");

		Button button_3 = new Button(shlAtm, SWT.NONE);

		button_3.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 13, SWT.NORMAL));
		button_3.setBounds(238, 84, 185, 30);
		button_3.setText("退出");

		text_money = new Text(shlAtm, SWT.BORDER);
		text_money.setBounds(142, 138, 281, 23);

		text_accountId = new Text(shlAtm, SWT.BORDER);
		text_accountId.setBounds(142, 172, 281, 23);

		Label lblNewLabel = new Label(shlAtm, SWT.NONE);
		lblNewLabel.setBounds(57, 175, 79, 23);
		lblNewLabel.setText("账号");

		Label lblNewLabel_1 = new Label(shlAtm, SWT.NONE);
		lblNewLabel_1.setBounds(57, 139, 79, 23);
		lblNewLabel_1.setText("金额");

		// 取款
		Btn_withdraw.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				int choice;
				String money = text_money.getText();
				String command = "withdraw";
				MessageBox mb = new MessageBox(shlAtm, SWT.OK);
				mb.setText("系统提示");
				if(money==""||money.trim().isEmpty()) {
					mb.setMessage("请输入取款金额");
					choice=mb.open();
					if(choice==SWT.OK) {
						text_money.setText("");
						text_money.setFocus();
					}
				}else {
					try {
						dos.writeUTF(command);
						dos.writeUTF(id);
						dos.writeUTF(money);
						dos.flush();
						String status = dis.readUTF();
						if (status.equals("取款成功")) {
							mb.setMessage(status);
							mb.open();
						}
					} catch (IOException e1) {
						e1.printStackTrace();
					}

				}
				
			}
		});

		// 存款
		Btn_diposit.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				int choice;
				String command = "diposit";
				String money = text_money.getText();
				MessageBox mb = new MessageBox(shlAtm, SWT.OK);
				mb.setText("系统提示");
				if(money==""||money.trim().isEmpty()) {
					mb.setMessage("请输入存款金额");
					choice=mb.open();
					if(choice==SWT.OK) {
						text_money.setText("");
						text_money.setFocus();
					}
				}else {
					try {
						dos.writeUTF(command);
						dos.writeUTF(id);
						dos.writeUTF(money);
						dos.flush();
						String status = dis.readUTF();
						if (status.equals("存款成功")) {
							mb.setMessage(status);
							mb.open();
						}
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
				
			}
		});

		// 退出
		button_3.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				String command = "exit";
				try {
					dos.writeUTF(command);
					dos.flush();
					String status = dis.readUTF();
					if (status.equals("退出")) {
						MessageBox mb = new MessageBox(shlAtm, SWT.OK | SWT.CANCEL);
						mb.setText("系统提示");
						mb.setMessage("您是否要退出ATM");
						int choice = mb.open();
						if (choice == SWT.OK) {
							shlAtm.close();
							server.close();
						}
					}
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		});
		
		//转账
		Btn_transfer.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				MessageBox mb=new MessageBox(shlAtm,SWT.OK);
				mb.setText("系统提示");
				//choice 用来接收用户点击弹窗的返回值
				int choice;
				String command = "transfer";
				String money =text_money.getText();
				String accountId=text_accountId.getText();
				if(accountId=="") {
					mb.setMessage("转入账号不能为空");
					choice=mb.open();
					if(choice==SWT.OK) {
						text_accountId.setFocus();
					}
				}else if(money=="") {
					mb.setMessage("转入金额不能为空");
					choice=mb.open();
					if(choice==SWT.OK) {
						text_money.setFocus();
					}
				}else if(accountId==id){
					mb.setMessage("不能向自己账户转账！");
					choice=mb.open();
					if(choice==SWT.OK) {
						text_accountId.setFocus();
					}
				}else {
					mb.setMessage("您确定要向账户："+accountId+"转入金额："+money+"元？");
					choice=mb.open();
					if(choice==SWT.OK) {
						try {
							dos.writeUTF(command);
							dos.writeUTF(id);
							dos.writeUTF(accountId);
							dos.writeUTF(money);
							dos.flush();
							String status=dis.readUTF();
							//提示弹窗
							mb.setText("系统提示");
							mb.setMessage(status);
							mb.open();
						} catch (IOException e1) {
							e1.printStackTrace();
						}
					}
				}
				
			}
		});

		try {
			connectServer();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	private void connectServer() throws UnknownHostException, IOException {
		InputStream in = server.getInputStream();
		OutputStream out = server.getOutputStream();
		
		dos = new DataOutputStream(out);
		dis = new DataInputStream(in);
	}
}
