package com.yc.springmvc.web.d0229;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yc.springmvc.bean.Hall;

@RestController
public class ParamAction {

	/**
	 * SpringMVC 使用接口注入, 直接将请求参数注入到方法参数中:
	 * 1, 请求参数名必须和方法参数名一致
	 * 2, 参数的类型必须兼容
	 * 3, 如果名称不同则使用 @RequestParam 标注
	 * 4,SpringMVC支持地址参数
	 * @return
	 */
	@GetMapping("login")
	public String login(String user, String pwd) {
		return "user = " + user + "   pwd = " + pwd;
	}

	@GetMapping(path = "login1", params = "username")
	public String login1(@RequestParam("username") String user, String pwd) {
		return "user = " + user + "   pwd = " + pwd;
	}

	/**
	 * 	地址参数
	 */
	@GetMapping("login2/{username}/{password}")
	public String login2(@PathVariable("username") String user, @PathVariable("password") String pwd) {
		return "user = " + user + "   pwd = " + pwd;
	}

	/**
	 * 	高级参数接收的潜规则: 
	 * 	自动装箱 :  请求参数名称与对象的属性名一致, 类型兼容
	 * 	Integer i = 100;
	 * 
	 */
	@PostMapping("saveHall")
	public Hall saveHall(Hall hall) {
		// 将 hall 转成 json 字符串
		hall.setCapacity(10000);
		hall.setCinemaId(2222);
		return hall;
	}

	
	/**
	 * 	嵌套熟悉提交格式参考
	  	影院ID:<input name="cinema.id"><br>
		影院名称:<input name="cinema.name"><br>
		影院GPS:<input name="cinema.gps"><br>
	 */
	
	/**
	 * 	获取 Cookie 值
	 */
	@GetMapping("cookie")
	public String cookie(@CookieValue("JSESSIONID") String sessionid) {
		return "JSESSIONID : " + sessionid;
	}

	/**
	 * 	获取 请求头域 值
	 */
	@GetMapping("header")
	public String header(@RequestHeader("Host") String host, 
			@RequestHeader("Accept") String accpet) {
		return "host : " + host + "  Accpet : " + accpet;
	}

	/**
	 * 	注入 原生的 Servlet 对象( 请求, 响应,  会话,  输入流,  输出流 )
	 */
	@GetMapping("servlet")
	public String servlet(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		return req + "<br>=====<br>" + resp + "<br>=====<br>" + session + "<br>=====<br>";
	}

}
