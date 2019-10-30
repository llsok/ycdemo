package com.yc.damai.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.damai.util.DBHelper;

/**
 * Servlet 的参数配置
 *
 *
 *	Servlet 提供的 getInitParameter() 获取配置参数方法
 *
 *	用户只能在  8 ~ 22 点之间登录系统   企业项目   12306
 *
 *	设置一个时间 参数，限制用户的登录
 *
 *
 *	The servlets named [登录的servlet] and 
 *	[com.yc.damai.servlet.LoginServlet] are both mapped to 
 *	the url-pattern [/dologin.s] which is not permitted
 *
 *	1、以注解方式定义的Servlet 名字默认为类路径
 *	2、注解配置单的 Servlet 和 web.xml配置的Servlet 可以共存
 *	3、所有的servlet 的路径必须 全局唯一
 *
 */

// @WebServlet("/dologin1.s") // 替换成 web.xml配置
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.getSession();
		
		
		String beginTimeParam = this.getInitParameter("begin-time");
		String endTimeParam = this.getInitParameter("end-time");
		
		int beginTime = Integer.parseInt(beginTimeParam);
		int endTime = Integer.parseInt(endTimeParam);
		
		// 获取当前时间 小时
		java.util.Calendar c = java.util.Calendar.getInstance();
		int hour = c.get(java.util.Calendar.HOUR_OF_DAY);
		
		if(hour < beginTime || hour > endTime){
			request.setAttribute("msg", "没上班！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		// 设置请求对象的字符集编码，可以兼容中文参数，避免乱码问题
		request.setCharacterEncoding("utf-8");
		// 接收 用户名 和 密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sql = "select * from user where username=? and password=?";
		Map<String, Object> user = DBHelper.selectOne(sql, username, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginedUser", user);
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("msg", "用户名或密码错误！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 绝大多数请求下， get 请求和 post 执行的业务逻辑是一致的
		doGet(request, response);  // 必须有
		
		//doXXX 方法中的 super。。。 必须删除
		// 父类 的 doPost 只有一行代码   throw new ServletException（405，"HTTP method POST is not supported by this URL"）;
		//super.doPost(request, response);
		
	}

}
