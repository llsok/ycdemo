package com.yc.download;

import java.io.*;
import java.net.*;

public class Download {

	/**
	 * 定义下载属性
	 */
	private int blockSize = 1024 * 1024; // 文件分区的大小
	private int threadSize = 3; // 线程的数量
	private String filePath = "d:/"; // 文件存放的路径
	// 定义当前运行的线程数
	private Integer runThreadCount = 0;
	
	/**
	 * 分块下载
	 * 
	 * @param urlstr 地址
	 * @param index  块数
	 * @param size   块的大小
	 */
	public void downloadBlock(String urlstr, int index) {
		InputStream in = null;
		FileOutputStream fos = null;
		try {
			URL url = new URL(urlstr); // 全局资源定位器对象
			URLConnection conn = url.openConnection(); // 打开连接 返回实际类型是：HttpURLConnection

			/**
			 * 获取文件实际大小
			 */
			long fileSize = conn.getContentLengthLong();

			in = conn.getInputStream(); // 获取输入流

			// 获取文件名
			String filename = url.getFile().substring(url.getFile().lastIndexOf("/") + 1);

			// 将下载的资源保存成文件
			fos = new FileOutputStream(filePath + filename + "." + index);

			/**
			 * 计算开始下载的起止位置
			 */
			long begin = index * blockSize;
			long end = begin + blockSize;
			// 根据文件实际大小修正 end
			if (end > fileSize) {
				end = fileSize;
			}
			long current = begin; // 记录当前的下载的进度

			/**
			 * 将输入流跳过N个字节
			 */
			in.skip(begin);

			byte[] buffer = new byte[1024];
			int count;
			while ((count = in.read(buffer)) > -1) {
				// 临时进度字节数
				long tmpCurrent = current;
				// 加上当前的进度
				tmpCurrent += count;

				if (tmpCurrent <= end) {
					fos.write(buffer, 0, count);
					current += count;
				} else {
					// 计算最后一块的大小， 这是跨分界线的情况
					int tmpSize = (int) (end - current);
					fos.write(buffer, 0, tmpSize);
					break;
				}
			}
			System.out.println(filename + " 第" + (index + 1) + "块下载完成");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fos != null)
					fos.close();
				if (in != null)
					in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}

	/**
	 * 下载文件
	 * 
	 * @param urlstr
	 */
	public void downloadFile(String urlstr) {
		try {
			URL url = new URL(urlstr);
			long fileSize = url.openConnection().getContentLengthLong();
			int blockNumber = (int) (fileSize / blockSize);
			if (fileSize % blockSize != 0) {
				blockNumber++;
			}

			/**
			 * 开启多线程下载
			 */
			for (int i = 0; i < blockNumber; i++) {
				int index = i;
				new Thread() {
					public void run() {
						downloadBlock(urlstr, index);
						finish();
					}
				}.start();
				
				// 一定锁定 Download 对象
				synchronized (this) {
					// 运行的线程数加一
					runThreadCount += 1;
					// 判断线程数是否超过设定值
					if (runThreadCount >= threadSize) {
						// 等待
						try {
							wait();
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 拼接文件
	 * 
	 * @param urlstr
	 */
	public void mergeFile(String urlstr) {
		try {
			URL url = new URL(urlstr);
			long fileSize = url.openConnection().getContentLengthLong();
			int blockNumber = (int) (fileSize / blockSize);
			if (fileSize % blockSize != 0) {
				blockNumber++;
			}
			String filename = url.getFile().substring(url.getFile().lastIndexOf("/") + 1);
			FileOutputStream fos = new FileOutputStream(filePath + filename);
			for (int i = 0; i < blockNumber; i++) {
				FileInputStream fis = new FileInputStream(filePath + filename + "." + i);
				byte[] buffer = new byte[1024];
				int count;
				while ((count = fis.read(buffer)) > -1) {
					fos.write(buffer, 0, count);
				}
				fis.close();
			}
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 下载完成
	 */
	public void finish() {
		synchronized (this) {
			// 线程数减一
			runThreadCount --;
			notify();
		}
	}

	public static void main(String[] args) throws IOException {
		String urlstr = "http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.zip";

		Download d = new Download();

		d.downloadFile(urlstr);

		/**
		 * 作业题： 1，如何限制下载进程数 2，如果在现在完成之后，自动合并，删除临时文件 3，实现进度显示：进度条，百分数：10%
		 * 4，实现断点续传，关闭程序后，下次可以继续下载 5，列表下载，依次下载多个文件
		 */

		/*
		 * String urlstr =
		 * "http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.zip";
		 * 
		 * URL url = new URL(urlstr); // 全局资源定位器对象
		 * 
		 * URLConnection conn = url.openConnection(); // 打开连接 返回实际类型是：HttpURLConnection
		 * 
		 * // 1\ MalformedURLException 子异常 2\IOException 父异常
		 * 
		 * InputStream in = conn.getInputStream(); // 获取输入流
		 * 
		 * // 将下载的资源保存成文件 FileOutputStream fos = new
		 * FileOutputStream("d:/apache-tomcat-8.5.50.zip");
		 * 
		 * byte[] buffer = new byte[1024];
		 * 
		 * int count;
		 * 
		 * while ((count = in.read(buffer)) > -1) { fos.write(buffer, 0, count); }
		 * 
		 * fos.close();
		 * 
		 * in.close();
		 */

	}

}
