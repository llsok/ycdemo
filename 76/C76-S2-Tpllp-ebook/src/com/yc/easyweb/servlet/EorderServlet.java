package com.yc.easyweb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.*;
import com.yc.easyweb.biz.*;

public class EorderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private EorderitemBiz itemBiz = new EorderitemBiz();
	private EorderBiz eorderBiz = new EorderBiz();
	private BookBiz biz = new BookBiz();
	private Gson gson = new Gson();
	private Result result;

	// 删除
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		Eorder eorder;
		Eorder eorder1 = new Eorder();
		List<Eorder> list = new ArrayList<Eorder>();
		String eoid1 = request.getParameter("eoid");
		HttpSession session = request.getSession();
		try {
			// 获取eoid
			if (eoid1 != null && !eoid1.isEmpty()) {
				String[] eoid = eoid1.split("/");
				if (eoid.length == 1) {
					if (!eoid[0].isEmpty() && eoid[0] != null) {
						eorder1.setEoid(eoid[0]);
						Eorder eorder2 = eorderBiz.selectSingle(eorder1);
						if (eorder2.getEostate() != 5 && eorder2.getEostate() != 6) {
							result = Result.failure("该交易尚未完成不能删除！！！");
							String json = gson.toJson(result);
							response.setContentType("application/json;charset=UTF-8");
							response.getWriter().append(json);
							return;
						}
						int code = eorderBiz.delete(eorder1);
						if (code > 0) {
							result = Result.success("删除成功！！！");
							// 数据刷新
							Eorder eorder3 = new Eorder();
							Page<Eorder> page = eorderBiz.eorderPage(1, 5, eorder3);
							session.setAttribute("userOrderPage", page);
							
							//管理员界面数据刷新
							OrderDetial orderDetial = new OrderDetial();
							List<OrderDetial> order_show = eorderBiz.selectAllDetail(orderDetial);
							for (int i = 0; i < order_show.size(); i++) {
								if (order_show.get(i).getEostate() == 4 || order_show.get(i).getEostate() == 5
										|| order_show.get(i).getEostate() == 7) {
									order_show.remove(i);
									i--;
								}
							}
							session.setAttribute("eorderHand", order_show);
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
					}
					result = Result.failure("未选择订单，无法进行此操作！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				for (String string : eoid) {
					eorder = new Eorder();
					if (!string.isEmpty() && string != null) {
						eorder.setEoid(string);
						Eorder eorder2 = eorderBiz.selectSingle(eorder);
						if (eorder2.getEostate() != 5 && eorder2.getEostate() != 6) {
							result = Result.failure("存在交易尚未完成的订单，不能进行此操作！！！");
							String json = gson.toJson(result);
							response.setContentType("application/json;charset=UTF-8");
							response.getWriter().append(json);
							return;
						}
						list.add(eorder);
					}
				}
				if (list.size() != 0) {
					int j = eorderBiz.delete(list);
					if (j > 0) {
						result = Result.success("删除成功！！！");
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
				} else {
					result = Result.failure("未选择订单,不能进行此操作！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			}
			result = Result.failure("未选择订单,不能进行此操作！！！");
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

	// 用户订单查询
	public void queryUserOrder(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String pageParam = request.getParameter("page");
		int ipage = pageParam == null ? 1 : Integer.parseInt(pageParam);
		// 每页行数
		int rows = 5;
		User user = (User) session.getAttribute("loginedUser");

		Eorder eorder = new Eorder();
		if (user != null) {
			eorder.setUid(user.getUid());
		} else {
			eorder.setUid(0);
		}
		try {
			Page<Eorder> page = eorderBiz.eorderPage(ipage, rows, eorder);
			session.setAttribute("userOrderPage", page);
			if (page.getData().size() == 0) {
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

	// 用户填写订单信息展示
	public void showEorder(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BookBiz biz = new BookBiz();

		String bid = request.getParameter("bid");
		try {
			if (bid != null && !bid.isEmpty()) {
				Book book = new Book();
				book.setBid(Long.parseLong(bid));
				Book book2 = biz.selectSingle(book);
				if (book2.getBid() != 0) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("bname", book2.getBname());
					map.put("bprice", book2.getBprice() + "");
					map.put("total", book2.getBprice() + "");
					map.put("bimg", book2.getBimg());
					map.put("count", "1");
					session.setAttribute("customerOrderAdd", map);
					result = Result.success("查询成功！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				} else {
					result = Result.failure("该书籍已被删除或下架！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
				}
			} else {
				result = Result.failure("未选择书籍！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
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

	// 核对添加订单的地址
	public void checkEoaddr(HttpServletRequest request, HttpServletResponse response) {
		String reg = "^[\u4e00-\u9fa5A-Za-z0-9]{5,300}$";
		HttpSession session = request.getSession();
		String eoaddr = request.getParameter("eoaddr");
		try {
			if (eoaddr != null && !eoaddr.isEmpty()) {
				if (!eoaddr.matches(reg)) {
					result = Result.failure("输入不合法(5~100个字符或汉字)");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				// 将地址保存在会话中
				session.setAttribute("addOrderEoaddr", eoaddr);
				result = Result.success("输入合法！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("地址未输入！！！");
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
		}
	}

	// 核对添加订单的收件人
	public void checkUname(HttpServletRequest request, HttpServletResponse response) {
		String reg = "^[\u4e00-\u9fa5a-zA-Z]{2,20}$";
		HttpSession session = request.getSession();
		String uname = request.getParameter("uname");
		try {
			if (uname != null && !uname.isEmpty()) {
				if (!uname.matches(reg)) {
					result = Result.failure("输入不合法(2~10个字符或汉字)！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				// 将收件人保存在会话中
				session.setAttribute("addOrderUname", uname);
				result = Result.success("输入合法！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("收件人未输入！！！");
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
		}
	}

	// 核对添加订单的数量
	public void checkCount(HttpServletRequest request, HttpServletResponse response) {
		String reg = "^[0-9]{1,10}$";
		HttpSession session = request.getSession();
		String count = request.getParameter("count");
		String price = request.getParameter("price");
		try {
			if (count != null && !count.isEmpty()) {
				if (!count.matches(reg)) {
					result = Result.failure("输入不合法(1~10位数字)");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				double total = Double.parseDouble(price) * Double.parseDouble(count);
				DecimalFormat df = new DecimalFormat("#.00");
				session.setAttribute("addOrderCount", count);
				result = Result.success("输入合法！！！", df.format(total));
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("输入不合法(1~10位数字)");
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
		}
	}

	// 核对添加订单的电话
	public void checkUphone(HttpServletRequest request, HttpServletResponse response) {
		String reg = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
		HttpSession session = request.getSession();
		String uphone = request.getParameter("uphone");
		try {
			if (uphone != null && !uphone.isEmpty()) {
				if (!uphone.matches(reg)) {
					result = Result.failure("输入不合法(11位数字)！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				// 将电话保存在会话中
				session.setAttribute("addOrderUphone", uphone);
				result = Result.success("输入合法！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("电话未输入！！！");
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
		}
	}

	// 用户添加订单
	public void add(HttpServletRequest request, HttpServletResponse response) {
		// 订单id
		String uuidOrder = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		HttpSession session = request.getSession();
		User userOld = (User) session.getAttribute("loginedUser");
		Eorderitem eoitem = new Eorderitem();// 通过书籍添加产生的购物车信息
		Eorderitem eoReal = null;// 真实的购物车信息
		Eorder eorder = new Eorder();// 订单信息

		// 1.先从会话中获取书id或itemid
		String bid = request.getParameter("bid");
		// 2.将所有的数据获取出来
		String count = (String) session.getAttribute("addOrderCount");// request.getParameter("count");//数量
		String eoaddr = (String) session.getAttribute("addOrderEoaddr");// request.getParameter("eoaddr");//地址
		String uname = (String) session.getAttribute("addOrderUname");// request.getParameter("uname");//收货人
		String uphone = (String) session.getAttribute("addOrderUphone"); // request.getParameter("uphone");//电话

		String type = request.getParameter("payType");// 送货方式
		String payType = request.getParameter("payOption");// 支付方式
		String totalOld = request.getParameter("total");// 总价

		double total = 0;
		String sendType;
		int pay = 0;
		try {
			Bought itemOld = (Bought) session.getAttribute("userOrderAddItem");
			// 3.判断数据的合法
			String check = "1";
			// a.验证数量的输入
			if (count != null && !count.isEmpty()) {
				check = check + "/1";
			} else {
				if (request.getParameter("count") != null && !request.getParameter("count").isEmpty()) {
					count = request.getParameter("count");
					check = check + "/1";
				} else {
					check = check + "/-1";
				}
			}
			// b.验证地址的输入
			if (eoaddr != null && !eoaddr.isEmpty()) {
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			// c.验证收货人的输入
			if (uname != null && !uname.isEmpty()) {
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			// d.验证电话的输入
			if (uphone != null && !uphone.isEmpty()) {
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			if (!check.equals("1/1/1/1/1")) {
				result = Result.lack("输入信息不足！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 判断总价是否为空
			if (totalOld != null && !totalOld.isEmpty()) {
				total = Double.parseDouble(totalOld);
			} else {
				result = Result.failure("系统繁忙,请稍后再试！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 判断送货方式
			if (!type.equals("请选择")) {
				sendType = type;
			} else {
				sendType = "在线支付";
			}
			// 判断支付方式
			if (!payType.equals("请选择")) {
				pay = Integer.parseInt(payType);
			} else {
				pay = 2;
			}
			// 4.判断是通过书本下单还是购物车下单
			if (userOld == null) {
				result = Result.failure("请您先登录！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 立即购买加入的订单
			if (bid != null && !bid.isEmpty()) {
				// 查询此书是否上架
				Book checkBook = new Book();
				checkBook.setBid(Long.parseLong(bid));
				Book bookOld = biz.selectSingle(checkBook);
				if (bookOld != null && bookOld.getBstate() == 1 && bookOld.getBnum() > 0) {
					eoitem.setCount(Integer.parseInt(count));// 添加数量值
					eoitem.setTotal(total);// 添加总价
				} else {
					result = Result.failure("该书已下架或售罄,请重新选择！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				if (userOld.getUid() != 0) {
					eoitem.setUid(userOld.getUid());// 添加uid值
				} else {
					result = Result.failure("请您先登录！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				// 获取系统时间
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				eoitem.setCarttime(df.format(date));// 添加购物车加入时间
				// 生成订单号
				String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
				eoitem.setItemid(uuid);// 添加购物车号
				eoitem.setBid(Long.parseLong(bid));// 添加书id
				int i = itemBiz.insert(eoitem);
				if (i <= 0) {
					result = Result.failure("下单失败,请您稍后在操作！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				eoReal = itemBiz.selectSingle(eoitem);
			} else if (itemOld != null && itemOld.getItemid() !=null && !itemOld.getItemid().isEmpty()) {
				// 查询此购物车订单是否存在
				Bought item = itemBiz.selectSingleCart(itemOld);
				Eorderitem itemOld1 = new Eorderitem();
				itemOld1.setItemid(item.getItemid());
				Eorderitem itemNew = new Eorderitem();
				if (item.getBid() != 0 && item.getUid() == userOld.getUid() && item.getCartstate() != 2) {
					itemNew.setCount(Integer.parseInt(count));
					itemNew.setTotal(total);
				}
				
				int k = itemBiz.update(itemNew, itemOld1);
				if (k <= 0) {
					result = Result.failure("下单失败,请您稍后在操作！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				eoReal = itemBiz.selectSingle(itemOld1);
			} else {
				result = Result.failure("您未选择任何商品不能进行此操作！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}

			// 5.给eorder填数据
			// 获取系统时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			eorder.setEotime(df.format(date));// 下单时间
			eorder.setEoid(uuidOrder);// 订单号
			eorder.setEostate(2);// 订单状态(待发货)
			eorder.setUid(userOld.getUid());// 用户id
			eorder.setEoaddr(eoaddr);// 地址
			eorder.setEotype(sendType);// 送货类型
			eorder.setEopaytypeid(pay);// 支付方式
			eorder.setUname(uname);// 收货人
			eorder.setEotemp(uphone);// 收货电话

			// 先将库存减去
			Book book = new Book();
			book.setBid(eoReal.getBid());
			Book bookOld = biz.selectSingle(book);
			Book bookNew = new Book();
			// 库存不够不能下单
			if (bookOld.getBnum() < Long.parseLong(count)) {
				result = Result.failure("库存不够,请您重新选择数量！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			long number = bookOld.getBnum() - Long.parseLong(count);
			bookNew.setBnum(number);
			int q = biz.update(bookNew, bookOld);
			// 书籍信息没有更新，不能下单
			if (q <= 0) {
				result = Result.failure("下单失败,请您稍后再试！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			int j = eorderBiz.insert(eorder);
			if (j > 0) {
				// 将购物车信息更新(eoReal为购物车的信息)
				Eorderitem eoRealNew = new Eorderitem();
				eoRealNew.setCartstate(2);
				eoRealNew.setEoid(uuidOrder);
				int n = itemBiz.update(eoRealNew, eoReal);
				if (n > 0) {
					result = Result.success("下单成功！！！");

					// 数据刷新
					
					// 查询所有订单订单信息
					Eorder eorder1 = new Eorder();
					eorder.setUid(userOld.getUid());
					Page<Eorder> Page = eorderBiz.eorderPage(1, 3, eorder1);
					session.setAttribute("userOrderPage", Page);
					// 购物车信息显示
					Bought bought = new Bought();
					bought.setUid(userOld.getUid());
					bought.setCartstate(1);
					Page<Bought> pageCart = itemBiz.ePage(1, 6, bought);
					session.setAttribute("cartPage", pageCart);
					bought.setCartstate(2);
					List<Bought> listEo = itemBiz.selectAllCart(bought);
					session.setAttribute("userCart", listEo);
					// 会话还原
					String string = null;
					session.setAttribute("addOrderCount", string);
					session.setAttribute("addOrderEoaddr", string);
					session.setAttribute("addOrderUname", string);
					session.setAttribute("addOrderUphone", string);

					Eorderitem eorderitem = new Eorderitem();
					session.setAttribute("userOrderAddItem", eorderitem);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			}
			bookNew.setBnum(bookOld.getBnum());
			int p = biz.update(bookNew, bookOld);
			// 下单失败必须将书籍库存还原
			if (p > 0) {
				result = Result.failure("下单失败,请您稍后再试！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			} else {
				throw new RuntimeException();
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

	// 管理查询订单
	public void query(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		OrderDetial orderDetial = new OrderDetial();
		String eotime = request.getParameter("eotime");
		String eoid = request.getParameter("eoid");
		String eostate = request.getParameter("eostate");
		String type = request.getParameter("type");
		// 获取查询条件
		if (eotime != null && !eotime.isEmpty()) {
			orderDetial.setEotime(eotime);
		}
		if (eoid != null && !eoid.isEmpty()) {
			orderDetial.setEoid(eoid);
		}
		if (eostate != null && !eostate.isEmpty()) {
			orderDetial.setEostate(Integer.parseInt(eostate));
		}
		try {
			// 数据更新
			List<OrderDetial> order_show = eorderBiz.selectAllDetail(orderDetial);
			List<OrderDetial> orderRefund = new ArrayList<OrderDetial>();
			List<OrderDetial> orderHand = new ArrayList<OrderDetial>();
			for (int i = 0; i < order_show.size(); i++) {
				if (order_show.get(i).getEostate() == 4 || order_show.get(i).getEostate() == 5
						|| order_show.get(i).getEostate() == 7) {
					orderRefund.add(order_show.get(i));
				}else{
					orderHand.add(order_show.get(i));
				}
			}
			session.setAttribute("eorderHand", orderHand);
			long[] numHand = { 0, 0, 0, 0 };
			for (OrderDetial order_main : orderHand) {
				if (order_main.getEostate() == 1) {
					numHand[0] = numHand[0] + 1;
				} else if (order_main.getEostate() == 2) {
					numHand[1] = numHand[1] + 1;
				} else if (order_main.getEostate() == 3) {
					numHand[2] = numHand[2] + 1;
				} else if (order_main.getEostate() == 6) {
					numHand[3] = numHand[3] + 1;
				}
			}
			session.setAttribute("orderNum", numHand);
			//查询退款数据
			session.setAttribute("eorderRefund", orderRefund);
			if(type != null && !type.isEmpty()){
				if(type.equals("0")){
					if (orderRefund.size() > 0) {
						result = Result.success("查询成功！！！");
						String json = gson.toJson(result);
						response.setContentType("application/json;charset=UTF-8");
						response.getWriter().append(json);
						return;
					}
					result = Result.failure("暂无数据！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				if(type.equals("1")){
					if (orderHand.size() > 0) {
						result = Result.success("查询成功！！！");
						String json = gson.toJson(result);
						response.setContentType("application/json;charset=UTF-8");
						response.getWriter().append(json);
						return;
					}
					result = Result.failure("暂无数据！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				
			}
			if (order_show.size() > 0) {
				result = Result.success("查询成功！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("暂无数据！！！");
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

	// 管理员更新订单
	public void update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Eorder eorderNew = new Eorder();
		Eorder eorderOld = new Eorder();
		String eoid = request.getParameter("eoid");
		String eostate = request.getParameter("eostate");
		String eopress = request.getParameter("eopress");
		String type = request.getParameter("type");
		if (eostate != null && !eostate.isEmpty()) {
			eorderNew.setEostate(Integer.parseInt(eostate));
		}
		if (eopress != null && !eopress.isEmpty()) {
			eorderNew.setEoespress(eopress);
		}
		if (type != null && !type.isEmpty()) {
			eorderNew.setEotype(type);
		}
		try {
			// 获取eoid
			if (eoid != null && !eoid.isEmpty()) {
				eorderOld.setEoid(eoid);
			} else {
				result = Result.failure("未选择订单！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			//更新
			int code = eorderBiz.update(eorderNew, eorderOld);
			if (code <= 0) {
				result = Result.failure("更新失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("更新成功！！！");
			//数据刷新
			//存储不是退款操作的订单
			OrderDetial eorder1 = new OrderDetial();
			List<OrderDetial> order_show = eorderBiz.selectAllDetail(eorder1);
			for (int i = 0; i < order_show.size(); i++) {
				if (order_show.get(i).getEostate() == 4 || order_show.get(i).getEostate() == 5
						|| order_show.get(i).getEostate() == 7) {
					order_show.remove(i);
					i--;
				}
			}
			session.setAttribute("eorderHand", order_show);
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
	// 查询单个订单详情
	public void querySingle(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		OrderDetial order_Detial = new OrderDetial();
		String eoid = request.getParameter("eoid");
		// 获取查询条件
		if (eoid != null && !eoid.isEmpty()) {
			order_Detial.setEoid(eoid);
		}
		try {
			OrderDetial rDetial = eorderBiz.selectSingleDetail(order_Detial);
			if (rDetial == null) {
				result = Result.failure("订单不存在,或已被删除！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			session.setAttribute("orderdetialshow", rDetial);
			result = Result.success("查询成功！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		}catch (IOException e) {
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
