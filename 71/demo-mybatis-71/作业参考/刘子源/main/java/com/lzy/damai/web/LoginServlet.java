package com.lzy.damai.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.lzy.damai.bean.User;
import com.lzy.damai.dao.MyBatisHelper;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.s")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String pwd=request.getParameter("password");
		String json=null;
		//dao查询
		SqlSession sess = MyBatisHelper.getSession();
		User u=new User();
		u.setUsername(username);
		u.setPassword(pwd);
		List<User> list =sess.selectList("com.lzy.damai.dao.UserMapper.login",u);
		if(list.size()>0) {
			json= "{code:1,username:"+username+"}";
		}else {
			json="{code:-1}";
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append(json);
	}
}
