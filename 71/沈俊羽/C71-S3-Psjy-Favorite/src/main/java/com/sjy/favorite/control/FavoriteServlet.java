package com.sjy.favorite.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.sjy.favorite.bean.Favorite;
import com.sjy.favorite.biz.FavoriteBiz;
import com.sjy.favorite.dao.FavoriteMapper;
import com.sjy.favorite.util.MyBatisHelper;

@WebServlet("/favorite.action")
public class FavoriteServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
	private SqlSession sess = MyBatisHelper.getSession();
	private FavoriteMapper fm = sess.getMapper(FavoriteMapper.class);
	private Gson gson=new Gson();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String op=request.getParameter("op");
		if(op.equals("findAll")) {
			doFindAll(request,response);
		}else if(op.equals("findByName")) {
			doFindByName(request,response);
		}else if(op.equals("findBynotTagName")) {
			doFineByNotTagName(request,response);
		}else if(op.equals("add")) {
			doAdd(request,response);
		}
	}

	private void doAdd(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String fLabel=request.getParameter("fLabel");
		String fUrl=request.getParameter("fUrl");
		String fTags=request.getParameter("fTags");
		String fDesc=request.getParameter("fDesc");
		Favorite f=new Favorite();
		f.setfLabel(fLabel);
		f.setfTags(fTags);
		f.setfUrl(fUrl);
		f.setfDesc(fDesc);
		FavoriteBiz fbiz=new FavoriteBiz();
		int result= fbiz.addFavorite(f);
		
		String str=gson.toJson(result);
		response.getWriter().print(str);
	}

	private void doFineByNotTagName(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<Favorite> fList= fm.selectBynotTagName();
		String str=gson.toJson(fList);
		response.getWriter().print(str);
	}

	private void doFindByName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tName=request.getParameter("fTags");
		List<Favorite> fList= fm.selectByTagName(tName);
		String str=gson.toJson(fList);
		response.getWriter().print(str);
	}

	private void doFindAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Favorite> fList= fm.selectAll();
		System.out.println(fList);
		String str=gson.toJson(fList);
		response.getWriter().print(str);
	}
	
	

	
}
