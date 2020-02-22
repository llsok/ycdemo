package com.yc.easyweb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yc.easyweb.bean.Book;
import com.yc.easyweb.bean.Result;
import com.yc.easyweb.bean.User;
import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.biz.BookBiz;
import com.yc.easyweb.biz.UserBiz;

public class RegServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserBiz userBiz = new UserBiz();
	private  Gson gson = new Gson();
	private Result result ;
	
	/**
	 * 检验用户名
	 * @param request
	 * @param response
	 */
	public void checkName(HttpServletRequest request, HttpServletResponse response){
		 User user = new User();
		 HttpSession session = request.getSession();
		String username = request.getParameter("username");
		try {
			if(username != null && !username.isEmpty()){
				user.setUname(username);
			}else{
				//用户名输入为空
				result = Result.failure("用户名为空！！！", username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			String reg = "^[\u4e00-\u9fa5a-zA-Z]{2,20}$";
			if (!username.matches(reg)) {
				result = Result.failure("用户名输入不合法！！！",username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
		
		
			User user2 = userBiz.selectSingle(user);
			if (user2.getUid() != 0) { // 说明用户名已经被使用
				result = Result.failure("已存在该用户！！！",username);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			} 
			
				result = Result.success("该用户名可以使用！！！", username);
				String json = gson.toJson(result);
				session.setAttribute("regUname", username);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				
		} catch (BizException e) {
			result = Result.error(e.getMessage(),username);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			try {
				response.getWriter().append(json);
			} catch (IOException e1) {
				throw new RuntimeException(e1);
				
			}
		} catch (IOException e) {
			result = Result.error("业务繁忙,请稍等几分钟再操作！！！",username);
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
	 * 检验电话
	 * @param request
	 * @param response
	 */
	public void checkPhone(HttpServletRequest request, HttpServletResponse response){
		 HttpSession session = request.getSession();
		String uphone = request.getParameter("uphone");
		String regphone = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
		 User user = new User();
		 try {
			if(uphone != null && !uphone.isEmpty()){
				if (!uphone.matches(regphone)) {
					result = Result.failure("电话号码不合法！！！",uphone);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				} 
				user.setUphone(uphone);
				User user2 = userBiz.selectSingle(user);
				if(user2.getUid() != 0){
					result = Result.failure("电话号码已被使用！！！",uphone);
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				}
				result = Result.success("该电话号码可以使用！！！", uphone);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				session.setAttribute("regUphone", uphone);
			}else{
				result = Result.failure("请输入电话号码！！！",uphone);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
		 } catch (BizException e) {
			 result = Result.error(e.getMessage(),uphone);
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

	//检查邮箱
	public void checkEmail(HttpServletRequest request, HttpServletResponse response){
		
		String uemail = request.getParameter("uemail");
		HttpSession session = request.getSession();
		User user = new User();
		String regemail = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";
		try {
			if(uemail !=null && !uemail.isEmpty()){
				user.setUemail(uemail);
			}else{
				result = Result.failure("请输入邮箱！！！",uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			//邮箱格式不合法！
			if (!uemail.matches(regemail)) {
				result = Result.failure("邮箱格式不合法！！！",uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}
			User user2 = userBiz.selectSingle(user);
			//该邮箱已被注册！
			if (user2.getUid() != 0) {
				result = Result.failure("该邮箱已被注册！！！",uemail);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			} 
			//该邮箱可以注册!
			session.setAttribute("regUemail", uemail);
			result = Result.success("该邮箱可以注册",uemail);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
		} catch (BizException e) {
			result = Result.error(e.getMessage(),uemail);
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
	
	//检查密码
	public void checkPassword(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String upassword = request.getParameter("upassword");
		String regpassword = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
		try {
			if(upassword != null && !upassword.isEmpty()){
				//不合法
				if (!upassword.matches(regpassword)) {
					result = Result.failure("密码不合法,请重新输入(必须包含数字和字母)！！！");
					String json = gson.toJson(result);
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().append(json);
					return ;
				} 
				//可以使用
				session.setAttribute("regUpwd", upassword);
				result = Result.success("该密码可以使用！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return;
			}else{
				//输入为空
				result = Result.failure("请输入密码！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
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

	
	//确认密码
	public void checkRePassword(HttpServletRequest request, HttpServletResponse response){
		String confirm = request.getParameter("confirm");
		String upassword = request.getParameter("upassword");
		HttpSession session = request.getSession();
		try {
			if(upassword == null ||  upassword.isEmpty()){
				result = Result.failure("请输入密码！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			if(confirm == null ||  confirm.isEmpty()){
				result = Result.failure("请确认密码！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			if ( !upassword.equals(confirm)) {
				result = Result.failure("密码不一致！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			} 
			result = Result.success("密码一致！！！");
			session.setAttribute("checkPwd", "1");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return ;
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

	/*
	 * 注册验证
	 */
	public void checkReg(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		
		String uname = (String)session.getAttribute("regUname");
		String uphone = (String)session.getAttribute("regUphone");
		String upassword = (String)session.getAttribute("regUpwd");
		String uemail = (String)session.getAttribute("regUemail");
		String check = "1";
		User user = new User();
		if(uname != null && !uname.isEmpty()){
			user.setUname(uname);
			check = check +"/1";
		}else{
			check = check +"/-1";
		}
		
		if(uphone != null && !uphone.isEmpty()){
			user.setUphone(uphone);
			check = check +"/1";
		}else{
			check = check +"/-1";//电话未输入或不合法
		}
		
		if(upassword != null && !upassword.isEmpty()){
			user.setUpassword(upassword);
			check = check +"/1";
		}else{
			check = check +"/-1";//密码未输入或不合法
		}
		
		if(uemail != null && !uemail.isEmpty()){
			user.setUemail(uemail);
			check = check +"/1";
		}else{
			check = check +"/-1";//邮箱
		}
		String university = request.getParameter("university");
		String ucollege = request.getParameter("ucollege");
		String umajor = request.getParameter("umajor");
		
		if(!university.equals("请选择你的大学")){
			user.setUniversity(university);
		}
		if(!ucollege.equals("请选择你的学院")){
			user.setUcollege(ucollege);
		}
		if(!umajor.equals("请选择你的专业")){
			user.setUmajor(umajor);
		}
		try {
			if(!check.equals("1/1/1/1/1")){
				result = Result.lack("未正确输入信息！！！", check);
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			// 获取系统当前时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			user.setUtime(df.format(date));
			String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
			String min = uuid.substring(0, 10);
			user.setUminname("用户"+min);
			user.setUtype(2);
			int code = userBiz.insert(user);
			if (code <= 0) {
				result = Result.failure("注册失败！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			result = Result.success("注册成功！！！");
			//会话还原
			String string = null;
			session.setAttribute("regUname", string);
			session.setAttribute("regUphone", string);
			session.setAttribute("regUpwd", string);
			session.setAttribute("regUemail", string);
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			
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

	public void showUser(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		BookBiz bookBiz = new BookBiz();
		Book book = new Book();
		HashSet<String> bookUniver = new HashSet<String>();
		HashSet<String> bookUcollage = new HashSet<String>();
		HashSet<String> bookUmagor = new HashSet<String>();
		List<Book> bookList_add;
		try {
			bookList_add = bookBiz.selectAll(book);
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
			
			if(bookList_add.size() >0){
				result = Result.success("数据已加载！！！");
				String json = gson.toJson(result);
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
				return ;
			}
			result = Result.failure("数据未加载,请刷新页面！！！");
			String json = gson.toJson(result);
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().append(json);
			return ;
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
		}catch (BizException e) {
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
