package com.yc.damai.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.yc.damai.bean.Result;
import com.yc.damai.bean.User;
import com.yc.damai.biz.BizException;
import com.yc.damai.biz.UserBiz;
import com.yc.damai.util.DBHelper;

@WebServlet("/doreg.s")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserBiz biz = new UserBiz();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		// 数据装载
		User user = new User();
		try {
			// 设置请求参数到 user 对象中
			BeanUtils.populate(user, request.getParameterMap());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		Result result;
		try {
			biz.reg(user, request.getParameter("repassword"));
			// 返回一个复杂的数据结构
			result = Result.success("注册成功！");
		} catch (BizException e) {
			e.printStackTrace();
			result = Result.failure(e.getMessage());
		}
		
		// 讲 result 转成  json 字符串
		Gson gson = new Gson();
		String json = gson.toJson(result);
		response.getWriter().print(json);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
