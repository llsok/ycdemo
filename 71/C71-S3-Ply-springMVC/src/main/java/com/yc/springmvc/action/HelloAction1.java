package com.yc.springmvc.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller 注解表该类下的所有的方法的返回值，都会被视图解析器所解析
 * @author Administrator
 *
 */
@Controller
public class HelloAction1 {
	
	/**
	 * 以请求转发的方式跳转该页面  /WEB-INF/jsp/hello.jsp
	 * http://127.0.0.1/C71-S3-Ply-springmvc/hello.do?name=张三
	 * 接受请求参数直接国通方法参数接收（DI 接口注入）
	 * Model 对象用于向页面推送数据
	 * @return
	 */
	@RequestMapping("hello.do")
	public String hello(String name, Model model){
		System.out.println("name="+name);
		model.addAttribute("uname",name);
		String[] citys = {"衡阳","长沙","株洲"};
		model.addAttribute("citys",citys);
		return "hello";
	}

}
