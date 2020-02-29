package com.yc.springmvc.web.d0229;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yc.springmvc.bean.User;

@Controller
public class UserAction {
	
	/**
	 *	 打开登录窗口
	 */
	@GetMapping("tologin")
	public String tologin() {
		return "login";
	}
	
	/**
	 *  能够实现数据推送的对象:      Model,  ModelAndView,  Map
	 * 
	 * ModelAndView = Model  + view 
	 */
	@GetMapping("signin")
	public ModelAndView login(User user) {
		ModelAndView mav = new ModelAndView("success");
		if("yc".equals(user.getUsername()) && "123".equals(user.getPassword())) {
			user.setEmail("12341234@QQ.COM");
			user.setPhone("18900001111");
			//添加数据
			mav.addObject("user", user);
			return mav;
		} else {
			mav.addObject("msg", "用户名或密码错误!");
			// 重新设置视图
			mav.setViewName("login");
			return mav;
		}
	}
	
	/*@GetMapping("signin")
	public String login(User user, Map<String,Object> map) {
		if("yc".equals(user.getUsername()) && "123".equals(user.getPassword())) {
			user.setEmail("12341234@QQ.COM");
			user.setPhone("18900001111");
			map.put("user", user);
			return "success";
		} else {
			map.put("msg", "用户名或密码错误!");
			return "login";
		}
	}*/
	
	/*@GetMapping("signin")
	public String login(User user, Model model) {
		if("yc".equals(user.getUsername()) && "123".equals(user.getPassword())) {
			user.setEmail("12341234@QQ.COM");
			user.setPhone("18900001111");
			model.addAttribute("user", user);
			return "success";
		} else {
			model.addAttribute("msg", "用户名或密码错误!");
			return "login";
		}
	}*/
}
