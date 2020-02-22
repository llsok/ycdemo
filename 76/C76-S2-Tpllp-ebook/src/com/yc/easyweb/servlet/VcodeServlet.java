package com.yc.easyweb.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public  class VcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		 try {	
			 request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String testcode = "" ;
			// BufferedImage 的构造函数可以设置图片的大小
			BufferedImage image = new BufferedImage(120, 50, BufferedImage.TYPE_INT_RGB);// 这里设置图片的大小
			// 这里需要使用到java.awt.Graphics来绘制图片
			Graphics graphics = image.getGraphics();
			Color color = new Color(25, 25, 25);
			graphics.setColor(color);// 为图片添加的底色
			graphics.fillRect(0, 0, 120,50);
			char[] content = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
			Random random = new Random();
			int index;
			//验证码的大小
			Font font = new Font("Microsoft YaHei UI", 120,20);
			for (int i = 0; i < 4; i++) {// 验证码长度
				index = random.nextInt(content.length);
				testcode += String.valueOf(content[index]);// testcode是验证码
				// 图片中文字的颜色
				graphics.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
				// 图中文字大小
				graphics.setFont(font);
				// 图片中文字的位置
				graphics.drawString(content[index] + "", 2 + 25 * i, 25 + 3 * random.nextInt(4));
				// 1,验证码文字,2文字距离上边的距离3,距离下部分的距离,可以更改这后面的两个数据,来改变图片的,验证码显示位置
				// System.out.println(graphics.getFontMetrics());获取当前字体规格
			}
			request.getSession().setAttribute("vcode", testcode);
			ImageIO.write(image, "jpg", response.getOutputStream());
			} catch (IOException e) {
				throw new RuntimeException();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}

}
