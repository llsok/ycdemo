package com.yc.springmvc.action;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.springmvc.bean.Info;
import com.yc.springmvc.bean.Result;
import com.yc.springmvc.bean.User;

/**
 * 自动装箱：请求参数自动注入到对象中
 */
@Controller
public class ParamAction {
	
	@GetMapping("result.do")
	public String getResult(Result result, Model m){
		
		m.addAttribute("result", result);
		
		return "result";
	}
	
	@GetMapping("info.do")
	public String getInfo(Info info, Model m){
		
		m.addAttribute("info", info);
		
		return "info";
	}
	
	/**
	 * 根据 id 查询到指定用户，在页面展示
	 * 127.0.0.1/user_13
	 * 
	 * Map 可以替代   Model 
	 */
	@GetMapping("user_{id}")
	public String getUser( @PathVariable("id") String id, 
			Map<String,Object> map){
		
		User user = new User();
		
		user.setUserid(id);
		user.setUname("张飞");
		
		map.put("user", user);
		
		return "user1";
	}
	
	/**
	 * 返回 ajax 数据
	 * @RequestHeader 	获取请求头域值
		@CookieValue	获取指定的cookie值
	 */
	@ResponseBody
	@GetMapping("header.do")
	public String getHeader( 
			@RequestHeader("Connection")  String connection,
			@RequestHeader("Host")  String host,
			@CookieValue("JSESSIONID") String jsessionid){
		return connection + "  :  " + host + "  :  " + jsessionid;
	}
	
	/**
	 * 注入Sevlet对象：请求、响应、会话、输入流、输出流
	 * @return
	 */
	@ResponseBody
	@GetMapping("servlet.do")
	public String getHeader(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			InputStream in,
			OutputStream out){
		
		return request + "<br>" +
				response + "<br>" +
				session + "<br>" +
				in + "<br>" +
				out + "<br>";
		
	}
	

}
