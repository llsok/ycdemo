package com.yc.jee.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
* 发送Email
*/
public class EmailUtils {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		send("306529917@qq.com","测-试-邮-件","测-试-邮-件,测试编号000111");
	}

	private static String MAIL_SMTP_HOST = "smtp.qq.com";
	private static String MAIL_SMTP_PORT = "587";
	/**
	 * @Description: 发送一个简单的邮件
	 * @throws MessagingException 
	*/
	public static void send(String address, String title, String content) throws MessagingException {
		// 创建Properties 类用于记录邮箱的一些属性
		Properties props = new Properties();
		// 表示SMTP发送邮件，必须进行身份验证
		props.put("mail.smtp.auth", "true");
		// 此处填写SMTP服务器, 例如:smtp.qq.com
		props.put("mail.smtp.host", MAIL_SMTP_HOST);
		// 端口号，QQ邮箱给出了两个端口，但是另一个我一直使用不了，所以就给出这一个587
		props.put("mail.smtp.port", MAIL_SMTP_PORT);

		// 构建授权信息，用于进行SMTP进行身份验证
		Authenticator authenticator = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				// 输入发送者邮箱的地址和密码
				return new PasswordAuthentication(MAIL_USER, MAIL_PASSWORD);
			}
		};
		// 使用环境属性和授权信息，创建邮件会话
		Session mailSession = Session.getInstance(props, authenticator);
		// 创建邮件消息
		MimeMessage message = new MimeMessage(mailSession);
		// 设置发件人
		InternetAddress form = new InternetAddress(MAIL_USER);
		message.setFrom(form);

		// 设置收件人的邮箱
		InternetAddress to = new InternetAddress(address);
		message.setRecipient(RecipientType.TO, to);

		// 设置邮件标题
		message.setSubject(title);

		// 设置邮件的内容体
		message.setContent(content, "text/html;charset=UTF-8");

		// 最后当然就是发送邮件啦
		Transport.send(message);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private static String MAIL_USER = "306529917@qq.com";
	private static String MAIL_PASSWORD = "epxyrxogkporcbbh";

}