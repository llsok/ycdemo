package com.yc.damai.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.yc.damai.bean.Product;
import com.yc.damai.bean.Result;
import com.yc.damai.biz.BizException;
import com.yc.damai.biz.ProductBiz;

@WebServlet("/product.s")
public class ProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductBiz biz = new ProductBiz();
    
	/**
	 * 127.0.0.1/demo-damai-76/product.s?op=query
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void query(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		List<Product> list = biz.query();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}
	
	public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalAccessException, InvocationTargetException, ServletException, SmartUploadException{
		
		// 创建文件上传对象
		SmartUpload su = new SmartUpload();
		// 初始化，传入页面上下文对象
		su.initialize(getServletConfig(), request, response);
		// 设置上传的配置信息
		// 限定文件名后缀
		su.setAllowedFilesList("jpg,png,gif,bmp");
		// 限定大小
		su.setMaxFileSize(1024 * 1024 * 10);
		// 执行上传
		su.upload();
		
		// 判断是否有上传的文件
		String webPath = null;
		if(su.getFiles().getSize() > 0 ){
			Files files = su.getFiles();
			
			String filename = files.getFile(0).getFileName();
			
			// 使用application（应用上下文对象） web路径 转换成 磁盘路径
			// getServletContext（）  === application
			String diskPath = getServletContext().getRealPath("/products/upload");
			files.getFile(0).saveAs(diskPath+"/"+filename);
			webPath = "products/upload/" + filename;
		}
		
		Product p = new Product();
		
		// smartupload 对请求对象进行了封装
		HashMap<String,String> paramMap = new HashMap<>();
		@SuppressWarnings("unchecked")
		Enumeration<String> es = su.getRequest().getParameterNames();
		while(es.hasMoreElements()){
			String paramName = es.nextElement();
			String paramValue = su.getRequest().getParameter(paramName);
			paramMap.put(paramName, paramValue);
		}
		
		BeanUtils.populate(p, paramMap);
		if(webPath!=null){
			p.setImage(webPath);
		}
		
		Result result;
		try {
			biz.save(p);
			result = Result.success("保存商品成功！");
		} catch (BizException e) {
			e.printStackTrace();
			result = Result.success(e.getMessage());
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		// 返回json格式数据
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().append(json);
	}

}
