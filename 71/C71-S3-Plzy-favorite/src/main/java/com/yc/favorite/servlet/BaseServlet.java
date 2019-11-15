package com.yc.favorite.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * �Զ���Servlet ����
 * @author LiuZiyuan
 *
 */
public abstract class BaseServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String op=req.getParameter("op");
		/**
		 * �ڸ���ͨ��op�ֶε�������ķ�����Java�ĺڿƼ���������
		 * Class����࣬���Զ�̬�ĵ��÷�������ȡ����?
		 */
		try {
			Method method = this.getClass().getMethod(op, HttpServletRequest.class,HttpServletResponse.class);
			//ִ�з���
			method.invoke(this, req,resp);
		} catch (Exception e) {
			throw new ServletException("��̬���÷���ʧ�ܣ�"+op ,e);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
	
	
}
