package com.yc.easyweb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.Book;
import com.yc.easyweb.bean.Bought;
import com.yc.easyweb.bean.Eorderitem;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.bean.Result;
import com.yc.easyweb.bean.User;
import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.biz.BookBiz;
import com.yc.easyweb.biz.EorderitemBiz;

public class EorderitemServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private EorderitemBiz eBiz = new EorderitemBiz();
	private BookBiz bookBiz = new BookBiz();
	private Gson gson = new Gson();
	private Result result;

	// 删除
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		Eorderitem eorderitem = new Eorderitem();
		HttpSession session = request.getSession();
		String itemid = request.getParameter("itemid");
		try {
			if (itemid != null && !itemid.isEmpty()) {
				eorderitem.setItemid(itemid);
			} else {
				result = Result.failure("未选择购物车商品！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			int code = eBiz.delete(eorderitem);
			if (code > 1) {
				result = Result.success("删除成功！！！");
				//数据刷新
				User userOld = (User) session.getAttribute("loginedUser");
				Bought bou = new Bought();
				bou.setUid(userOld.getUid());
				bou.setCartstate(1);
				Page<Bought> Page = eBiz.ePage(1, 6, bou);
				session.setAttribute("cartPage", Page);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("删除失败！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
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
		} catch (SQLException e) {
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

	// 用户添加购物信息
	public void add(HttpServletRequest request, HttpServletResponse response) {
		Eorderitem eod = new Eorderitem();
		HttpSession session = request.getSession();
		try {
			Book bookOld;
			if (request.getParameter("bid") != null && !request.getParameter("bid").isEmpty()) {
				eod.setBid(Long.parseLong(request.getParameter("bid")));
				BookBiz biz = new BookBiz();
				Book book = new Book();
				book.setBid(Long.parseLong(request.getParameter("bid")));
				book.setBstate(1);
				bookOld = biz.selectSingle(book);
				if (bookOld != null) {
					eod.setTotal(bookOld.getBprice());
				} else {
					result = Result.lack("该本书已被下架或删除！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			} else {
				result = Result.lack("请选择书籍！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			User userOld = null;
			if (request.getSession().getAttribute("loginedUser") != null) {
				userOld = (User) request.getSession().getAttribute("loginedUser");
				if (userOld.getUid() != 0) {
					eod.setUid(userOld.getUid());
				} else {
					result = Result.lack("请先登录！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			} else {
				result = Result.lack("请先登录！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 获取系统时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			eod.setCarttime(df.format(date));
			// 生成订单号
			String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
			eod.setItemid(uuid);
			eod.setCount(1);
			int i = eBiz.insert(eod);
			if (i > 0) {
				result = Result.success("添加成功！！！");
				//会话还原
				Map<String, String> map = new HashMap<String, String>();
				session.setAttribute("customerOrderAdd", map);
				Bought eo = new Bought();
				session.setAttribute("userOrderAddItem", eo);
				//数据刷新
				// 购物车信息显示
				Bought bought = new Bought();
				bought.setUid(userOld.getUid());
				bought.setCartstate(1);
				Page<Bought> pageCart = eBiz.ePage(1, 6, bought);
				session.setAttribute("cartPage", pageCart);
				bought.setCartstate(2);
				List<Bought> listEo = eBiz.selectAllCart(bought);
				session.setAttribute("userCart", listEo);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			} else {
				result = Result.failure("添加失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
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

	// 查询购物车数据
	public void query(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String pageParam = request.getParameter("page");
		int ipage = pageParam == null ? 1 : Integer.parseInt(pageParam);
		// 每页行数
		int rows = 5;
		User userOld = (User) session.getAttribute("loginedUser");
		Bought bou = new Bought();
		bou.setUid(userOld.getUid());
		bou.setCartstate(1);
		try {
			Page<Bought> Page = eBiz.ePage(ipage, rows, bou);
			session.setAttribute("cartPage", Page);
			if (Page.getData().size() == 0) {
				result = Result.failure("暂无数据！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("查询成功！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
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
		} catch (BizException e) {
			result = Result.error(e.getMessage());
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		}
	}

	// 更新
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String itemid = request.getParameter("itemid");
		String count = request.getParameter("count");
		Eorderitem eoNew = new Eorderitem();
		Eorderitem eoOld = new Eorderitem();
		HttpSession session = request.getSession();
		try {
			if (itemid != null && !itemid.isEmpty() && count != null && !count.isEmpty()) {
				Eorderitem eorderitem = new Eorderitem();
				eorderitem.setItemid(itemid);
				Eorderitem eoSelect = eBiz.selectSingle(eorderitem);
				if(eoSelect.getBid() == 0){
					result = Result.failure("订单找不到或不存在！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				Book book = new Book();
				book.setBid(eoSelect.getBid());
				Book book2 = bookBiz.selectSingle(book);
				double  total = book2.getBprice() * Double.parseDouble(count);
				eoNew.setTotal(total);
				eoNew.setCount(Integer.parseInt(count));
				eoOld.setItemid(itemid);
				int code = eBiz.update(eoNew, eoOld);
				if (code > 0) {
					DecimalFormat df = new DecimalFormat("#.00");
					result = Result.success("修改成功！！！", df.format(total));
					//数据刷新
					User userOld = (User) session.getAttribute("loginedUser");
					Bought bou = new Bought();
					bou.setUid(userOld.getUid());
					bou.setCartstate(1);
					Page<Bought> Page = eBiz.ePage(1, 6, bou);
					session.setAttribute("cartPage", Page);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.failure("修改失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("修改的数据未填写！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
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

	// 将要下单的购物车id加入会话中
	public void buyBook(HttpServletRequest request, HttpServletResponse response) {
		String itemid = request.getParameter("itemid");
		HttpSession session = request.getSession();
		Bought eo;
		try {
			if (itemid != null && !itemid.isEmpty()) {
				User userOld = (User) session.getAttribute("loginedUser");
				Bought bought = new Bought();
				bought.setItemid(itemid);
				 eo = eBiz.selectSingleCart(bought);
				if(eo.getUid() != userOld.getUid()){
					result = Result.failure("该购物车商品不存在！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				}
				result = Result.success("查询成功！！！");
				Map<String, String> map = new HashMap<String, String>();
				map.put("bname", eo.getBname());
				map.put("bprice", eo.getBprice()+"");
				map.put("total", eo.getTotal()+"");
				map.put("bimg", eo.getBimg());
				map.put("count", eo.getCount()+"");
				session.setAttribute("customerOrderAdd", map);
				session.setAttribute("userOrderAddItem", eo);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			result = Result.failure("未指定购物车商品！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return ;
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
		} catch (BizException e) {
			result = Result.error(e.getMessage());
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		}
	}
}
