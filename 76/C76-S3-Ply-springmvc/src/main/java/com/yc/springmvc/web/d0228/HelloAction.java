package com.yc.springmvc.web.d0228;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @RequestMapping 加在类上表示 ,  该类下所有的方法的映射地址的,  共同虚拟目录
 */
@RequestMapping("user/a/b")
@Controller
public class HelloAction {
	
	@GetMapping("hello")
	public String hello6(){
		return "hello"; 
	}
	@GetMapping("hello1")
	public String hello7(){
		return "hello"; 
	}
	@GetMapping("hello2")
	public String hello8(){
		return "hello"; 
	}
	
	/**
	 * params 限定该请求必须带的参数
	 * @return
	 */
	@RequestMapping(value="show",params="user")
	public String hello9(){
		return "hello"; 
	}
	
	@RequestMapping(value="show1",params="user=root")
	public String hello10(){
		return "hello"; 
	}
	
	@RequestMapping(value="show2",params="user!=root")
	public String hello11(){
		return "hello"; 
	}
	
}
