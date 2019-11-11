package com.sjy.favorite.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sjy.favorite.bean.Tag;
import com.sjy.favorite.dao.TagMapper;
import com.sjy.favorite.util.HibernateProxyTypeAdapter;
import com.sjy.favorite.util.MyBatisHelper;

@WebServlet("/tag.action")
public class TagServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
	private SqlSession sess = MyBatisHelper.getSession();
	private TagMapper tm = sess.getMapper(TagMapper.class);
	private Gson gson=new Gson();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String op = request.getParameter("op");
		if (op.equals("findAll")) {
			doFindAll(request, response);
		}else if(op.equals("toCloud")) {
			doToCloud(request,response);
		}
	}

	private void doToCloud(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doFindAll(request,response);
	}

	private void doFindAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Tag> tList = tm.selectAll();
		String str=gson.toJson(tList);
		response.getWriter().print(str);
	}

}
