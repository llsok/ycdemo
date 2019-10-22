package com.yc.net.http;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class Processer {
	
	// web.xml 解析器
	private static WebXmlParser webXmlParser = new WebXmlParser("web.xml");
	
	public void process(Socket socket){
		InputStream in;
		OutputStream out;
		try {
			in = socket.getInputStream();
			out = socket.getOutputStream();
			
			// 读取请求报文内容
			byte[] buf = new byte[1024];
			int count;
			count = in.read(buf);
			String content = new String(buf, 0, count);
			System.out.println(content);
			// 解析请求报文（暂未实现）
			HttpServletRequest request = parseRequest(content);
			
			/**
			 * /index.html
			 * E:/Tomcat/webapps/photo/index.html
			 * 
			 * /images/fulls/02.jpg
			 * E:/Tomcat/webapps/photo/images/fulls/02.jpg
			 */
			
			String suffix = request.getRequestURL().substring(
						request.getRequestURL().lastIndexOf(".")+1);
			
			// 从 web.xml 文件中取 contentType， 替代之前的硬编码判断
			String contentType = webXmlParser.getContentType(suffix);
			
			/*switch(suffix){
			case "js":
				contentType = "application/x-javascript"; break;
			case "css":
				contentType = "text/css"; break;
			case "jpg":
				contentType = "image/jpeg"; break;
			case "bmp":
				contentType = "image/bmp"; break;
			case "gif":
				contentType = "image/gif"; break;
			case "png":
				contentType = "image/png"; break;
			default:
				contentType = "text/html";
			}*/
			
			
			
			String resp = "HTTP/1.1 200 OK\r\n";
			resp += "Content-Type: "+contentType+"\r\n";
			resp += "\r\n";
			out.write(resp.getBytes());
			
			
			String rootPath = "/Tomcat/webapps/photo";
			String filePath = request.getRequestURL();
			// 判断访问文件是否存在			
			String diskPath = rootPath + filePath;
			if(new File(diskPath).exists() == false){
				diskPath = rootPath + "/404.html";
			}
			
			FileInputStream fis = new FileInputStream(diskPath);
			
			// 向浏览器发送报文
			while((count = fis.read(buf))>0){
				out.write(buf, 0, count);
			}
			fis.close();
			
			// 如果访问的文件不存在，则返回 404.html
			
			// 作业，解析 tomcat/conf/web 文件，读取文件类型，然后输出对应  contentType
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			socket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 解析请求报文
		// 给于对应的响应
	}
	
	public HttpServletRequest parseRequest(String content){
		HttpServletRequest request = new HttpServletRequest(content);
		return request;
	}

}
