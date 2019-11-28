package com.yc.springmvc.action;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 控制器类
 */
/**
 * @RestController 是 @Controller 语义组件注解的子类，它表示该类下所有方法，返回的数据都是json数据
 * 
 * SpringMVC 支持JSP配置，必须加上JSP视图解析器
 * 
 * 作业：将云收藏项目引入SpringMVC框架，使用SpringMVC实现请求响应（替换Servlet）
 * 
 */
@RestController
public class HelloAction {
	
	// 地址映射注解 127.0.0.1:8080/C71-S3-Ply-springmvc/hello
	@RequestMapping("hello")
	public String hello(){
		return "hello world";
	}

}
