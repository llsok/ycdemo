package com.yc.springmvc.action;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.yc.springmvc.bean.User;

/**
 * 测试  xxxAttribute 相关注解
 * @author Administrator
 *
 */
@RestController
public class AttributeAction {
	
	/**
	 * ModelAttribute
	 * 	1、方法上：表示该方法将会在每一个控制器方法执行前执行
	 * 			并且该方法的放回对象，会被添加"请求作用域"中
	 * 	2、参数上：表示从请求作用域获取一个对象
	 */
	
	@ModelAttribute("user")
	public User initUser(String userid    /*, Model m*/   ){
		System.out.println("=====================");
		User user;
		if(userid==null){
			user = new User();
		} else {
			// 从数据库查询该用户对象
			user = new User();
			user.setUname("关羽");
			user.setUpass("123");
		}
		/*m.addAttribute("user", user);*/
		return user;
	}
	
	/**
	 * @ModelAttribute 加在方法参数上时：表示从请求作用域获取一个对象
	 */
	@GetMapping("craete.do")
	public String createUser(@ModelAttribute("user") User user){
		return "createUser:" + user;
	}
	
	@GetMapping(path="modify.do",produces="text/html;charset=utf-8")
	public String modifyUser(@ModelAttribute("user") User user){
		return "modifyUser:" + user;
	}
	

}
