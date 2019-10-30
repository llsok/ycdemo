package com.yc.demo.net.qq;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.MessageBox;

public class QQMain {

	private Socket socket;
	private ServerSocket server;

	protected Shell shell;
	private Text tContent;
	private Talker talker;
	private Text tMsg;
	private Label lblNewLabel;
	private Label label;
	private Text tName;
	private Button btnSend;

	/**
	 * Launch the application.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			QQMain window = new QQMain();
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Open the window.
	 */
	public void open() {
		Display display = Display.getDefault();
		createContents();
		shell.open();
		shell.layout();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}

	/**
	 * Create contents of the window.
	 */
	protected void createContents() {
		shell = new Shell();
		shell.setSize(673, 450);
		shell.setLayout(null);
		shell.setText("QQ聊天室");

		tContent = new Text(shell, SWT.BORDER | SWT.MULTI);
		tContent.setEditable(false);
		tContent.setBounds(5, 43, 640, 316);

		btnSend = new Button(shell, SWT.NONE);
		btnSend.setEnabled(false);
		btnSend.setBounds(546, 365, 99, 30);
		/**
		 * 发送消息
		 */
		btnSend.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try {
					if (tMsg.getText().trim().isEmpty() == false) {
						String msg = talker.send(tName.getText(), tMsg.getText());
						tContent.setText(tContent.getText() + msg + "\r\n");
						tMsg.setText("");
						// 设置焦点
						tMsg.setFocus();
					}
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		});
		btnSend.setText("发送");

		tMsg = new Text(shell, SWT.BORDER);
		tMsg.setEnabled(false);
		tMsg.setBounds(5, 367, 535, 26);

		lblNewLabel = new Label(shell, SWT.NONE);
		lblNewLabel.setBounds(342, 13, 303, 20);
		lblNewLabel.setText("好友IP：请再启动一次程序作为客户端");

		label = new Label(shell, SWT.NONE);
		label.setText("昵称：");
		label.setBounds(10, 13, 51, 20);

		tName = new Text(shell, SWT.BORDER);
		tName.setText("白富美");
		tName.setBounds(67, 10, 186, 26);

		begin();

	}

	public void begin() {
		new Thread() {
			public void run() {
				try {
					try {
						// 连接服务器
						socket = new Socket("127.0.0.1", 8888);
					} catch (IOException e) {
						// 如果连不上服务器，说明服务器未启动，则启动服务器
						server = new ServerSocket(8888);
						System.out.println("服务器启动完成，监听端口：8888");
						socket = server.accept();
					}
					
					/**
					 * 注意：所有在自定义线程中修改图形控件属性，
					 * 都必须使用 shell.getDisplay().asyncExec() 方法
					 */
					shell.getDisplay().asyncExec(new Runnable() {
						@Override
						public void run() {
							MessageBox mb = new MessageBox(shell,SWT.OK);
							mb.setText("系统提示");
							mb.setMessage("连接成功！现在你可以开始聊天了！");
							mb.open();
						}
					});

					talker = new Talker(socket, new MsgListener() {
						@Override
						public void onMessage(String msg) {
							// 收到消息时，将消息更新到多行文本框
							shell.getDisplay().asyncExec(new Runnable() {
								@Override
								public void run() {
									tContent.setText(tContent.getText() + msg + "\r\n");
								}
							});
						}

						@Override
						public void onConnect(InetAddress addr) {
							// 连接成功时，显示对方IP
							shell.getDisplay().asyncExec(new Runnable() {
								@Override
								public void run() {
									lblNewLabel.setText("好友IP：" + addr.getHostAddress());
									tMsg.setEnabled(true);
									btnSend.setEnabled(true);
								}
							});
						}
					});
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}.start();

	}
}
