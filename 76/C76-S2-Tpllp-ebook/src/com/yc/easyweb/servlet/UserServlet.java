package com.yc.easyweb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.Book;
import com.yc.easyweb.bean.OrderDetial;
import com.yc.easyweb.bean.Result;
import com.yc.easyweb.bean.User;
import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.biz.BookBiz;
import com.yc.easyweb.biz.EorderBiz;
import com.yc.easyweb.biz.UserBiz;

public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserBiz userBiz = new UserBiz();
	private BookBiz bookBiz = new BookBiz();
	private EorderBiz eorderBiz = new EorderBiz();
	private Gson gson = new Gson();
	private Result result;

	// 删除
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = request.getParameter("uid");
		User user;
		User user2;
		List<User> list = new ArrayList<User>();
		try {
			// 1.判断是否为空
			if (uid != null && !uid.isEmpty()) {
				// 2.判断删除的用户状态
				String[] uids = uid.split("/");
				for (String string : uids) {
					user = new User();
					if (!string.isEmpty() && string != null) {
						// a.状态为3不能重复操作
						user.setUid(Long.parseLong(string));
						user2 = userBiz.selectSingle(user);
						if (user2.getUstate() == 3) {
							result = Result.failure("该用户已被删除,不能重复进行此操作！！！");
							String json = gson.toJson(result);
							response.setContentType("application/json;charset=UTF-8");
							response.getWriter().append(json);
							return;
						}
						//b.是否发布了书籍
						Book book = new Book();
						book.setUid(Long.parseLong(string));
						List<Book> books = bookBiz.selectAll(book);
						if(books.size()>0){
							result = Result.failure("该用户还有尚未售完或下架的书籍,不能进行此操作！！！");
							String json = gson.toJson(result);
							response.setContentType("application/json;charset=UTF-8");
							response.getWriter().append(json);
							return;
						}
						//c.是否有订单未处理完
						OrderDetial orderDetial = new OrderDetial();
						orderDetial.setUid(Long.parseLong(string));
						List<OrderDetial> orderDetials = eorderBiz.selectAllDetail(orderDetial);
						if(orderDetials.size() >0 ){
							for (OrderDetial order : orderDetials) {
								if(order.getEostate() != 5 && order.getEostate() != 6){
									result = Result.failure("该用户还有尚未完成的订单,不能进行此操作！！！");
									String json = gson.toJson(result);
									response.setContentType("application/json;charset=UTF-8");
									response.getWriter().append(json);
									return;
								}
							}
						}
						user.setUstate(3);
						list.add(user);
					}
				}
			} else {
				result = Result.failure("您未选择任何用户！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (list.size() > 0) {
				int code = userBiz.update(list);
				if (code > 0) {
					result = Result.success("删除成功！！！");
					// 数据刷新
					User user1 = new User();
					List<User> customerExit = userBiz.selectAll(user1);// 存储所有用户信息
					user1.setUtype(1);
					List<User> adminListAll = userBiz.selectAll(user1);
					user1.setUtype(5);
					List<User> adminList = userBiz.selectAll(user1);
					int[] adminSize = new int[1000];
					adminSize[0] = adminListAll.size();
					adminSize[1] = adminList.size();
					session.setAttribute("adminSize", adminSize);
					if (adminList.size() != 0) {
						for (User u : adminList) {
							adminListAll.add(u);
						}
					}
					session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
					// 剔除管理员
					for (int i = 0; i < customerExit.size(); i++) {
						for (int j = 0; j < adminListAll.size(); j++) {
							if (customerExit.get(i).equals(adminListAll.get(j))
									&& customerExit.get(i).hashCode() == adminListAll.get(j).hashCode()) {
								customerExit.remove(i);
								// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
								i--;
								break;
							}
						}
					}
					session.setAttribute("customerAll", customerExit);// 存储所有用户信息
					Long [] userSize = new Long[100];
					for (int i = 0; i < userSize.length; i++) {
						userSize[i] = (long) 0;
					}
					for (User u : customerExit) {
						if(u.getUtype() == 2){
							userSize[0] = userSize[0] + 1;
						}
						if(u.getUtype() == 3){
							userSize[1] = userSize[1] + 1;
						}
						if(u.getUtype() == 4){
							userSize[2] = userSize[2] + 1;
						}
						if(u.getUtype() == 6){
							userSize[3] = userSize[3] + 1;
						}
						if(u.getUtype() == 7){
							userSize[4] = userSize[4] + 1;
						}
						if(u.getUtype() == 8){
							userSize[5] = userSize[5] + 1;
						}
						if(u.getUtype() == 9){
							userSize[6] = userSize[6] + 1;
						}
						if(u.getUtype() == 10){
							userSize[7] = userSize[7] + 1;
						}
					}
					session.setAttribute("userSize", userSize);
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
			result = Result.failure("您未选择任何用户！！！");
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

	// 管理员更新用户状态和密码
	public void updateState(HttpServletRequest request, HttpServletResponse response) {
		User userNew = new User();
		User userOld = new User();
		HttpSession session = request.getSession();
		String uid = request.getParameter("uid");
		String ustate = request.getParameter("ustate");
		String upwd = request.getParameter("upassword");
		try {
			if (uid != null && !uid.isEmpty()) {
				userOld.setUid(Long.parseLong(uid));
			} else {
				result = Result.failure("请选择用户！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (ustate != null && !ustate.isEmpty()) {
				userNew.setUstate(Integer.parseInt(ustate));
			} else if (upwd != null && !upwd.isEmpty()) {
				if (upwd.equals("1")) {
					userNew.setUpassword("aaaa8888");
				} else {
					result = Result.failure("更新失败！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			} else {
				result = Result.failure("更新失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			int code = userBiz.update(userNew, userOld);
			if (code > 0) {
				result = Result.success("操作成功！！！");
				// 更新数据
				User user = new User();
				// 更新管理员数据
				List<User> customerExit = userBiz.selectAll(user);// 存储所有用户信息
				user.setUtype(1);
				List<User> adminListAll = userBiz.selectAll(user);
				user.setUtype(5);
				List<User> adminList = userBiz.selectAll(user);
				int[] adminSize = new int[1000];
				adminSize[0] = adminListAll.size();
				adminSize[1] = adminList.size();
				session.setAttribute("adminSize", adminSize);
				if (adminList.size() != 0) {
					for (User u : adminList) {
						adminListAll.add(u);
					}
				}
				session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
				// 剔除管理员
				for (int i = 0; i < customerExit.size(); i++) {
					for (int j = 0; j < adminListAll.size(); j++) {
						if (customerExit.get(i).equals(adminListAll.get(j))
								&& customerExit.get(i).hashCode() == adminListAll.get(j).hashCode()) {
							customerExit.remove(i);
							// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
							i--;
							break;
						}
					}
				}
				session.setAttribute("customerAll", customerExit);// 存储所有用户信息
				Long [] userSize = new Long[100];
				for (int i = 0; i < userSize.length; i++) {
					userSize[i] = (long) 0;
				}
				for (User u : customerExit) {
					if(u.getUtype() == 2){
						userSize[0] = userSize[0] + 1;
					}
					if(u.getUtype() == 3){
						userSize[1] = userSize[1] + 1;
					}
					if(u.getUtype() == 4){
						userSize[2] = userSize[2] + 1;
					}
					if(u.getUtype() == 6){
						userSize[3] = userSize[3] + 1;
					}
					if(u.getUtype() == 7){
						userSize[4] = userSize[4] + 1;
					}
					if(u.getUtype() == 8){
						userSize[5] = userSize[5] + 1;
					}
					if(u.getUtype() == 9){
						userSize[6] = userSize[6] + 1;
					}
					if(u.getUtype() == 10){
						userSize[7] = userSize[7] + 1;
					}
				}
				session.setAttribute("userSize", userSize);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("操作失败！！！");
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

	// 管理员查看用户个人信息
	public void showUserMessage(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		HttpSession session = request.getSession();
		String uid = request.getParameter("uid");
		if (uid != null && !uid.isEmpty()) {
			user.setUid(Long.parseLong(uid));
		}
		try {
			User userShow = userBiz.selectSingle(user);
			if (userShow.getUid() == 0) {
				result = Result.failure("查无此人！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			session.setAttribute("userMessage", userShow);
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

	// 管理员查看用户列表
	public void queryUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uname = request.getParameter("uname");// 姓名
		String uphone = request.getParameter("uphone");// 电话
		String uemail = request.getParameter("uemail");// 邮箱
		String utype = request.getParameter("utype");
		// 查询所有的用户
		User userShow = new User();// 定义显示的用户条件对象

		// 获取查询条件
		if (uname != null && !uname.isEmpty()) {
			userShow.setUname(uname);
		}
		if (uphone != null && !uphone.isEmpty()) {
			userShow.setUphone(uphone);
		}
		if (uemail != null && !uemail.isEmpty()) {
			userShow.setUemail(uemail);
		}
		if (utype != null && !utype.isEmpty()) {
			userShow.setUtype(Integer.parseInt(utype));
		}
		try {
			List<User> customerExit = userBiz.selectAll(userShow);// 存储所有用户信息
			User user = new User();
			user.setUtype(1);
			List<User> adminListAll = userBiz.selectAll(user);
			user.setUtype(5);
			List<User> adminList = userBiz.selectAll(user);
			if (adminList.size() != 0) {
				for (User u : adminList) {
					adminListAll.add(u);
				}
			}
			// 剔除管理员
			for (int i = 0; i < customerExit.size(); i++) {
				for (int j = 0; j < adminListAll.size(); j++) {
					if (customerExit.get(i).equals(adminListAll.get(j))
							&& customerExit.get(i).hashCode() == adminListAll.get(j).hashCode()) {
						customerExit.remove(i);
						// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
						i--;
						break;
					}
				}
			}
			session.setAttribute("customerAll", customerExit);// 存储所有用户信息
			Long [] userSize = new Long[100];
			for (int i = 0; i < userSize.length; i++) {
				userSize[i] = (long) 0;
			}
			for (User u : customerExit) {
				if(u.getUtype() == 2){
					userSize[0] = userSize[0] + 1;
				}
				if(u.getUtype() == 3){
					userSize[1] = userSize[1] + 1;
				}
				if(u.getUtype() == 4){
					userSize[2] = userSize[2] + 1;
				}
				if(u.getUtype() == 6){
					userSize[3] = userSize[3] + 1;
				}
				if(u.getUtype() == 7){
					userSize[4] = userSize[4] + 1;
				}
				if(u.getUtype() == 8){
					userSize[5] = userSize[5] + 1;
				}
				if(u.getUtype() == 9){
					userSize[6] = userSize[6] + 1;
				}
				if(u.getUtype() == 10){
					userSize[7] = userSize[7] + 1;
				}
			}
			session.setAttribute("userSize", userSize);
			if (customerExit.size() > 0) {
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

	// 修改个人密码
	public void updatePwd(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginedUser");
		User userNew = new User();
		String newpassword = (String) session.getAttribute("regUpwd");
		try {
			if (newpassword != null && !newpassword.isEmpty()) {
				userNew.setUpassword(newpassword);
			} else {
				result = Result.failure("新密码未输入或不合法");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
			int code = userBiz.update(userNew, user);
			if (code <= 0) {
				result = Result.failure("修改失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("修改成功！！！");
			// 数据刷新
			User user2 = userBiz.selectSingle(user);
			session.setAttribute("longinedUser", user2);
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

	// 检查个人密码输入
	public void checkPwd(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginedUser");
		try {
			String oldpassword = request.getParameter("oldpassword");
			if (oldpassword != null && !oldpassword.isEmpty()) {
				if (oldpassword.equals(user.getUpassword())) {
					result = Result.success("原密码正确！！！");
					String json = gson.toJson(result);
					session.setAttribute("updateOldPwd", oldpassword);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
				} else {
					result = Result.failure("原密码输入错误！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
				}
			} else {
				result = Result.failure("请输入原密码！！！");
				String json = gson.toJson(result);

				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
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

	// 更新个人信息
	public void updateUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = new User();
		String age = request.getParameter("uage");
		String phone = request.getParameter("uphone");
		String email = request.getParameter("uemail");
		String minname = request.getParameter("uminname");
		String sex = request.getParameter("usex");
		String uni = request.getParameter("university");
		String ucol = request.getParameter("ucollege");
		String umajor = request.getParameter("umajor");
		String uclass = request.getParameter("uclass");
		User userOld = (User) session.getAttribute("loginedUser");
		String check = "1";
		// 电话
		if (phone != null && !phone.isEmpty()) {
			if (!phone.equals(userOld.getUphone())) {
				phone = (String) session.getAttribute("updateUphone");
				if (phone != null && !phone.isEmpty()) {
					user.setUphone(phone);
					check = check + "/1";
				} else {
					check = check + "/-1";
				}
			} else {
				user.setUphone(phone);
				check = check + "/1";
			}
		} else {
			check = check + "/-1";
		}

		// 年龄
		if (age != null && !age.isEmpty()) {
			if (!age.equals(userOld.getUage())) {
				age = (String) session.getAttribute("updateUage");
				if (age != null && !age.isEmpty()) {
					user.setUage(Integer.parseInt(age));
					check = check + "/1";
				} else {
					check = check + "/-1";
				}
			} else {
				user.setUage(Integer.parseInt(age));
				check = check + "/1";
			}
		} else {
			check = check + "/-1";
		}
		// 邮箱
		if (email != null && !email.isEmpty()) {
			if (!email.equals(userOld.getUemail())) {
				email = (String) session.getAttribute("updateUemail");
				if (email != null && !email.isEmpty()) {
					user.setUemail(email);
					check = check + "/1";
				} else {
					check = check + "/-1";
				}
			} else {
				user.setUemail(email);
				check = check + "/1";
			}
		} else {
			check = check + "/-1";
		}
		try {
			if (!check.equals("1/1/1/1")) {
				result = Result.lack("信息不完整或错误", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 输入合法
			if (minname != null && !minname.isEmpty()) {
				user.setUminname(minname);
			}
			if (sex != null && !sex.isEmpty()) {
				user.setUsex(Integer.parseInt(sex));
			}
			if (uni != null && !uni.isEmpty()) {
				user.setUniversity(uni);
			}
			if (ucol != null && !ucol.isEmpty()) {
				user.setUcollege(ucol);
			}
			if (!uclass.isEmpty() && uclass != null) {
				user.setUclass(uclass);
			}
			if (umajor != null && !umajor.isEmpty()) {
				user.setUmajor(umajor);
			}

			// 进行更新操作

			int code = userBiz.update(user, userOld);
			if (code > 0) {
				// 数据刷新
				User user2 = userBiz.selectSingle(user);
				session.setAttribute("longinedUser", user2);
				result = Result.success("修改成功！！！");
			} else {
				result = Result.failure("修改失败");
			}
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
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

	// 更新检验年龄
	public void checkUage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		String uage = request.getParameter("uage");
		String regage = "^[0-9]{1,2}$";
		try {
			if (uage != null && !uage.isEmpty()) {
				if (!uage.matches(regage)) {
					result = Result.failure("年龄输入不合法！！！");
					String json = gson.toJson(result);

					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				session.setAttribute("updateUage", uage);
				result = Result.success("输入正确！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			} else {
				result = Result.failure("请输入年龄！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
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

	/*
	 * 更新检验电话
	 */
	public void checkPhone(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uphone = request.getParameter("uphone");
		String regphone = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
		User userOld = (User) session.getAttribute("loginedUser");
		User user = new User();
		try {
			if (uphone != null && !uphone.isEmpty()) {
				// 电话未修改
				if (uphone.equals(userOld.getUphone())) {
					result = Result.success("", uphone);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					session.setAttribute("updateUphone", uphone);
					return;
				}
				if (!uphone.matches(regphone)) {
					result = Result.failure("电话号码不合法！！！", uphone);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				user.setUphone(uphone);
				User user2 = userBiz.selectSingle(user);
				if (user2.getUid() != 0) {
					result = Result.failure("电话号码已被使用！！！", uphone);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("该电话号码可以使用！！！", uphone);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				session.setAttribute("updateUphone", uphone);
			} else {
				result = Result.failure("请输入电话号码！！！", uphone);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
		} catch (BizException e) {
			result = Result.error(e.getMessage(), uphone);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作");
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

	// 更新检查邮箱
	public void checkEmail(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User userOld = (User) session.getAttribute("loginedUser");
		String uemail = request.getParameter("uemail");
		User user = new User();
		String regemail = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";
		try {
			if (uemail != null && !uemail.isEmpty()) {
				user.setUemail(uemail);
			} else {
				result = Result.failure("请输入邮箱！！！", uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 邮箱格式不合法！
			if (!uemail.matches(regemail)) {
				result = Result.failure("邮箱格式不合法！！！", uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 邮箱未修改
			if (uemail.equals(userOld.getUemail())) {
				result = Result.success("");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				session.setAttribute("updateUemail", uemail);
				return;
			}
			User user2 = userBiz.selectSingle(user);
			// 该邮箱已被注册！
			if (user2.getUid() != 0) {
				result = Result.failure("该邮箱已被注册！！！", uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 该邮箱可以注册!
			session.setAttribute("updateUemail", uemail);
			result = Result.success("该邮箱可以使用", uemail);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
		} catch (BizException e) {
			result = Result.error(e.getMessage(), uemail);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	// 管理员添加用户
	public void add(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("regUname");
		String uphone = (String) session.getAttribute("regUphone");
		String uemail = (String) session.getAttribute("regUemail");
		String utype = request.getParameter("utype");

		if (utype != null && !utype.isEmpty()) {
			user.setUtype(Integer.parseInt(utype));
		} else {
			user.setUtype(2);
		}
		// 1.验证数据的合法性
		String check = "1";
		// 用户名
		if (uname != null && !uname.isEmpty()) {
			user.setUname(uname);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 电话
		if (uphone != null && !uphone.isEmpty()) {
			user.setUphone(uphone);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 邮箱
		if (uemail != null && !uemail.isEmpty()) {
			user.setUemail(uemail);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		try {
			if (!check.equals("1/1/1/1")) {
				result = Result.lack("信息不完整！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 2.添加
			// 获取系统当前时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			user.setUtime(df.format(date));
			String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
			String min = uuid.substring(0, 10);
			user.setUminname("用户" + min);
			user.setUpassword("aaaa8888");
			user.setUstate(1);
			int code = userBiz.insert(user);
			if (code > 0) {
				result = Result.success("添加成功！！！");
				// 会话还原
				String string = null;
				session.setAttribute("regUname", string);
				session.setAttribute("regUphone", string);
				session.setAttribute("regUpwd", string);
				session.setAttribute("regUemail", string);
				// 数据刷新
				User user1 = new User();
				List<User> customerExit = userBiz.selectAll(user1);// 存储所有用户信息
				user1.setUtype(1);
				List<User> adminListAll = userBiz.selectAll(user1);
				user1.setUtype(5);
				List<User> adminList = userBiz.selectAll(user1);
				if (adminList.size() != 0) {
					for (User u : adminList) {
						adminListAll.add(u);
					}
				}
				// 剔除管理员
				for (int i = 0; i < customerExit.size(); i++) {
					for (int j = 0; j < adminListAll.size(); j++) {
						if (customerExit.get(i).equals(adminListAll.get(j))
								&& customerExit.get(i).hashCode() == adminListAll.get(j).hashCode()) {
							customerExit.remove(i);
							// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
							i--;
							break;
						}
					}
				}
				session.setAttribute("customerAll", customerExit);// 存储所有用户信息
				Long [] userSize = new Long[100];
				for (int i = 0; i < userSize.length; i++) {
					userSize[i] = (long) 0;
				}
				for (User u : customerExit) {
					if(u.getUtype() == 2){
						userSize[0] = userSize[0] + 1;
					}
					if(u.getUtype() == 3){
						userSize[1] = userSize[1] + 1;
					}
					if(u.getUtype() == 4){
						userSize[2] = userSize[2] + 1;
					}
					if(u.getUtype() == 6){
						userSize[3] = userSize[3] + 1;
					}
					if(u.getUtype() == 7){
						userSize[4] = userSize[4] + 1;
					}
					if(u.getUtype() == 8){
						userSize[5] = userSize[5] + 1;
					}
					if(u.getUtype() == 9){
						userSize[6] = userSize[6] + 1;
					}
					if(u.getUtype() == 10){
						userSize[7] = userSize[7] + 1;
					}
				}
				session.setAttribute("userSize", userSize);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("添加失败！！！");
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
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	/*
	 * 管理员更新用户检验用户名
	 * 
	 * @param request
	 * 
	 * @param response
	 */
	public void adminCheckName(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String uid = request.getParameter("uid");
		try {
			if (username != null && !username.isEmpty()) {
				user.setUname(username);
			} else {
				// 用户名输入为空
				result = Result.failure("用户名为空！！！", username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			String reg = "^[\u4e00-\u9fa5a-zA-Z]{2,20}$";
			if (!username.matches(reg)) {
				result = Result.failure("用户名输入不合法！！！", username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			long uid1;
			if (uid != null && !uid.isEmpty()) {
				uid1 = Long.parseLong(uid);
			} else {
				result = Result.failure("未选择用户！！！", username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			User user2 = userBiz.selectSingle(user);
			if (user2.getUid() != uid1 && user2.getUid() != 0) { // 说明用户名已经被使用
				result = Result.failure("已存在该用户！！！", username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("该用户名可以使用！！！");
			String json = gson.toJson(result);
			session.setAttribute("adminUpdateUname", username);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (BizException e) {
			result = Result.error(e.getMessage(), username);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);

			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！", username);
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

	/*
	 * 管理员更新用户检验电话
	 */
	public void adminCheckPhone(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uphone = request.getParameter("uphone");
		String regphone = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
		String uid = request.getParameter("uid");
		User user = new User();
		long uid1 = 0;
		try {
			User user2 = new User();
			if (uid != null && !uid.isEmpty()) {
				uid1 = Long.parseLong(uid);
				user2.setUid(uid1);
			} else {
				result = Result.failure("未选择用户！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
			User userOld = userBiz.selectSingle(user2);
			if (uphone != null && !uphone.isEmpty()) {
				// 电话未修改
				if (uphone.equals(userOld.getUphone())) {
					result = Result.success("", uphone);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					session.setAttribute("adminUpdateUphone", uphone);
					return;
				}
				if (!uphone.matches(regphone)) {
					result = Result.failure("电话号码不合法！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				user.setUphone(uphone);
				User user3 = userBiz.selectSingle(user);
				if (user3.getUid() != 0 && user3.getUid() != uid1) {
					result = Result.failure("电话号码已被使用！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("该电话号码可以使用！！！");
				session.setAttribute("adminUpdateUphone", uphone);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			} else {
				result = Result.failure("请输入电话号码！！！", uphone);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
		} catch (BizException e) {
			result = Result.error(e.getMessage(), uphone);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作");
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

	// 管理员更新用户检查邮箱
	public void adminCheckEmail(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uemail = request.getParameter("uemail");
		String uid = request.getParameter("uid");
		User user = new User();
		String regemail = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";
		try {
			if (uemail != null && !uemail.isEmpty()) {
				user.setUemail(uemail);
			} else {
				result = Result.failure("请输入邮箱！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 邮箱格式不合法！
			if (!uemail.matches(regemail)) {
				result = Result.failure("邮箱格式不合法！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 邮箱未修改
			long uid1 = 0;
			if (uid != null && !uid.isEmpty()) {
				uid1 = Long.parseLong(uid);
				user.setUid(uid1);
			} else {
				result = Result.failure("未选择用户！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			User user2 = new User();
			user2.setUid(uid1);
			User userOld = userBiz.selectSingle(user2);
			if (uemail.equals(userOld.getUemail())) {
				result = Result.success("");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				session.setAttribute("adminUpdateUemail", uemail);
				return;
			}
			User user3 = userBiz.selectSingle(user);
			// 该邮箱已被注册！
			if (user3.getUid() != 0 && user3.getUid() != uid1) {
				result = Result.failure("该邮箱已被注册！！！", uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 该邮箱可以注册!
			session.setAttribute("adminUpdateUemail", uemail);
			result = Result.success("该邮箱可以使用", uemail);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (BizException e) {
			result = Result.error(e.getMessage(), uemail);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	// 管理员更新用户和管理员信息
	public void adminUpdateUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = request.getParameter("uid");
		String utype = request.getParameter("utype");
		String usex = request.getParameter("form-field-radio");
		User userNew = new User();
		User userOld = new User();
		String uname = (String) session.getAttribute("adminUpdateUname");
		String uemail = (String) session.getAttribute("adminUpdateUemail");
		String uphone = (String) session.getAttribute("adminUpdateUphone");

		// 1.验证数据的合法性
		String check = "1";
		// a.姓名
		if (uname != null && !uname.isEmpty()) {
			userNew.setUname(uname);
			check = check + "/1";
		} else {
			if (request.getParameter("uname") != null && !request.getParameter("uname").isEmpty()) {
				userNew.setUname(uname);
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
		}
		// b.邮箱
		if (uemail != null && !uemail.isEmpty()) {
			userNew.setUemail(uemail);
			check = check + "/1";
		} else {
			if (request.getParameter("uemail") != null && !request.getParameter("uemail").isEmpty()) {
				userNew.setUemail(uemail);
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
		}
		// c.电话
		if (uphone != null && !uphone.isEmpty()) {
			userNew.setUphone(uphone);
			check = check + "/1";
		} else {
			if (request.getParameter("uphone") != null && !request.getParameter("uphone").isEmpty()) {
				userNew.setUphone(uphone);
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
		}
		try {
			// 数据不合法
			if (!check.equals("1/1/1/1")) {
				result = Result.lack("数据不合法！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 用户存在
			if (uid != null && !uid.isEmpty()) {
				userOld.setUid(Long.parseLong(uid));
			} else {
				result = Result.failure("未选择用户！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 2.进行更新操作
			if (utype != null && !utype.isEmpty()) {
				userNew.setUtype(Integer.parseInt(utype));
			}
			if (usex != null && !usex.isEmpty()) {
				userNew.setUsex(Integer.parseInt(usex));
			}
			int code = userBiz.update(userNew, userOld);
			if (code > 0) {
				result = Result.success("更新成功！！！");
				// 会话还原
				String string = null;
				session.setAttribute("adminUpdateUname", string);
				session.setAttribute("adminUpdateUemail", string);
				session.setAttribute("adminUpdateUphone", string);
				// 数据更新
				User user1 = new User();
				List<User> customerExit = userBiz.selectAll(user1);// 存储所有用户信息
				user1.setUtype(1);
				List<User> adminListAll = userBiz.selectAll(user1);
				user1.setUtype(5);
				List<User> adminList = userBiz.selectAll(user1);
				int[] adminSize = new int[1000];
				adminSize[0] = adminListAll.size();
				adminSize[1] = adminList.size();
				session.setAttribute("adminSize", adminSize);
				if (adminList.size() != 0) {
					for (User u : adminList) {
						adminListAll.add(u);
					}
				}
				session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
				// 剔除管理员
				for (int i = 0; i < customerExit.size(); i++) {
					for (int j = 0; j < adminListAll.size(); j++) {
						if (customerExit.get(i).equals(adminListAll.get(j))
								&& customerExit.get(i).hashCode() == adminListAll.get(j).hashCode()) {
							customerExit.remove(i);
							// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
							i--;
							break;
						}
					}
				}
				session.setAttribute("customerAll", customerExit);// 存储所有用户信息
				Long [] userSize = new Long[100];
				for (int i = 0; i < userSize.length; i++) {
					userSize[i] = (long) 0;
				}
				for (User u : customerExit) {
					if(u.getUtype() == 2){
						userSize[0] = userSize[0] + 1;
					}
					if(u.getUtype() == 3){
						userSize[1] = userSize[1] + 1;
					}
					if(u.getUtype() == 4){
						userSize[2] = userSize[2] + 1;
					}
					if(u.getUtype() == 6){
						userSize[3] = userSize[3] + 1;
					}
					if(u.getUtype() == 7){
						userSize[4] = userSize[4] + 1;
					}
					if(u.getUtype() == 8){
						userSize[5] = userSize[5] + 1;
					}
					if(u.getUtype() == 9){
						userSize[6] = userSize[6] + 1;
					}
					if(u.getUtype() == 10){
						userSize[7] = userSize[7] + 1;
					}
				}
				session.setAttribute("userSize", userSize);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("更新失败！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	// administrator页面数据显示
	public void queryAdmin(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = new User();
		String uname = request.getParameter("uname");
		String uphone = request.getParameter("uphone");
		String utype = request.getParameter("utype");
		if (uname != null && !uname.isEmpty()) {
			user.setUname(uname);
		}
		if (uphone != null && !uphone.isEmpty()) {
			user.setUphone(uphone);
		}
		if (utype != null && !utype.isEmpty()) {
			user.setUtype(Integer.parseInt(utype));
		}
		try {
			// 刷新数据
			List<User> adminListAll = null;
			List<User> adminList = null;
			if(user.getUtype() == 0){
				user.setUtype(1);
				adminListAll = userBiz.selectAll(user);
				user.setUtype(5);
				adminList = userBiz.selectAll(user);
				if (adminList.size() != 0) {
					for (User u : adminList) {
						adminListAll.add(u);
					}
				}
			}else{
				adminListAll = userBiz.selectAll(user);
				adminList = userBiz.selectAll(user);
			}
			session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
			if (adminListAll.size() > 0) {
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
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	// 管理员添加管理员
	public void addAdmin(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("regUname");
		String uphone = (String) session.getAttribute("regUphone");
		String uemail = (String) session.getAttribute("regUemail");
		String usex = request.getParameter("form-field-radio");
		String utype = request.getParameter("utype");

		if (utype != null && !utype.isEmpty()) {
			user.setUtype(Integer.parseInt(utype));
		} else {
			user.setUtype(5);
		}
		if (usex != null && !usex.isEmpty()) {
			user.setUsex(Integer.parseInt(usex));
		} else {
			user.setUsex(0);
		}
		// 1.验证数据的合法性
		String check = "1";
		// 用户名
		if (uname != null && !uname.isEmpty()) {
			user.setUname(uname);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 电话
		if (uphone != null && !uphone.isEmpty()) {
			user.setUphone(uphone);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 邮箱
		if (uemail != null && !uemail.isEmpty()) {
			user.setUemail(uemail);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		try {
			if (!check.equals("1/1/1/1")) {
				result = Result.lack("信息不完整！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 2.添加
			// 获取系统当前时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			user.setUtime(df.format(date));
			user.setUpassword("aaaa8888");
			user.setUstate(1);
			int code = userBiz.insert(user);
			if (code > 0) {
				result = Result.success("添加成功！！！");
				// 会话还原
				String string = null;
				session.setAttribute("regUname", string);
				session.setAttribute("regUphone", string);
				session.setAttribute("regUpwd", string);
				session.setAttribute("regUemail", string);
				// 数据刷新
				User user1 = new User();
				user1.setUtype(1);
				List<User> adminListAll = userBiz.selectAll(user1);
				user1.setUtype(5);
				List<User> adminList = userBiz.selectAll(user1);
				int[] adminSize = new int[1000];
				adminSize[0] = adminListAll.size();
				adminSize[1] = adminList.size();
				session.setAttribute("adminSize", adminSize);
				if (adminList.size() != 0) {
					for (User u : adminList) {
						adminListAll.add(u);
					}
				}
				session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("添加失败！！！");
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
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	// 管理员更新个人密码
	public void adminUpdatePwd(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String upassword = (String) session.getAttribute("regUpwd");
		String oldpwd = (String) session.getAttribute("updateOldPwd");
		String checkPwd = (String) session.getAttribute("checkPwd");
		User user = new User();
		User userOld = (User) session.getAttribute("loginedUser");
		// 1.验证数据的合法性
		String check = "1";
		if (upassword != null && !upassword.isEmpty()) {
			user.setUpassword(upassword);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		if (oldpwd != null && !oldpwd.isEmpty()) {
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		if (checkPwd != null && !checkPwd.isEmpty()) {
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		try {
			if (!check.equals("1/1/1/1")) {
				result = Result.lack("信息不完整！！!", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (userOld.getUid() == 0) {
				result = Result.failure("更新失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 2.更新
			int code = userBiz.update(user, userOld);
			if (code > 0) {
				result = Result.success("更新成功,为避免数据显示有误,请您稍后重新登录！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("更新失败！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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

	// 管理员更新个人信息
	public void adminUpdate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User userNew = new User();
		User userOld = (User) session.getAttribute("loginedUser");
		String uname = (String) session.getAttribute("adminUpdateUname");
		String uemail = (String) session.getAttribute("updateUemail");
		String uage = (String) session.getAttribute("updateUage");
		String uphone = (String) session.getAttribute("updateUphone");
		String usex = request.getParameter("usex");
		try {
			// 1.验证数据的合法性
			String check = "1";
			// a.用户名
			if (uname != null && !uname.isEmpty()) {
				userNew.setUname(uname);
				check = check + "/1";
			} else if (request.getParameter("uname") != null && !request.getParameter("uname").isEmpty()) {
				userNew.setUname(request.getParameter("uname"));
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			// b.邮箱
			if (uemail != null && !uemail.isEmpty()) {
				userNew.setUemail(uemail);
				check = check + "/1";
			} else if (request.getParameter("uemail") != null && !request.getParameter("uemail").isEmpty()) {
				userNew.setUemail(request.getParameter("uemail"));
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			// c.年龄
			if (uage != null && !uage.isEmpty()) {
				userNew.setUage(Integer.parseInt(uage));
				check = check + "/1";
			} else if (request.getParameter("uage") != null && !request.getParameter("uage").isEmpty()) {
				userNew.setUage(Integer.parseInt(request.getParameter("uage")));
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			// d.电话
			if (uphone != null && !uphone.isEmpty()) {
				userNew.setUphone(uphone);
				check = check + "/1";
			} else if (request.getParameter("uphone") != null && !request.getParameter("uphone").isEmpty()) {
				userNew.setUphone(request.getParameter("uphone"));
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
			if (!check.equals("1/1/1/1/1")) {
				result = Result.lack("信息不完整！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 2.检验是否登录
			if (userOld.getUid() == 0) {
				result = Result.failure("更新失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 3.更新
			if (usex != null && !usex.isEmpty()) {
				userNew.setUsex(Integer.parseInt(usex));
			}
			int code = userBiz.update(userNew, userOld);
			if (code <= 0) {
				result = Result.failure("更新失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("更新成功！！！");
			// a.会话还原
			String string = null;
			session.setAttribute("adminUpdateUname", string);
			session.setAttribute("updateUemail", string);
			session.setAttribute("updateUage", string);
			session.setAttribute("updateUphone", string);
			// b.数据更新
			User user = userBiz.selectSingle(userNew);
			session.setAttribute("loginedUser", user);
			User user1 = new User();
			user1.setUtype(1);
			List<User> adminListAll = userBiz.selectAll(user1);
			user1.setUtype(5);
			List<User> adminList = userBiz.selectAll(user1);
			int[] adminSize = new int[1000];
			adminSize[0] = adminListAll.size();
			adminSize[1] = adminList.size();
			session.setAttribute("adminSize", adminSize);
			if (adminList.size() != 0) {
				for (User u : adminList) {
					adminListAll.add(u);
				}
			}
			session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！");
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
