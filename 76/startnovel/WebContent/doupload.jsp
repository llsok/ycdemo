<%@page import="com.google.common.collect.Sets.SetView"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.yc.novel.bean.*"%>
<%@page import="com.google.common.collect.*"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="com.yc.novel.biz.NovelBiz"%>
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
		//设置字符集
		su.setCharset("UTF-8");
		//限定文件名后缀
		su.setAllowedFilesList("txt");
		//限定大小
		su.setMaxFileSize(1024 * 1024 * 1024 * 10);
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
		//由于txt文件不是纯文本的文件 ，需要使用字节流操作文件
		BufferedReader br;
		InputStreamReader reader;
		String s = null;//读取txt文件的数据并保存到该字符串中
		
		//将存的元素的数组添加到HashSet集合中,防止添加相同元素
		//将上传的数据进行第一次去重
		HashSet<String[]> paramSet = new HashSet<String[]>();
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
					paramSet.add(params);
				}
				//关闭流
				br.close();
				reader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//paramSet中存储所有文件的所有不重复的数据
		Novel novel = null;
		NovelBiz biz = new NovelBiz();//操作Novel表的事件数组
		
		//利用了google提供的 guava 包来完成差集运算.(只能进行set集合的运算)
		//1.将数据库的数据查询出来并存入集合中
		List<Novel> listSql = biz.selectAll(novel);
		//2.将从数据库中得到的数据存入hashset集合中
		HashSet<Novel> setSql = Sets.newHashSet();
		for (Novel nSql : listSql) {
			setSql.add(nSql);
		}
		//3.将paramSet集合中的string[]类型 转为Novel实体类
		List<Novel> listParam = new ArrayList<Novel>();
		for (String[] pss : paramSet) {
			//如果元素个数不等于五个则不存入数据库
			if (pss.length == 6) {
				novel = new Novel();
				novel.setNname(pss[1]);
				novel.setNtype(pss[0]);
				novel.setClickNum(pss[2]);
				novel.setDateStr(pss[3]+" "+pss[4]);
				novel.setAuthor(pss[5]);
				listParam.add(novel);//存入listParam集合中
			}
		}
		//System.out.println("listParam:"+listParam.size());
		//4.两层for循环  判断listParam的数据是否有重复的(类型 ，书名和作者相同)第二次去重
		for (int i = 0; i < listParam.size(); i++) {
			for (int j = i + 1; j < listParam.size(); j++) {
				if (listParam.get(i).hashCode() == listParam.get(j).hashCode()
						&& listParam.get(i).equals(listParam.get(j))) {
					listParam.remove(i);//将相同的元素移出
					//此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
					j--;
				}
			}
		}
		//5.将从文件中得到的数据存入hashset集合中
		HashSet<Novel> setParam = Sets.newHashSet();
		for (Novel paramTxt : listParam) {
			setParam.add(paramTxt);
		}
		//5.用Sets的difference(s1,s2)求两集合的差集 s1:上传的数据  s2：数据库的数据
		//diffSet保存第三次去重的数据,此时数据基本没有重复的
		SetView<Novel> diffSet = Sets.difference(setParam, setSql);
		//System.out.println("diffSet:"+diffSet.size());
		//将diffSet存入数据库
		String msg = null;//提示信息
		int num = -1;//保存返回值
		//遍历集合将数据存储进数据库
		if (diffSet.size() != 0) {
			System.out.println("tianjai ");
			Novel novelCheck = null; 
			List<Novel> listCheck =null;
			for(Novel index : diffSet){
				//判断是新增数据还是更新数据
				novelCheck = new Novel();//存储条件
				novelCheck.setAuthor(index.getAuthor());
				novelCheck.setNname(index.getNname());
				novelCheck.setNtype(index.getNtype());
				listCheck = biz.selectAll(novelCheck);
				if(!listCheck.isEmpty()){
					//不为空则为更新
					num = biz.update(index);
				}else{
					//为空则为新增
					num = biz.insert(index);
				}
				if (num < 0) {
					msg = "文件上传失败！！！";
					pageContext.setAttribute("msg", msg);
					return;
				}
			}
			System.out.println("mei tianjia  ");
			msg = "文件上传成功！！！";
			pageContext.setAttribute("msg", msg);
		}else{  
			msg = "文件内容重复";
			pageContext.setAttribute("msg", msg);
		}
	%>
	<b>${msg}</b>
	<br>
	<input type="button" value="返回"
		onclick="window.location.href = 'index.jsp'" />
</body>
</html>