<%@page import="com.yc.damai.biz.LotteryBiz"%>
<%@page import="com.yc.damai.bean.Lottery"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理上传请求</title>
</head>
<body>
	<%
		//创建文件上传对象
		SmartUpload su = new SmartUpload();
		//初始化，传入页面上下文对象
		su.initialize(pageContext);
		//设置上传配置信息
		//限定文件名后缀
		su.setAllowedFilesList("txt");
		//限定大小
		su.setMaxFileSize(1024 * 1024 * 10);
		//执行上传
		su.upload();
		Files files = su.getFiles();
		List<String> fileList = new ArrayList<String>();

		String filename = null;//文件名
		String diskPath = null;//磁盘路径
		String realName = null;//文件路径
		for (int i = 0; i < files.getCount(); i++) {
			//为防止上传的文件名重复，将文件名修改为唯一
			//获取系统当前时间
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			Date date = new Date();
			filename = df.format(date);
			//使用application web路径转换成磁盘路径
			diskPath = application.getRealPath("/upload");
			files.getFile(i).saveAs(diskPath + "/" + filename);
			realName = diskPath + "/" + filename;
			//将文件真实路径添加到list集合中
			fileList.add(realName);
		}
		File file = null;
		BufferedReader br;
		InputStreamReader reader;
		String s = null;//读取txt文件的数据并保存到该字符串中
		List<String[]> listS = new ArrayList<String[]>(); //将存的元素的数组添加到集合中
		String[] params = null;//存储一条数据中的所有元素
		for (String f : fileList) {
			file = new File(f);//创建文件对象
			try {
				//注意txt的文本格式 ，如果为utf—8则需要修改文本格式
				reader = new InputStreamReader(new FileInputStream(file));
				br = new BufferedReader(reader);
				//从文件中读取数据并存入数据库中
				//从文本中一行一行的读取
				while ((s = br.readLine()) != null) {
					params = s.split("\\s+");
					listS.add(params);
				}
				//关闭流
				br.close();
				reader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//listS中存储所有文件的所有数据
		String msg = null;//提示信息
		Lottery lottery = null;
		List<Lottery> list = new ArrayList<Lottery>();
		//遍历集合将数据从数组中取出存入lottery实体类对象中，并存入集合中
		for (String[] string : listS) {
			//如果数组长度不等于12 则为垃圾数据，不需要存入数据库
			if (string.length == 12) {
				lottery = new Lottery();
				lottery.setOpendate(string[0]);
				lottery.setNum(string[1]);
				lottery.setRedone(string[2]);
				lottery.setRedtwo(string[3]);
				lottery.setRedthree(string[4]);
				lottery.setRedfour(string[5]);
				lottery.setRedfive(string[6]);
				lottery.setRedsix(string[7]);
				lottery.setBlue(string[8]);
				lottery.setSale(string[9]);
				lottery.setFirstprize(string[10]);
				lottery.setSecondeprize(string[11]);
				list.add(lottery);
			}
		}
		//遍历集合将数据存储进数据库
		LotteryBiz biz = null;//操作Lottery表的事件数组
		long num = 0;
		if(list.size() != 0){
			for (int i = 0; i < list.size(); i++) {
				biz = new LotteryBiz();
				num = biz.add(list.get(i));
				if (num < 0) {
					msg = "文件上传失败！！！";
					pageContext.setAttribute("msg", msg);
					return;
				}
			}
			msg = "文件上传成功！！！";
			pageContext.setAttribute("msg", msg);
		}else{
			msg = "文件上传失败！！！";
			pageContext.setAttribute("msg", msg);
		}
	%>
	<b>${msg}</b>
	<br>
	<input type="button" value="返回"
		onclick="window.location.href = 'index.jsp'" />
</body>
</html>