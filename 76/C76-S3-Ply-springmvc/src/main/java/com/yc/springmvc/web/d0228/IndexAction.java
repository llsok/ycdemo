package com.yc.springmvc.web.d0228;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * springMVC的控制器, 是控制层的组件
 */
@Controller  // @RestController 是  @Controller 的子类
public class IndexAction {

	@RequestMapping({"/","hello.s"})
	public String hello() {
		return "hello";  // 返回视图名
	}
	
	/**
	 * 带目录的地址( 虚拟地址 )
	 */
	@RequestMapping("/page/hello1")
	public String hello1() {
		return "hello";  // 返回视图名
	}
	
	/**
	 *  多个地址
	 */
	@RequestMapping({"abc","efg"})
	public String hello2() {
		return "hello";  // 返回视图名
	}
	
	/**
	 * method 限定 HTTP 的方法类型 get post  delete put...
	 */
	@RequestMapping(path="hello2",method=RequestMethod.GET)
	public String hello3() {
		return "hello";  // 返回视图名
	}
	
	// 映射 GET 请求
	@GetMapping("hello3")
	public String hello4(){
		return "hello"; 
	}
	
	// 映射 POST 请求
	@PostMapping("hello4")
	public String hello5(){
		return "hello"; 
	}
	
}
