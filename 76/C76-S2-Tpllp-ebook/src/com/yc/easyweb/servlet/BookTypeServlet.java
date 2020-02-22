package com.yc.easyweb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.*;
import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.biz.BookBiz;
import com.yc.easyweb.biz.BookTypeBiz;

public class BookTypeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private BookTypeBiz bookTypeBiz = new BookTypeBiz();
	private BookBiz bookBiz = new BookBiz();
	private Gson gson = new Gson();
	private Result result;

	// 添加
	public void add(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BookType bookType = new BookType();
		String nameSecond = (String) session.getAttribute("namesecond");
		String nameThird = (String) session.getAttribute("namethird");
		String realType = "";
		try {
			// 1.判断输入合法
			if (nameSecond != null && !nameSecond.isEmpty()) {
				bookType.setBtnamesecond(nameSecond);
				realType = nameSecond;
			} else if (request.getParameter("namesecond") != null && !request.getParameter("namesecond").isEmpty()) {
				bookType.setBtnamesecond(request.getParameter("namesecond"));
				realType = request.getParameter("namesecond");
			} else {
				result = Result.failure("未填写数据或数据不合法！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (nameThird != null && !nameThird.isEmpty()) {
				bookType.setBtnamethird(nameThird);
				realType = nameThird;
			}
			// 2.查重
			// a.查询数据库的类型(adminBtypesEdit中包含所有的书籍类型的数据)
			String[] btypes = (String[]) session.getAttribute("adminBtypesEdit");
			// b.比较
			for (String string : btypes) {
				if (string != null && !string.isEmpty()) {
					if (string.equals(realType)) {
						result = Result.failure("已存在该类型！！！");
						String json = gson.toJson(result);
						response.setContentType("application/json;charset=UTF-8");
						response.getWriter().append(json);
						return;
					}
				}
			}
			// 3.添加
			bookType.setBtname("教材区");
			int code = bookTypeBiz.insert(bookType);
			if (code > 0) {
				result = Result.success("添加成功！！！");
				// 会话还原
				String st = null;
				session.setAttribute("namesecond", st);
				session.setAttribute("namethird", st);
				// 将数据重新查询和赋值
				BookType bType = new BookType();
				bType.setBtname("教材区");
				List<BookType> btypes1 = bookTypeBiz.selectAll(bType);
				for (int i = 0; i < btypes1.size(); i++) {
					if (btypes1.get(i).getBtnamesecond() != null && !btypes1.get(i).getBtnamesecond().isEmpty()) {
						continue;
					}
					btypes1.remove(i);
					// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
					i--;
				}
				String[] btShow = new String[1000];
				String bType1 = "";
				for (BookType bt : btypes1) {
					if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
						bType1 = bType1 + bt.getBtid() + "-" + bt.getBtname() + "-" + bt.getBtnamesecond();
					}
					if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
						bType1 = bType1 + "-" + bt.getBtnamethird();
					}
					bType1 = bType1 + "-" + bt.getBtstate();
					btShow[(int) bt.getBtid()] = bType1;
					bType1 = "";
				}
				session.setAttribute("adminRealBtypes", btShow);
				session.setAttribute("adminShowBtypes", btypes1);
				// 管理员初始化书籍类型
				BookType bookType1 = new BookType();
				List<BookType> bookTypes = bookTypeBiz.selectAll(bookType1);
				session.setAttribute("adminBtypes", bookTypes);
				String[] type = new String[1000];
				String btname;
				for (BookType bt : bookTypes) {
					if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
						btname = bt.getBtnamethird();
					} else if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
						btname = bt.getBtnamesecond();
					} else {
						btname = bt.getBtname();
					}
					type[(int) bt.getBtid()] = btname;
				}
				session.setAttribute("adminBtypesEdit", type);
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
				throw new RuntimeException(e);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		}
	}

	// 删除
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		BookType bookTypeOld = new BookType();
		HttpSession session = request.getSession();
		String btid = request.getParameter("btid");
		try {
			if (btid != null && !btid.isEmpty()) {
				bookTypeOld.setBtid(Long.parseLong(btid));
			} else {
				result = Result.failure("请选择删除的类型！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			Book bookNew = new Book();
			bookNew.setBtid(1);
			Book bookOld = new Book();
			bookOld.setBtid(Long.parseLong(btid));
			//1.判断该类型是否有书籍
			List<Book> list = bookBiz.selectAll(bookOld);
			if(list.size() > 0){
				// 2.将上架的该类型书籍归于教材区
				int j = bookBiz.update(bookNew, bookOld);
				// a.失败则不能删除
				if (j <= 0) {
					result = Result.failure("删除失败！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			}
			//3.进行删除操作
			// b.成功
			int code = bookTypeBiz.delete(bookTypeOld);
			if (code <= 0) {
				result = Result.failure("删除失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("删除成功！！！");
			// 数据刷新
			BookType bType = new BookType();
			bType.setBtname("教材区");
			List<BookType> btypes1 = bookTypeBiz.selectAll(bType);
			for (int i = 0; i < btypes1.size(); i++) {
				if (btypes1.get(i).getBtnamesecond() != null && !btypes1.get(i).getBtnamesecond().isEmpty()) {
					continue;
				}
				btypes1.remove(i);
				// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
				i--;
			}
			String[] btShow = new String[1000];
			String bType1 = "";
			for (BookType bt : btypes1) {
				if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
					bType1 = bType1 + bt.getBtid() + "-" + bt.getBtname() + "-" + bt.getBtnamesecond();
				}
				if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
					bType1 = bType1 + "-" + bt.getBtnamethird();
				}
				bType1 = bType1 + "-" + bt.getBtstate();
				btShow[(int) bt.getBtid()] = bType1;
				bType1 = "";
			}
			session.setAttribute("adminRealBtypes", btShow);
			session.setAttribute("adminShowBtypes", btypes1);
			// 管理员初始化书籍类型
			BookType bookType1 = new BookType();
			List<BookType> bookTypes = bookTypeBiz.selectAll(bookType1);
			session.setAttribute("adminBtypes", bookTypes);
			String[] type = new String[1000];
			String btname;
			for (BookType bt : bookTypes) {
				if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
					btname = bt.getBtnamethird();
				} else if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
					btname = bt.getBtnamesecond();
				} else {
					btname = bt.getBtname();
				}
				type[(int) bt.getBtid()] = btname;
			}
			session.setAttribute("adminBtypesEdit", type);
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
				throw new RuntimeException(e);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		}
	}

	// 更新
	public void update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BookType bookType = new BookType();
		BookType bookTypeOld = new BookType();
		String btid = request.getParameter("btid");
		String state = request.getParameter("state");
		String nameSecond = (String) session.getAttribute("namesecond");
		String nameThird = (String) session.getAttribute("namethird");
		String realType = "";

		try {
			// 1.判断输入合法
			if (state != null && !state.isEmpty()) {
				bookType.setBtstate(Integer.parseInt(state));
			} else if (nameSecond != null && !nameSecond.isEmpty()) {
				bookType.setBtnamesecond(nameSecond);
				realType = nameSecond;
			} else if (request.getParameter("namesecond") != null && !request.getParameter("namesecond").isEmpty()) {
				bookType.setBtnamesecond(request.getParameter("namesecond"));
				realType = request.getParameter("namesecond");
			} else {
				result = Result.failure("未填写修改的数据或修改的数据不合法！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (nameThird != null && !nameThird.isEmpty()) {
				bookType.setBtnamethird(nameThird);
				realType = nameThird;
			}
			// id
			if (btid != null && !btid.isEmpty()) {
				bookTypeOld.setBtid(Long.parseLong(btid));
			} else {
				result = Result.failure("未选择书籍类型！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}

			// 更新状态
			if (state != null && !state.isEmpty()) {
				int code = bookTypeBiz.update(bookType, bookTypeOld);
				if (code > 0) {
					result = Result.success("操作成功！！！");
					// 将数据重新查询和赋值
					BookType bType = new BookType();
					bType.setBtname("教材区");
					List<BookType> btypes = bookTypeBiz.selectAll(bType);
					for (int i = 0; i < btypes.size(); i++) {
						if (btypes.get(i).getBtnamesecond() != null && !btypes.get(i).getBtnamesecond().isEmpty()) {
							continue;
						}
						btypes.remove(i);
						// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
						i--;
					}
					String[] btShow = new String[1000];
					String bType1 = "";
					for (BookType bt : btypes) {
						if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
							bType1 = bType1 + bt.getBtid() + "-" + bt.getBtname() + "-" + bt.getBtnamesecond();
						}
						if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
							bType1 = bType1 + "-" + bt.getBtnamethird();
						}
						bType1 = bType1 + "-" + bt.getBtstate();
						btShow[(int) bt.getBtid()] = bType1;
						bType1 = "";
					}
					session.setAttribute("adminRealBtypes", btShow);
					session.setAttribute("adminShowBtypes", btypes);
					// 管理员初始化书籍类型
					BookType bookType1 = new BookType();
					List<BookType> bookTypes = bookTypeBiz.selectAll(bookType1);
					session.setAttribute("adminBtypes", bookTypes);
					String[] type = new String[1000];
					String btname;
					for (BookType bt : bookTypes) {
						if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
							btname = bt.getBtnamethird();
						} else if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
							btname = bt.getBtnamesecond();
						} else {
							btname = bt.getBtname();
						}
						type[(int) bt.getBtid()] = btname;
					}
					session.setAttribute("adminBtypesEdit", type);
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
			}
			// 更新类型名称
			// 2.查重
			// a.查询数据库的类型(adminBtypesEdit中包含所有的书籍类型的数据)
			String[] btypes = (String[]) session.getAttribute("adminBtypesEdit");
			// b.比较
			for (String string : btypes) {
				if (string != null && !string.isEmpty()) {
					if (string.equals(realType)) {
						result = Result.failure("已存在该类型！！！");
						String json = gson.toJson(result);
						response.setContentType("application/json;charset=UTF-8");
						response.getWriter().append(json);
						return;
					}
				}
			}
			// 3.更新
			int code = bookTypeBiz.update(bookType, bookTypeOld);
			if (code > 0) {
				result = Result.success("更新成功！！！");
				// 会话还原
				String st = null;
				session.setAttribute("namesecond", st);
				session.setAttribute("namethird", st);
				// 将数据重新查询和赋值
				BookType bType = new BookType();
				bType.setBtname("教材区");
				List<BookType> btypes1 = bookTypeBiz.selectAll(bType);
				for (int i = 0; i < btypes1.size(); i++) {
					if (btypes1.get(i).getBtnamesecond() != null && !btypes1.get(i).getBtnamesecond().isEmpty()) {
						continue;
					}
					btypes1.remove(i);
					// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
					i--;
				}
				String[] btShow = new String[1000];
				String bType1 = "";
				for (BookType bt : btypes1) {
					if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
						bType1 = bType1 + bt.getBtid() + "-" + bt.getBtname() + "-" + bt.getBtnamesecond();
					}
					if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
						bType1 = bType1 + "-" + bt.getBtnamethird();
					}
					bType1 = bType1 + "-" + bt.getBtstate();
					btShow[(int) bt.getBtid()] = bType1;
					bType1 = "";
				}
				session.setAttribute("adminRealBtypes", btShow);
				session.setAttribute("adminShowBtypes", btypes1);
				// 管理员初始化书籍类型
				BookType bookType1 = new BookType();
				List<BookType> bookTypes = bookTypeBiz.selectAll(bookType1);
				session.setAttribute("adminBtypes", bookTypes);
				String[] type = new String[1000];
				String btname;
				for (BookType bt : bookTypes) {
					if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
						btname = bt.getBtnamethird();
					} else if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
						btname = bt.getBtnamesecond();
					} else {
						btname = bt.getBtname();
					}
					type[(int) bt.getBtid()] = btname;
				}
				session.setAttribute("adminBtypesEdit", type);
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
		} catch (BizException e) {
			result = Result.error(e.getMessage());
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		} catch (SQLException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);

			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		}
	}

	// 检验类型名二
	public void checkNamesecond(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String name = request.getParameter("namesecond");
		String reg = "^[\u4e00-\u9fa5]{2,20}$";
		try {
			if (name != null && !name.isEmpty()) {
				if (!name.matches(reg)) {
					result = Result.failure("类型二输入不合法！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("输入合法！！！");
				session.setAttribute("namesecond", name);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("类型二输入为空！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return;
		} catch (IOException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		}
	}

	// 检验类型名三
	public void checkNamethird(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String name = request.getParameter("namethird");
		String reg = "^[\u4e00-\u9fa5]{2,20}$";
		try {
			if (name != null && !name.isEmpty()) {
				if (!name.matches(reg)) {
					result = Result.failure("类型三输入不合法！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("输入合法！！！");
				session.setAttribute("namethird", name);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请您稍等一会儿再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e);
			}
			e.printStackTrace();
		}
	}

}
