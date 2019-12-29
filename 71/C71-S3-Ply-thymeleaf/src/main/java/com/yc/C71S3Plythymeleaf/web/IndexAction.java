package com.yc.C71S3Plythymeleaf.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yc.C71S3Plythymeleaf.bean.User;

@Controller
public class IndexAction {

	@GetMapping({ "/", "login", "login.do" })
	public String login() {
		return "login";
	}

	@GetMapping({ "register" })
	public void reg(Model m) {

		String[] edu = { "初中", "高中", "大专", "本科", "硕士" };
		m.addAttribute("eduItems", edu);

		User user = new User();
		user.setInvite("1234");
		m.addAttribute(user);
		/**
		 * 练习题： 1、请生产爱好的多选框 2、请生成随机码 ==> 填写到验证码文本框中
		 */
		List<Map<String, String>> likes = new ArrayList<>();
		HashMap<String, String> like = new HashMap<>();
		like.put("id", "1");
		like.put("value", "读书");
		likes.add(like);
		like = new HashMap<>();
		like.put("id", "2");
		like.put("value", "看报");
		likes.add(like);
		like = new HashMap<>();
		like.put("id", "3");
		like.put("value", "学习");
		likes.add(like);
		m.addAttribute("likeItems", likes);

		String vcode = System.currentTimeMillis() + "";
		vcode = vcode.substring(vcode.length() - 4);
		m.addAttribute("vcode", vcode);
		
		
		List<String> a = new ArrayList<>();
		a.add("3");
		a.add("2");
		m.addAttribute("defaultLike",a);
		
		
	}

}
