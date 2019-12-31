package com.yc.http.tomcat.v3;

import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map.Entry;

public class HttpServletResponse {
	
	private HashMap<String, String> headerMap = new HashMap<>();
	private int status;
	private String statusMsg;
	private HttpServletRequest request;
	private OutputStream out;
	
	public HttpServletResponse(HttpServletRequest request, OutputStream out) {
		this.request = request;
		this.out = out;
	}
	
	public void setHeader(String key, String value){
		headerMap.put(key, value);
	}
	
	public void setStatus(int status, String statusMsg){
		this.status=status;
		this.statusMsg = statusMsg;
	}
	
	// 提交,根据请求的页面路径，返回页面的内容
	public void commit() throws IOException{
		// 响应头行
		out.write(("HTTP/1.1 "+status+" "+statusMsg+"\n").getBytes());
		// 响应头域
		// Context-Type 返回的类型必须按照http协议标准返回
		
		String contextType = getContextType(request.getRequestURI());
		
		out.write(("Context-Type: "+contextType+"\n").getBytes());
		
		// 遍历map集合，将集合中的 键值对 输出到 头域中
		for( Entry<String,String> e : headerMap.entrySet() ){
			out.write((e.getKey()+": "+e.getValue()+"\n").getBytes());
		}
		
		// 空行 CRLF
		out.write("\n".getBytes());
		// 响应实体
		// out.write("<html><body>hello world！</body></html>".getBytes());
		
		File file;
		if(status == 404){
			file = new File(Server.WEBAPPS + "/photo/404.html");
		} else {
			// 判断 caw 流中是否有数据
			String data = caw.toString();
			if(data.length() > 0){
				out.write(data.getBytes());
			} else {
				String filepath = Server.WEBAPPS + request.getRequestURI();
				file = new File(filepath);
				FileInputStream fos = new FileInputStream(file);
				byte[] buffer = new byte[1024];
				int count;
				while ((count = fos.read(buffer)) > 0) {
					out.write(buffer, 0, count);
				}
				fos.close();
			}
		}
	}

	
	private static String getContextType(String srcpath) {
		int beginIndex = srcpath.lastIndexOf(".");
		String suffix = srcpath.substring(beginIndex);
		switch (suffix) {
		case ".css":
			return "text/css";
		case ".js":
			return "application/javascript";
		case ".jpg":
			return "image/jpeg";
		case ".gif":
			return "image/gif";
		case ".png":
			return "image/png";
		}
		return "text/html";
	}

	// 临时保存 数据的 流
	private CharArrayWriter caw = new CharArrayWriter();
	private PrintWriter pw = new PrintWriter(caw);
	public PrintWriter getWriter() {
		return pw;
	}

	public int getStatus() {
		return status;
	}

}
