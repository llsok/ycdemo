package com.yc.easyweb.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.Notice;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.bean.Result;
import com.yc.easyweb.bean.User;
import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.biz.NoticeBiz;

public class NoticeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private NoticeBiz noticeBiz = new NoticeBiz();
	private  Gson gson = new Gson();
	private Result result ;
	//查询
	public void  query(HttpServletRequest request, HttpServletResponse response){
		// 公告展示
		HttpSession session = request.getSession();
		User userOld = (User) session.getAttribute("loginedUser");
		Notice notice = new Notice();
		notice.setNstate(1);
		try {
			//公告分页查询
			String page = request.getParameter("page");
			String nid = request.getParameter("nid");
			//查询公告详情
			if(nid != null && !nid.isEmpty()){
				notice.setNid(Long.parseLong(nid));
				Notice notice2 = noticeBiz.selectSingle(notice);
				if(notice2.getNid() != 0){
					session.setAttribute("noticeDetail", notice2);
					if(userOld.getUtype() != 1 && userOld.getUtype() != 5){
						Notice noticeNew = new Notice();
						long num = notice2.getNnumber() + Long.parseLong("1");
						noticeNew.setNnumber(num);
						noticeBiz.update(notice2,noticeNew );
					}
					result = Result.success("查询成功！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				}else{
					result = Result.failure("查询失败！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				}
			}else{
				int iPage;
				if(page != null && !page.isEmpty()){
					iPage = Integer.parseInt(page);
				}else{
					iPage = 1 ;
				}
				Page<Notice> sPage = noticeBiz.noticePage(iPage, 3, notice);
				if(sPage.getData().size() == 0){
					result = Result.failure("暂无数据！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				}else{
					session.setAttribute("noticePage", sPage);
					result = Result.success("查询成功！！！");
					String json1 = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json1);
					return ;
				}
			}
		} catch (BizException e) {
			result = Result.error(e.getMessage());
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}			
			e.printStackTrace();
		}
	}
}
