package com.yc.net.http.v2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

public class HttpServletResponse {
	
	// web.xml 解析器
	private static WebXmlParser webXmlParser = new WebXmlParser("web.xml");
	
	private HttpServletRequest request;
	private OutputStream out;
	
	public HttpServletResponse(HttpServletRequest request, OutputStream out) {
		super();
		this.request = request;
		this.out = out;
	}


	/*response.setContentType("?????");  // 设置响应类型
	response.setStatus(404,""); // 设置结果码
*/	
	// 提交方法
	public void commit() throws IOException{
		
		String suffix = request.getRequestURL().substring(
					request.getRequestURL().lastIndexOf(".")+1);
		
		// 从 web.xml 文件中取 contentType， 替代之前的硬编码判断
		String contentType = webXmlParser.getContentType(suffix);
		
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
		
		byte[] buf = new byte[1024];
		int count;
		// 向浏览器发送报文
		while((count = fis.read(buf))>0){
			out.write(buf, 0, count);
		}
		fis.close();
		
	}

}
