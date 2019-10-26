package com.yc.net.UI_bank;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Button;

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
	private static DataOutputStream dos;
	private static DataInputStream dis;

	public MainWin(String id, Socket server, DataOutputStream dos, DataInputStream dis) {
		this.id = id;
		this.server = server;
		this.dos = dos;
		this.dis = dis;
	}

	/**
	 * Launch the application.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			MainWin window = new MainWin(id, server, dos, dis);
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
				String command="diposit";
				String money=text_money.getText();
				try {
					dos.writeUTF(command);
					dos.writeUTF(id);
					dos.writeUTF(money);
				}catch (IOException e1) {
					e1.printStackTrace();
				}
			
			}
		});
		
		//存款
		Btn_diposit.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
			}
		});
		connectServer(server);
	}

	private void connectServer(Socket server) throws UnknownHostException, IOException {
		System.out.println("成功连接服务器");
		InetAddress addr = server.getInetAddress();
		System.out.println("服务器主机地址：" + addr.getHostAddress());
		System.out.println("服务器ip地址" + Arrays.toString(addr.getAddress()));
		
		InputStream in=server.getInputStream();
		OutputStream out = server.getOutputStream();
		
		dos = new DataOutputStream(out);
		dis = new DataInputStream(in);
		new Thread() {
			boolean running=true;{
				String status;
				status=dis.readUTF();
				if(status.equals("存款成功")) {
					shlAtm.getDisplay().asyncExec(new Runnable() {
						@Override
						public void run() {
							MessageBox mb=new MessageBox(shlAtm,SWT.OK);
							mb.setText("系统提示");
							mb.setMessage(status);
							mb.open();
						}
					});
				}else if(status.equals("")) {
					
				}
			}
			
		}.start();
	}
}
