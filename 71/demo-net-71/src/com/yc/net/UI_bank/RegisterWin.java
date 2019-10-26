package com.yc.net.UI_bank;

import org.eclipse.swt.widgets.Dialog;
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

public class RegisterWin extends Dialog {

	protected Object result;
	protected Shell shell;
	private Text text_user;
	private Text text_pwd;
	private Text text_cPwd;

	// 需要用到的属性
	private DataOutputStream dos;
	private DataInputStream dis;

	/**
	 * Create the dialog.
	 * 
	 * @param parent
	 * @param style
	 * @param dos 
	 * @param dis 
	 */
	public RegisterWin(Shell parent, int style, DataOutputStream dos, DataInputStream dis) {
		super(parent, style);
		setText("SWT Dialog");
		this.dos=dos;
		this.dis=dis;
	}

	/**
	 * Open the dialog.
	 * 
	 * @return the result
	 * @throws IOException 
	 * @throws UnknownHostException 
	 */
	public Object open() throws UnknownHostException, IOException {
		createContents();
		shell.open();
		shell.layout();
		Display display = getParent().getDisplay();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		return result;
	}

	/**
	 * Create contents of the dialog.
	 * @throws IOException 
	 * @throws UnknownHostException 
	 */
	private void createContents() throws UnknownHostException, IOException {
		shell = new Shell(getParent(), getStyle());
		shell.setSize(450, 300);
		shell.setText("开户");

		Label label = new Label(shell, SWT.NONE);
		label.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 11, SWT.NORMAL));
		label.setBounds(51, 50, 53, 27);
		label.setText("账户：");

		Label label_1 = new Label(shell, SWT.NONE);
		label_1.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 11, SWT.NORMAL));
		label_1.setText("密码：");
		label_1.setBounds(51, 108, 102, 27);

		Label label_2 = new Label(shell, SWT.NONE);
		label_2.setFont(SWTResourceManager.getFont("Microsoft YaHei UI", 11, SWT.NORMAL));
		label_2.setText("再次确认密码：");
		label_2.setBounds(51, 172, 102, 27);

		text_user = new Text(shell, SWT.BORDER);
		text_user.setBounds(167, 50, 239, 23);

		text_pwd = new Text(shell, SWT.BORDER);
		text_pwd.setBounds(167, 108, 239, 23);

		text_cPwd = new Text(shell, SWT.BORDER);
		text_cPwd.setBounds(167, 172, 239, 23);

		Button Btn_register = new Button(shell, SWT.NONE);

		Btn_register.setBounds(51, 225, 102, 36);
		Btn_register.setText("开户");

		Button Btn_cancel = new Button(shell, SWT.NONE);
		Btn_cancel.setBounds(296, 225, 110, 36);
		Btn_cancel.setText("取消");
		// 开户
		Btn_register.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				String command = "register";
				String user = text_user.getText();
				String pwd = text_pwd.getText();
				String configurePwd = text_cPwd.getText();
				try {
					dos.writeUTF(command);
					dos.writeUTF(user);
					dos.writeUTF(pwd);
					dos.writeUTF(configurePwd);
					String status=dis.readUTF();
					if(status.equals("开户成功")) {
						MessageBox mb=new MessageBox(shell,SWT.OK);
						mb.setText("系统提示");
						mb.setMessage(status);
						int choice = mb.open();
						if(choice==1) {
							shell.close();
						}
					}
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
			}
		});
	}

	
}
