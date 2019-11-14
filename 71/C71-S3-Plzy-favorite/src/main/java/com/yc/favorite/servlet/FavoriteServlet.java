package com.yc.favorite.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.yc.favorite.bean.Favorite;
import com.yc.favorite.bean.Tag;
import com.yc.favorite.dao.FavoriteMapper;
import com.yc.favorite.dao.TagMapper;
import com.yc.favorite.util.MyBatisHelper;

@WebServlet("/fav.s")
public class FavoriteServlet extends BaseServlet implements Servlet {
	private static final long serialVersionUID = 1L;
	private SqlSession sess = MyBatisHelper.getSession();
	private TagMapper tm = sess.getMapper(TagMapper.class);
	private FavoriteMapper fm = sess.getMapper(FavoriteMapper.class);

	public void selectAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String json = null;
		List<Tag> tagList = tm.selectAll();
		json = new Gson().toJson(tagList);
		response.getWriter().append(json);
	}

	public void selectByTagName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String tName = request.getParameter("tName");
		String json = null;
		List<Favorite> favoriteList = fm.selectByTagName(tName);
		json=new Gson().toJson(favoriteList);
		response.getWriter().append(json);
	}

	public void  selectAllFavs(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String json = null;
		List<Favorite> favoriteList = fm.selectAll();
		json=new Gson().toJson(favoriteList);
		response.getWriter().append(json);
	}
	
	public void selectByNotClassified(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String json=null;
		List<Favorite> favoriteList=fm.selectByNotClassified();
		json=new Gson().toJson(favoriteList);
		response.getWriter().append(json);
	}
	
	public void toCloud(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String json=null;
		List<Tag>tagList=tm.orderBytCount();
		String str=null;
		str=new Gson().toJson(tagList);
		int max=tm.maxTags();
		json= "{max:"+max+",list:"+str+"}";
		response.getWriter().append(json);
	}
	
	public void insertFav(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String fLabel=request.getParameter("fLabel");
		String fUrl=request.getParameter("fUrl");
		String fTags=request.getParameter("fTags");
		String fDesc=request.getParameter("fDesc");
		//·Ö¸îfTags
		String [] tags=fTags.split("[,£¬]");
		String json = null;
		Favorite f=new Favorite();
		f.setfLabel(fLabel);
		f.setfUrl(fUrl);
		f.setfDesc(fDesc);
		f.setfTags(fTags);
		try {
			for(String tag : tags) {
				if(tm.update(tag)==0) {
					Tag t= new Tag();
					t.settCount(1);
					t.settName(tag);
					tm.insert(t);
				}
			}
			fm.insert(f);
			sess.commit();
			json="{code: 1}";
		}catch( Exception e) {
			e.printStackTrace();
		}finally {
			json=new Gson().toJson(json);
			response.getWriter().append(json);
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
