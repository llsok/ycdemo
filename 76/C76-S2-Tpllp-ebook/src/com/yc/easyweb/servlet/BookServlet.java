package com.yc.easyweb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.yc.easyweb.bean.Book;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.bean.Result;
import com.yc.easyweb.bean.User;
import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.biz.BookBiz;

public class BookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private BookBiz bookBiz = new BookBiz();
	private Gson gson = new Gson();
	private Result result;

	// 添加书籍验证数量
	public void checkBnum(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bnum = request.getParameter("bnum");
		String reg = "^[0-9]{1,8}$";
		try {
			if (bnum != null && !bnum.isEmpty()) {
				if (!bnum.matches(reg)) {
					result = Result.failure("数量输入不合法！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("输入正确！！！");
				session.setAttribute("insertBnum", bnum);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
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

	// 添加书籍验证价格
	public void checkBprice(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bprice = request.getParameter("bprice");
		String reg = "^[0-9]+(.[0-9]{0,2})?$";

		try {
			if (bprice != null && !bprice.isEmpty()) {
				if (!bprice.matches(reg)) {
					result = Result.failure("价格输入不合法！！！");
					String json = gson.toJson(result);
					// 返回json格式数据
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("输入合法！！！");
				session.setAttribute("insertBprice", bprice);
				String json = gson.toJson(result);
				// 返回json格式数据
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("价格为空！！！");
			String json = gson.toJson(result);
			// 返回json格式数据
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

	// 添加书籍验证作者名
	public void checkBauthor(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bauthor = request.getParameter("bauthor");
		String reg = "^[\u4e00-\u9fa5a-zA-Z]{1,100}$";

		try {
			if (bauthor != null && !bauthor.isEmpty()) {
				if (!bauthor.matches(reg)) {
					result = Result.failure("作者名输入不合法！！！");
					String json = gson.toJson(result);
					// 返回json格式数据
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("输入正确！！！");
				session.setAttribute("insertBauthor", bauthor);
				String json = gson.toJson(result);
				// 返回json格式数据
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("作者名为空！！！");
			String json = gson.toJson(result);
			// 返回json格式数据
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

	// 添加书籍验证书名
	public void checkBname(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bname = request.getParameter("bname");
		String reg = "^[\u4e00-\u9fa5a-zA-Z]{1,150}$";
		User oldUser = (User) session.getAttribute("loginedUser");
		try {
			if (bname != null && !bname.isEmpty()) {
				if (!bname.matches(reg)) {
					result = Result.failure("书名不合法！！！");
					String json = gson.toJson(result);
					// 返回json格式数据
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				// 判断是否上传了同名书籍
				Book book = new Book();
				book.setBname(bname);
				book.setBstate(1);
				book.setUid(oldUser.getUid());
				Book book2 = bookBiz.selectSingle(book);
				if (book2.getBid() != 0) {
					result = Result.failure("您已上传此书！！！");
					String json = gson.toJson(result);
					// 返回json格式数据
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				result = Result.success("书名可以使用！！！");
				session.setAttribute("insertBname", bname);
				String json = gson.toJson(result);
				// 返回json格式数据
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("书名为空！！！");
			String json = gson.toJson(result);
			// 返回json格式数据
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

	// 添加书籍验证系列名
	public void checkBtemp(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String btemp = request.getParameter("btemp");
		String reg = "^[\u4e00-\u9fa5a-zA-Z]{2,50}$";

		try {
			if (btemp != null && !btemp.isEmpty()) {
				if (!btemp.matches(reg)) {
					result = Result.failure("系列名不合法！！！");
					String json = gson.toJson(result);
					// 返回json格式数据
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
				session.setAttribute("insertBtemp", btemp);
				result = Result.success("该系列名可用！！！");
				String json = gson.toJson(result);
				// 返回json格式数据
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
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

	// 添加书籍上传图片
	public void uploadImage(HttpServletRequest request, HttpServletResponse response) {
		// 创建文件上传对象
		SmartUpload su = new SmartUpload();
		try {
			// 初始化，传入页面上下文对象
			su.initialize(getServletConfig(), request, response);
			// 设置上传的配置信息
			// 限定文件名后缀
			su.setAllowedFilesList("jpg,png,gif,bmp");
			// 限定大小
			su.setMaxFileSize(1024 * 1024 * 10);
			// 执行上传
			su.upload();
			// 判断是否有上传文件
			String webPath = null;
			String filename = null;// 文件名
			String diskPath = null;// 磁盘路径
			if (su.getFiles().getSize() > 0) {
				// 为防止上传的文件名重复，将文件名修改为唯一
				// 获取系统当前时间
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				Date date = new Date();
				Files files = su.getFiles();
				filename = df.format(date) + files.getFile(0).getFileName();
				String path = this.getServletContext().getContextPath();
				// 使用application（应用上下文对象） web路径 转换成 磁盘路径
				// getServletContext（） === application
				diskPath = getServletContext().getRealPath("/back/upload");
				files.getFile(0).saveAs(diskPath + "/" + filename);
				webPath = path + "/back/upload/" + filename;
			}
			if (webPath != null && !webPath.isEmpty()) {
				result = Result.success("上传图片成功！", webPath);
			} else {
				result = Result.failure("上传图片失败！");
			}
			String json = gson.toJson(result);
			// 返回json格式数据
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
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
		} catch (SmartUploadException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
			}
			e.printStackTrace();
		} catch (ServletException e) {
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

	// 显示list页面的书籍
	public void listBook(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uni = request.getParameter("university");
		String ucol = request.getParameter("ucollege");
		String umaj = request.getParameter("umajor");
		String ucla = request.getParameter("uclass");
		String page = request.getParameter("page");
		int ipage;
		Book book = new Book();
		book.setBstate(1);
		if (uni != null && !uni.isEmpty()) {
			book.setBuniversity(uni);
		}
		if (ucol != null && !uni.isEmpty()) {
			book.setBucollege(ucol);
		}
		if (umaj != null && !umaj.isEmpty()) {
			book.setBumajor(umaj);
		}
		if (ucla != null && !ucla.isEmpty()) {
			book.setBclass(ucla);
		}
		if (page != null && !page.isEmpty()) {
			ipage = Integer.parseInt(page);
		} else {
			ipage = 1;
		}
		try {
			Page<Book> page2 = bookBiz.bookPage(ipage, 21, book);
			if (page2.getData().size() == 0) {
				result = Result.failure("暂无数据！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.success("查询成功！！！");
			session.setAttribute("listBookPage", page2);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);

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

	// 显示书本详情
	public void bookDetail(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Book book1 = new Book();
		if (request.getParameter("bid") != null && !request.getParameter("bid").isEmpty()) {
			book1.setBid(Long.parseLong(request.getParameter("bid")));
		}
		try {
			Book book = bookBiz.selectSingle(book1);
			if (book.getBid() == 0) {
				result = Result.failure("该书已被删除！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			Book book2 = new Book();
			book2.setBtid(book.getBtid());
			List<Book> list = bookBiz.selectAll(book2);
			session.setAttribute("bookDetail", book);
			session.setAttribute("similarBook", list);
			result = Result.success("查询成功！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);

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

	// 用户发布书籍
	public void userAddBook(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String buniversity = request.getParameter("buniversity");
		String bucollege = request.getParameter("bucollege");
		String bumajor = request.getParameter("bumajor");
		String bclass = request.getParameter("bclass");
		String bcontent = request.getParameter("bcontent");
		String btid = request.getParameter("btid");
		String bimg = request.getParameter("img_path");
		
		// 需要验证的信息
		String btemp = (String) session.getAttribute("insertBtemp");
		String bname = (String) session.getAttribute("insertBname");
		String bprice = (String) session.getAttribute("insertBprice");
		String bnum = (String) session.getAttribute("insertBnum");
		String bauthor = (String) session.getAttribute("insertBauthor");

		User userOld = (User) session.getAttribute("loginedUser");
		Book book = new Book();

		if (!buniversity.equals("图书所属大学")) {
			book.setBuniversity(buniversity);
		}
		if (!bucollege.equals("图书所属学院")) {
			book.setBucollege(bucollege);
		}
		if (!bumajor.equals("图书所属专业")) {
			book.setBumajor(bumajor);
		}
		if (!bclass.equals("图书所属年级")) {
			book.setBclass(bclass);
		}
		if (bimg != null && !bimg.isEmpty()) {
			book.setBimg(bimg);
		}
		if (bcontent != null && !bcontent.isEmpty()) {
			bcontent = bcontent.trim();
			if (bcontent.length() > 20000) {
				bcontent = bcontent.substring(0, 19998);
			}
			book.setBcontent(bcontent);
		}
		if (btemp != null && !btemp.isEmpty()) {
			book.setBtemp(btemp);
		}
		String check = "1";
		// 书名
		if (bname != null && !bname.isEmpty()) {
			book.setBname(bname);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 书价格
		if (bprice != null && !bprice.isEmpty()) {
			book.setBprice(Double.parseDouble(bprice));
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 书作者
		if (bauthor != null && !bauthor.isEmpty()) {
			book.setBauthor(bauthor);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 书库存
		if (bnum != null && !bnum.isEmpty()) {
			book.setBnum(Long.parseLong(bnum));
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		try {
			if (!check.equals("1/1/1/1/1")) {
				result = Result.lack("添加失败！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (!btid.equals("图书所属类型")) {
				book.setBtid(Long.parseLong(btid));
			} else {
				result = Result.failure("请选择书籍类型！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			book.setUid(userOld.getUid());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			book.setBdate(df.format(date));
			book.setBstate(5);
			int code = bookBiz.insert(book);
			if (code > 0) {
				result = Result.success("发布成功！！！");
				//会话还原
				String string = null;
				session.setAttribute("insertBtemp",string);
				session.setAttribute("insertBname",string);
				session.setAttribute("insertBprice",string);
				session.setAttribute("insertBnum",string);
				session.setAttribute("insertBauthor",string);
				//2.数据刷新
				Book userBook = new Book();
				Page<Book> page;
				if (userOld.getUid() != 0) {
					userBook.setUid(userOld.getUid());
				} else {
					userBook.setUid(0);
				}
				page = bookBiz.bookPage(1, 5, userBook);
				session.setAttribute("userBookPage", page);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("发布失败！！！");
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

	// 删除
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		Book book2;
		HttpSession session = request.getSession();
		User userOld = (User) session.getAttribute("loginedUser");
		List<Book> list = new ArrayList<Book>();
		String bid = request.getParameter("bid");
		int i;
		try {
			if (bid != null && !bid.isEmpty()) {
				if (bid.equals("all")) {
					result = Result.failure("不能进行此操作！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				} else {
					String[] bids = bid.split("/");
					for (String string : bids) {
						book2 = new Book();
						if (!string.equals("-1") && !string.isEmpty() && string != null) {
							book2.setBid(Long.parseLong(string));
							list.add(book2);
						}
					}
				}
			} else {
				result = Result.failure("未选择书籍！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}

			if (list.size() != 0) {
				i = bookBiz.deleteMore(list);
				if (i > 0) {
					result = Result.success("删除成功！！！");
					//数据刷新
					Book book = new Book();
					book.setUid(userOld.getUid());
					Page<Book> page = bookBiz.bookPage(1, 5, book);
					session.setAttribute("userBookPage", page);
					Book bookAdmin = new Book();
					List<Book> bookAll = bookBiz.selectAll(bookAdmin);
					session.setAttribute("bookAll", bookAll);// 存储所有书籍
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
			result = Result.failure("未选择书籍！！！");
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

	// 管理员书籍列表查询
	public void query(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bauthor = request.getParameter("bauthor");
		String btime = request.getParameter("btime");
		String btid = request.getParameter("btid");
		Book book = new Book();

		// 获取查询条件
		if (bauthor != null && !bauthor.isEmpty()) {
			book.setBauthor(bauthor);
		}
		if (btime != null && !btime.isEmpty()) {
			book.setBdate(btime);
		}
		if (btid != null && !btid.isEmpty()) {
			book.setBtid(Long.parseLong(btid));
		}
		try {
			List<Book> bookList = bookBiz.selectAll(book);
			session.setAttribute("bookAll", bookList);// 保存所有书籍信息
			if (bookList.size() <= 0) {
				result = Result.failure("暂无书籍信息！！！");
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

	// 管理员更新状态
	public void update(HttpServletRequest request, HttpServletResponse response) {
		Book bookNew = new Book();
		Book bookOld = new Book();
		HttpSession session = request.getSession();
		String bid = request.getParameter("bid");
		String bstate = request.getParameter("bstate");
		try {
			if (bid != null && !bid.isEmpty()) {
				bookOld.setBid(Long.parseLong(bid));
			} else {
				result = Result.failure("修改信息不全！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (bstate != null && !bstate.isEmpty()) {
				bookNew.setBstate(Integer.parseInt(bstate));
			} else {
				result = Result.failure("修改信息不全！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			Book book = bookBiz.selectSingle(bookOld);
			// 如果为审核不通过不能操作
			if (book.getBstate() != 4) {
				int code = bookBiz.update(bookNew, bookOld);
				if (code > 0) {
					result = Result.success("操作成功！！！");
					//数据刷新
					Book book1 = new Book();
					List<Book> bookAll = bookBiz.selectAll(book1);
					session.setAttribute("bookAll", bookAll);// 存储所有书籍
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
			result = Result.failure("书籍审核不通过,不能进行此操作！！！");
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

	// 管理添加书本信息
	public void add(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String buniversity = request.getParameter("buniversity");
		String bucollege = request.getParameter("bucollege");
		String bumajor = request.getParameter("bumajor");
		String bclass = request.getParameter("bclass");
		String bcontent = request.getParameter("bcontent");
		String btid = request.getParameter("btid");
		String bimg = request.getParameter("img_path");
		String bdate = request.getParameter("bdate");
		// 需要验证的信息
		String btemp = (String) session.getAttribute("insertBtemp");
		String bname = (String) session.getAttribute("insertBname");
		String bprice = (String) session.getAttribute("insertBprice");
		String bnum = (String) session.getAttribute("insertBnum");
		String bauthor = (String) session.getAttribute("insertBauthor");
		Book book = new Book();
		if (!buniversity.equals("请选择")) {
			book.setBuniversity(buniversity);
		}
		if (!bucollege.equals("请选择")) {
			book.setBucollege(bucollege);
		}
		if (!bumajor.equals("请选择")) {
			book.setBumajor(bumajor);
		}
		if (!bclass.equals("请选择")) {
			book.setBclass(bclass);
		}
		if (bimg != null && !bimg.isEmpty()) {
			book.setBimg(bimg);
		}
		if (bcontent != null && !bcontent.isEmpty()) {
			bcontent = bcontent.trim();
			if (bcontent.length() > 20000) {
				bcontent = bcontent.substring(0, 19998);
			}
			book.setBcontent(bcontent);
		}
		if (btemp != null && !btemp.isEmpty()) {
			book.setBtemp(btemp);
		}
		String check = "1";
		// 书名
		if (bname != null && !bname.isEmpty()) {
			book.setBname(bname);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 书价格
		if (bprice != null && !bprice.isEmpty()) {
			book.setBprice(Double.parseDouble(bprice));
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 书作者
		if (bauthor != null && !bauthor.isEmpty()) {
			book.setBauthor(bauthor);
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		// 书库存
		if (bnum != null && !bnum.isEmpty()) {
			book.setBnum(Long.parseLong(bnum));
			check = check + "/1";
		} else {
			check = check + "/-1";
		}
		try {
			if (!check.equals("1/1/1/1/1")) {
				result = Result.lack("添加失败！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (!btid.equals("请选择")) {
				book.setBtid(Long.parseLong(btid));
			} else {
				result = Result.failure("请选择书籍类型！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			if(bdate != null && !bdate.isEmpty()){
				book.setBdate(bdate);
			}else{
				book.setBdate(df.format(date));
			}
			book.setBstate(1);
			int code = bookBiz.insert(book);
			if (code > 0) {
				result = Result.success("上传成功！！！");
				//会话还原
				String string = null;
				session.setAttribute("insertBtemp",string);
				session.setAttribute("insertBname",string);
				session.setAttribute("insertBprice",string);
				session.setAttribute("insertBnum",string);
				session.setAttribute("insertBauthor",string);
				//数据刷新
				Book book1 = new Book();
				List<Book> bookAll = bookBiz.selectAll(book1);
				session.setAttribute("bookAll", bookAll);// 存储所有书籍
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			result = Result.failure("上传失败！！！");
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
	

	// 管理员更新书本信息
	public void updateBook(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String buniversity = request.getParameter("buniversity");
		String bucollege = request.getParameter("bucollege");
		String bumajor = request.getParameter("bumajor");
		String bclass = request.getParameter("bclass");
		String bcontent = request.getParameter("bcontent");
		String btid = request.getParameter("btid");
		String bimg = request.getParameter("img_path");
		String bid = request.getParameter("bid");
		String bdate = request.getParameter("bdate");
		// 需要验证的信息
		String btemp = (String) session.getAttribute("insertBtemp");
		String bname = (String) session.getAttribute("insertBname");
		String bprice = (String) session.getAttribute("insertBprice");
		String bnum = (String) session.getAttribute("insertBnum");
		String bauthor = (String) session.getAttribute("insertBauthor");

		User userOld = (User) session.getAttribute("loginedUser");
		Book book = new Book();

		if(bdate != null && !bdate.isEmpty()){
			book.setBdate(bdate);
		}
		if (!buniversity.equals("请选择")) {
			book.setBuniversity(buniversity);
		}
		if (!bucollege.equals("请选择")) {
			book.setBucollege(bucollege);
		}
		if (!bumajor.equals("请选择")) {
			book.setBumajor(bumajor);
		}
		if (!bclass.equals("请选择")) {
			book.setBclass(bclass);
		}
		if (bimg != null && !bimg.isEmpty()) {
			book.setBimg(bimg);
		}
		if (bcontent != null && !bcontent.isEmpty()) {
			bcontent = bcontent.trim();
			if (bcontent.length() > 20000) {
				bcontent = bcontent.substring(0, 19998);
			}
			book.setBcontent(bcontent);
		}
		if (btemp != null && !btemp.isEmpty()) {
			book.setBtemp(btemp);
		}
		String check = "1";
		// 书名
		if (bname != null && !bname.isEmpty()) {
			book.setBname(bname);
			check = check + "/1";
		} else {
			if(request.getParameter("bname") != null && !request.getParameter("bname").isEmpty()){
				book.setBname(bname);
				check = check + "/1";
			}else{
				check = check + "/-1";
			}
		}
		// 书价格
		if (bprice != null && !bprice.isEmpty()) {
			book.setBprice(Double.parseDouble(bprice));
			check = check + "/1";
		} else {
			if(request.getParameter("bprice") != null && !request.getParameter("bprice").isEmpty()){
				book.setBprice(Double.parseDouble(request.getParameter("bprice")));
				check = check + "/1";
			}else{
				check = check + "/-1";
			}
		}
		// 书作者
		if (bauthor != null && !bauthor.isEmpty()) {
			book.setBauthor(bauthor);
			check = check + "/1";
		} else {
			if(request.getParameter("bauthor") != null && !request.getParameter("bauthor").isEmpty()){
				book.setBauthor(bauthor);
				check = check + "/1";
			}else{
				check = check + "/-1";
			}
		}
		// 书库存
		if (bnum != null && !bnum.isEmpty()) {
			book.setBnum(Long.parseLong(bnum));
			check = check + "/1";
		} else {
			if (request.getParameter("bnum") != null && !request.getParameter("bnum").isEmpty()) {
				book.setBnum(Long.parseLong(request.getParameter("bnum")));
				check = check + "/1";
			} else {
				check = check + "/-1";
			}
		}
		try {
			if (!check.equals("1/1/1/1/1")) {
				result = Result.lack("更新失败！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (!btid.equals("请选择")) {
				book.setBtid(Long.parseLong(btid));
			} else {
				result = Result.failure("请选择书籍类型！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (bid != null && !bid.isEmpty()) {
				//判断是管理员还是用户
				if(userOld.getUtype() ==1 || userOld.getUtype()==5){
					Book book2 = new Book();
					book2.setBid(Long.parseLong(bid));
					Book book3 = bookBiz.selectSingle(book2);
					if(book3.getUid() != 0){
						result = Result.failure("该书为用户所有不能进行此操作！！！");
						String json = gson.toJson(result);
						response.setContentType("application/json;charset=UTF-8");
						response.getWriter().append(json);
						return;
					}
				}
				Book oldBook = new Book();
				oldBook.setBid(Long.parseLong(bid));
				int code = bookBiz.update(book, oldBook);
				if (code > 0) {
					result = Result.success("修改成功！！！");
					//会话还原
					String string = null;
					session.setAttribute("insertBtemp",string);
					session.setAttribute("insertBname",string);
					session.setAttribute("insertBprice",string);
					session.setAttribute("insertBnum",string);
					session.setAttribute("insertBauthor",string);
					//数据刷新
					Book book1 = new Book();
					List<Book> bookAll = bookBiz.selectAll(book1);
					session.setAttribute("bookAll", bookAll);// 存储所有书籍
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
			result = Result.failure("未选择任何书籍！！！");
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
}
