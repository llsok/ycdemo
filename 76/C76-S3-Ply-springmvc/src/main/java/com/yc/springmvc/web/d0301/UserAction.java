package com.yc.springmvc.web.d0301;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.yc.springmvc.bean.User;

@Controller("UserAction0301")
@SessionAttributes("loginedUser")
public class UserAction {

	@ModelAttribute
	public String init(Model model) {
		System.out.println("=================");
		User user = new User();
		user.setUsername("ly");
		user.setPassword("123");
		model.addAttribute("user", user);
		
		String[] likeItems = { "篮球", "跳舞", "唱歌", "看书", "手游" };

		List<String> eduItems = Arrays.asList(new String[] { "初中", "高中", "专科", "本科" });
		
		List<Subject> subjectItem = new ArrayList<>();
		subjectItem.add(new Subject(1,"计算机网络"));
		subjectItem.add(new Subject(2,"计算机应用计算"));
		subjectItem.add(new Subject(3,"财务管理"));
		subjectItem.add(new Subject(4,"市场营销"));
		subjectItem.add(new Subject(5,"企业管理"));
		
		model.addAttribute("likeItems", likeItems);
		model.addAttribute("eduItems", eduItems);
		model.addAttribute("subjectItems", subjectItem);
		
		/**
		 * 没有指定 model 中的数据的名字, 那么数据的类型就是名字
		 * 类名首字母小写,  String ===> string  User  ====> user
		 */
		return "你好";
	}

	/**
	 *	 打开登录窗口
	 */
	@GetMapping("tosign")
	public String tologin(@ModelAttribute("user") User user) {
		System.out.println(user);
		return "login";
	}

	@GetMapping("toSuccess")
	public String toSuccess(@SessionAttribute(required = false, value = "loginedUser") User user) {
		System.out.println("=========toSuccess=======");
		System.out.println(user);
		System.out.println("=========toSuccess=======");
		return "success";
	}

	/**
	 *  能够实现数据推送的对象:      Model,  ModelAndView,  Map
	 * 
	 * ModelAndView = Model  + view 
	 */
	@GetMapping("sign")
	public ModelAndView login(User user) {
		ModelAndView mav = new ModelAndView("redirect:toSuccess");
		if ("yc".equals(user.getUsername()) && "123".equals(user.getPassword())) {
			user.setEmail("12341234@QQ.COM");
			user.setPhone("18900001111");
			// 添加数据 ===> 会话
			mav.addObject("loginedUser", user);
			return mav;
		} else {
			mav.addObject("msg", "用户名或密码错误!");
			// 重新设置视图
			mav.setViewName("login");
			return mav;
		}
	}

	/*@PostMapping(path = "reg", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String register(User user, @RequestBody String reqBody) {
		System.out.println(user);
		System.out.println(reqBody);
		return "成功!";
	}*/

	@GetMapping("toreg")
	public String toreg(Model model, @ModelAttribute("user") User user) {
		// 设置默认值
		user.setLikes(new String[]{"跳舞","手游"});
		user.setEdu("本科");
		user.setSubject("3");
		return "reg";
	}
	
	@GetMapping("reg")
	public String reg(@Valid User user, Errors error) {
		// 判断是否有字段验证错误
		if(error.hasFieldErrors()) {
			return "reg";
		} else {
			return "success";
		}
	}

}
