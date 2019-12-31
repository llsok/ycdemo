package com.yc.easyweb.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.*;
import com.yc.easyweb.biz.*;

public class JoinServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserBiz userBiz = new UserBiz();
	private NoticeBiz noticeBiz = new NoticeBiz();
	private BookBiz bookBiz = new BookBiz();
	private BookTypeBiz btBiz = new BookTypeBiz();
	private PayTypeBiz payTypeBiz = new PayTypeBiz();
	private EorderitemBiz eorderitemBiz = new EorderitemBiz();
	private UsercontrolBiz ucBiz = new UsercontrolBiz();
	private ControlBiz controlBiz = new ControlBiz();
	private EorderBiz eorderBiz = new EorderBiz();
	private Gson gson = new Gson();
	private Result result;

	public void join(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		/*
		 * // 获取验证码 String vcode01 = (String) session.getAttribute("vcode");
		 * String vcode02 = request.getParameter("vcode"); if(vcode01 != null &&
		 * !vcode01.isEmpty() && !vcode02.isEmpty() && vcode02 != null){ if
		 * (!vcode01.equalsIgnoreCase(vcode02)) { out.print(-2);//验证码错误 return;
		 * } }
		 */

		// 接收 用户名 和 密码
		String username = request.getParameter("uname");
		String password = request.getParameter("upassword");
		/*String loginkeeping = request.getParameter("loginkeeping");*/
		// 验证码
		String vcode = request.getParameter("vcode");
		String realCode = (String) session.getAttribute("vcode");
		User user = new User();
		try {
			// 添加用户名条件
			if (username != null && !username.isEmpty()) {
				user.setUname(username);
			} else {
				result = Result.failure("用户名为空！！！", username);
				String json = gson.toJson(result);
				
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			// 添加密码条件
			if (password != null && !password.isEmpty()) {
				user.setUpassword(password);
			} else {
				result = Result.failure("密码为空！！！");
				String json = gson.toJson(result);
				
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if(vcode!= null && !vcode.isEmpty()){
				if(!vcode.equalsIgnoreCase(realCode)){
					result = Result.failure("验证码错误！！！");
					String json = gson.toJson(result);
					
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return;
				}
			}else{
				result = Result.failure("验证码为空！！！");
				String json = gson.toJson(result);
				
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			
			User userShow = userBiz.selectSingle(user);// 保存用户信息
			if (userShow.getUid() == 0) {
				// 用户名不存在
				result = Result.failure("用户名或密码错误！！！", username);
				String json = gson.toJson(result);
				
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			if (userShow.getUstate() != 1) {
				result = Result.failure("您已被冻结或账号被删除！！！", username);
				String json = gson.toJson(result);
				
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			session.setAttribute("loginedUser", userShow);

			String adminType = null;
			if (userShow.getUtype() == 1) {
				adminType = "超级管理员";
			} else {
				adminType = "普通管理员";
			}
			String path = this.getServletContext().getContextPath();
			// 将项目名字放入会话中
			session.setAttribute("path", path);
			request.getSession().setAttribute("adminType", adminType);
			JoinServlet joinServlet = new JoinServlet();
			joinServlet.init(request, response);
			joinServlet.adminInit(request, response);
			// 保存登录
			/**
			 * Cookie cookie = new Cookie("loginedUsername",
			 * URLEncoder.encode(username, "GBK")); // 默认为临时Cookie,MaxAge<0 //
			 * 创建一个cookie对象 Cookie cookie01 = new Cookie("loginedPassword",
			 * password); // 解决Cookie存中文的乱码问题 cookie.setMaxAge(60);// 设置有效时间
			 * 1分钟f cookie01.setMaxAge(60); response.addCookie(cookie);//
			 * 将cookie添加到响应对象中 response.addCookie(cookie01);
			 * //从请求对象中获取浏览器发送回服务器的cookie数据 Cookie[]
			 * cookies=request.getCookies(); //Cookie loginedUserCookie=null;
			 * Cookie loginedPasswordCookie=null; if(cookies!=null){ for(Cookie
			 * cookie:cookies){
			 * if(cookie.getName().equalsIgnoreCase("loginedUsername")) {
			 * //解决读取中文乱码问题
			 * request.setAttribute("username",URLDecoder.decode(cookie.getValue
			 * (),"GBK")); } if("loginedPassword".equals(cookie.getName())){
			 * loginedPasswordCookie=cookie; } } }
			 */

			if (userShow.getUtype() != 1 && userShow.getUtype() != 5) {
				result = Result.success("用户登录成功！！！", username);
				String json = gson.toJson(result);
				
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			} else {
				
				Usercontrol usercontrolOld = new Usercontrol();
				usercontrolOld.setUid(userShow.getUid());
				List<Usercontrol> controlList = ucBiz.selectAll(usercontrolOld);

				List<Long> conList = new ArrayList<Long>();
				if (controlList != null) {
					for (Usercontrol ucon : controlList) {
						conList.add(ucon.getConid());
					}
				}
				// 管理员权限
				session.setAttribute("adminControl", conList);
				result = new Result("管理员登录成功！！！", 2);
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
		}
	}
	// TODO Auto-generated catch block
	private void init(HttpServletRequest request, HttpServletResponse response) throws IOException, BizException {
		// 获取系统当前时间
		HttpSession session = request.getSession();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss");
		Date date = new Date();
		String[] dateStr = df.format(date).split("/");
		// 将登录时间放入会话中
		session.setAttribute("date", dateStr);
		// 将各种状态的类型放入会话中
		String[] userType = { "", "", "普通用户", "铁牌用户", "铜牌用户",  "","银牌用户","金牌用户", "钻石用户", "蓝钻用户", "红钻用户" };
		int[] uType = { 2, 3, 4, 6, 7,8,9 ,10};
		session.setAttribute("userType", userType);
		session.setAttribute("uType", uType);
		String[] adminType = { "", "超级管理员", "", "", "" ,"普通管理员"};
		session.setAttribute("adminType", adminType);
		String[] userSex = { "保密", "男", "女" };
		session.setAttribute("userSex", userSex);
		String[] adminState = { "", "已启用", "已冻结", "已删除" };
		session.setAttribute("adminStateC", adminState);
		String[] bookState = { "未上架", "已上架", "已下架", "售罄", "审核不通过", "未审核" };
		session.setAttribute("bookState", bookState);
		//公告
		String[] noticeState  = {"未启用","启用"};
		session.setAttribute("noticeState", noticeState);
		// 管理员订单状态
		String[] eorderState = { "", "待付款", "待发货", "已发货", "待处理", "已退款", "已接收", "退货失败" };
		session.setAttribute("eoderState", eorderState);
		// 用户订单状态
		String[] userOrder = { "", "等待支付", "等待发货", "等待接收", "等待处理", "退款成功", "已接收", "退货失败" };
		session.setAttribute("userEorderState", userOrder);
		String[] eorderMessage = { "", "等待支付", "等待发货", "等待揽件", "等待处理", "退款成功", "买家已揽件", "条件不符合" };
		session.setAttribute("eoderMessage", eorderMessage);
		// 初始化大学，学院，专业
		Book book = new Book();
		List<Book> bookList_add = bookBiz.selectAll(book);
		HashSet<String> bookUniver = new HashSet<String>();
		HashSet<String> bookUcollage = new HashSet<String>();
		HashSet<String> bookUmagor = new HashSet<String>();
		for (Book bookSet : bookList_add) {
			if (null != bookSet.getBuniversity() && !bookSet.getBuniversity().isEmpty()) {
				bookUniver.add(bookSet.getBuniversity());
			}
			if (null != bookSet.getBucollege() && !bookSet.getBucollege().isEmpty()) {
				bookUcollage.add(bookSet.getBucollege());
			}
			if (null != bookSet.getBumajor() && !bookSet.getBumajor().isEmpty()) {
				bookUmagor.add(bookSet.getBumajor());
			}
		}
		session.setAttribute("userUni", bookUniver);
		session.setAttribute("userUcol", bookUcollage);
		session.setAttribute("userUmar", bookUmagor);

		// 初始化书籍类型
		// 书籍类型
		BookType bookType = new BookType();
		bookType.setBtstate(1);
		List<BookType> bookTypes = btBiz.selectAll(bookType);
		session.setAttribute("btypes", bookTypes);
		String[] type = new String[1000];
		String btname =null;
		Set<BookType> bookTypeSecond = new HashSet<BookType>();
		for (BookType bt : bookTypes) {
			if (bt.getBtnamethird() != null && !bt.getBtnamethird().isEmpty()) {
				btname = bt.getBtnamethird();
			} else if (bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()) {
				btname = bt.getBtnamesecond();
			} else {
				btname = bt.getBtname();
			}
			if(bt.getBtname().equals("教材区") && bt.getBtnamesecond() != null && !bt.getBtnamesecond().isEmpty()){
				bookTypeSecond.add(bt);
			}
			type[(int) bt.getBtid()] = btname;
		}
		session.setAttribute("btTypeEdit", type);//存储所有的类型
		session.setAttribute("teachSecond", bookTypeSecond);//存储教材区所有子类型
		// 公告展示初始化公告
		Notice notice = new Notice();
		notice.setNstate(1);
		List<Notice> nList;
		nList = noticeBiz.selectAll(notice);
		List<Notice> nShow = new ArrayList<Notice>();
		if (nList.size() != 0) {
			for (int i = 0; i < nList.size(); i++) {
				if (i == 6) {
					break;
				}
				nShow.add(nList.get(i));
			}
		}
		// 存储最新的六个公告展示出来
		session.setAttribute("noticeShow", nShow);
		Page<Notice> pageNotice = noticeBiz.noticePage(1, 3, notice);
		session.setAttribute("noticePage", pageNotice);
		// 初始化支付类型

		PayType payType = new PayType();
		payType.setEopaystate(1);
		List<PayType> payTypeList = payTypeBiz.selectAll(payType);
		session.setAttribute("payType", payTypeList);
		// list页面书籍
		Book bookList = new Book();
		bookList.setBstate(1);
		Page<Book> page2 = bookBiz.bookPage(1, 21, bookList);
		session.setAttribute("listBookPage", page2);
		// 用户index初始数据
		// 书籍展示
		BookChild bookChild = new BookChild();
		bookChild.setBstate(1);
		// 教材区
		bookChild.setBtname("教材区");
		Page<Book> pPage = bookBiz.bookChildPage(1, 12, bookChild);
		session.setAttribute("teachBook", pPage.getData());
		session.setAttribute("teachPage", pPage);

		// 工具书
		bookChild.setBtname("工具书区");
		Page<Book> pPaget = bookBiz.bookChildPage(1, 7, bookChild);
		session.setAttribute("toolBook", pPaget.getData());
		session.setAttribute("toolPage", pPaget);
		// 分享区
		bookChild.setBtid(Long.parseLong("3"));
		Page<Book> pPages = bookBiz.bookPage(1, 7, bookChild);
		session.setAttribute("shareBook", pPages.getData());
		session.setAttribute("sharePage", pPages);

		// 用户已发布书籍展示
		User userOld = (User) session.getAttribute("loginedUser");
		Book userBook = new Book();
		Page<Book> page;
		if (userOld.getUid() != 0) {
			userBook.setUid(userOld.getUid());
		} else {
			userBook.setUid(0);
		}
		page = bookBiz.bookPage(1, 5, userBook);
		session.setAttribute("userBookPage", page);

		// 查询所有订单订单信息
		Eorder eorder = new Eorder();
		eorder.setUid(userOld.getUid());
		Page<Eorder> Page = eorderBiz.eorderPage(1, 3, eorder);
		session.setAttribute("userOrderPage", Page);
		// 购物车信息显示
		Bought bought = new Bought();
		bought.setUid(userOld.getUid());
		bought.setCartstate(1);
		Page<Bought> pageCart = eorderitemBiz.ePage(1, 5, bought);
		session.setAttribute("cartPage", pageCart);
		bought.setCartstate(2);
		List<Bought> listEo = eorderitemBiz.selectAllCart(bought);
		session.setAttribute("userCart", listEo);
		
	}
	// TODO Auto-generated catch block
	// 管理员页面的信息展示初始化
	public void adminInit(HttpServletRequest request, HttpServletResponse response) throws IOException, BizException {
		HttpSession session = request.getSession();
		// 获取用户信息
		User user = new User();
		// 获取user表所有信息存储在会话中
		List<User> customerExit = userBiz.selectAll(user);// 存储所有用户信息
		// 存储管理员所有信息
		user.setUtype(1);
		List<User> adminListAll = userBiz.selectAll(user);
		user.setUtype(5);
		List<User> adminList = userBiz.selectAll(user);
		int [] adminSize = new int[1000];
		adminSize[0] = adminListAll.size();
		adminSize[1] = adminList.size();
		session.setAttribute("adminSize",adminSize);
		if (adminList.size() != 0) {
			for (User u : adminList) {
				adminListAll.add(u);
			}
		}
		session.setAttribute("adminAll", adminListAll);// 存储所有管理员信息
		// 存储所有用户信息
		for (int i = 0; i < customerExit.size(); i++) {
			for (int j = 0; j < adminListAll.size(); j++) {
				if (customerExit.get(i).equals(adminListAll.get(j)) &&  customerExit.get(i).hashCode() == adminListAll.get(j).hashCode()) {
					customerExit.remove(i);
					// 此时需注意，因为list会动态变化不像数组会占位，所以当前索引应该后退一位
						i--;
						break ;
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
		// 获取书籍信息
		Book book = new Book();
		List<Book> bookAll = bookBiz.selectAll(book);
		session.setAttribute("bookAll", bookAll);// 存储所有书籍
		// 获取全部订单数
		OrderDetial eorder1 = new OrderDetial();
		String[] date = (String[]) session.getAttribute("date");
		eorder1.setEotime(date[0]);
		List<OrderDetial> eorderList = eorderBiz.selectAllDetail(eorder1);
		session.setAttribute("eorderAll", eorderList);// 存一年所有的订单信息
		double num = 0.0;
		if (eorderList.size() != 0) {
			for (OrderDetial oShow : eorderList) {
				num = num + oShow.getTotal();// 存储销售总额
			}
		}
		session.setAttribute("eorderTotal", num);// 存储每一年销售总价
		// eorderList保存着全部订单
		// 状态1.待付款2.待发货3.已发货4.退货申请中5.退款成功6.已接收7.退货失败
		long[] count = { 0, 0, 0, 0, 0 };
		for (OrderDetial eo : eorderList) {
			if (eo.getEostate() == 1) {
				// 待结算订单eotype==1
				count[2] = count[2] + 1;
			} else if (eo.getEostate() == 2) {
				// 待发货订单eostate == 2
				count[1] = count[1] + 1;
			} else if (eo.getEostate() == 4) {
				// 未处理订单eostate == 4
				count[0] = count[0] + 1;
			} else if (eo.getEostate() == 6 || eo.getEostate() == 3) {
				// 已成交订单数eostate == 6
				count[3] = count[3] + 1;
			} else if (eo.getEostate() == 5) {
				// 交易失败eostate == 5
				count[4] = count[4] + 1;
			}
		}
		session.setAttribute("eorderCount", count);// 存储每一状态数值
		//存储不是退款操作的订单
		List<OrderDetial> order_show = eorderBiz.selectAllDetail(eorder1);
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
		// bookList存储所有书籍信息
		// bstate;//状态(1可用，2.删除3.售罄)
		long[] bookCount = { 0, 0, 0 };
		for (Book book1 : bookAll) {
			if (book1.getBstate() == 3) {
				bookCount[0] = bookCount[0] + 1;
			} else if (book1.getBstate() == 1) {
				bookCount[1] = bookCount[1] + 1;
			} else if (book1.getBstate() == 2) {
				bookCount[2] = bookCount[2] + 1;
			}
		}
		session.setAttribute("bookCount", bookCount);// 存储每一状态数值

		// 公告展示
		Notice notice = new Notice();
		List<Notice> nList = noticeBiz.selectAll(notice);
		List<Notice> nShow = new ArrayList<Notice>();
		session.setAttribute("noticeAll", nList);// 存储所有公告
		if (nList.size() != 0) {
			for (int i = 0; i < nList.size(); i++) {
				if (i == 6) {
					break;
				}
				nShow.add(nList.get(i));
			}
		}
		// 存储最新的六个公告展示出来
		session.setAttribute("noticeShow", nShow);
		// 管理员看到的修改的类型
		BookType bType = new BookType();
		bType.setBtname("教材区");
		List<BookType> btypes = btBiz.selectAll(bType);
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
		BookType bookType = new BookType();
		List<BookType> bookTypes = btBiz.selectAll(bookType);
		session.setAttribute("adminBtypes", bookTypes);
		String[] type = new String[1000];
		String btname = null;
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
		
		//管理员权限
		/*
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
		session.setAttribute("btTypeEdit", type);*/
		Control control = new Control();
		control.setConstate(1);
		List<Control> controls = controlBiz.selectAll(control);
		session.setAttribute("controls", controls);
		String[] cString = new String[1000];
		String cname = null;
		for (Control c : controls) {
			if(c.getConamesecond() != null && !c.getConamesecond().isEmpty()){
				cname = c.getConamesecond();
			}else if(c.getConame() != null && !c.getConame().isEmpty()){
				cname = c.getConame();
			}
			cString[(int) c.getConid()] = cname;
		}
		session.setAttribute("controlType", cString);
	}
}
