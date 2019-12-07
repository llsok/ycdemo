package com.yc.springmvc.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.springmvc.bean.SelectItem;
import com.yc.springmvc.bean.Topic;
import com.yc.springmvc.bean.User;

@Controller
@SessionAttributes(names = "user", types = Topic.class)
public class UserAction {

	@ResponseBody   // ctrl + f5 强制刷新页面
	// 127.0.0.1/login?uname=yc&upass=123
	@GetMapping(path = "login", produces = "text/html;charset=utf-8")
	public String login(User user, Model m) {
		if ("yc".equals(user.getUname()) && "123".equals(user.getUpass())) {
			// 讲用户对象保存到数据模型中
			m.addAttribute("user", user);
			Topic t = new Topic();
			t.setTitle("会话中的topic");
			m.addAttribute("t", t);
			return "登录成功";
		} else {
			return "登录失败";
		}
	}

	/**
	 * ModelAndView 模型 + 视图 强制进行页面挑战
	 * 
	 * @return
	 */
	@GetMapping("test")
	public ModelAndView test() {
		return new ModelAndView("test");
	}

	@ResponseBody
	@GetMapping("test1")
	public String test1(@SessionAttribute("user") User user, @SessionAttribute("t") Topic topic) {
		return user.getUname() + "<br>" + user.getUpass() + "<br>" + topic.getTitle();
	}
	
	@ResponseBody
	@PostMapping("reg.do")
	public String reg(User user, 
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException{
		
		String fn = file.getOriginalFilename(); // 获取文件名   1.jpg
		file.getName();				// 获取字段名    name="file"
		//file.getInputStream();	// 获取输入流
		file.getSize();				// 获取文件大小
		
		String path = "/upload/" + fn;	// web 路径转成 磁盘路径
		path = request.getServletContext().getRealPath(path);
		System.out.println(path);
		File fileObj = new File(path);
		file.transferTo(fileObj);
		
		return "reg success";
	}
	
	@GetMapping("toreg.do")
	public String toReg(){
		return "reg";
	}
	
	
	@GetMapping("tomod.do")
	public String toMod( Model m){
		
		User user = new User();
		user.setUname("武松");
		user.setUpass("123");
		user.setRegtime("2019-12-12");
		// "user" ==> from:from modelattribute="user"
		m.addAttribute("user",user);
		
		user.setHead("广东");
		
		user.setGender(1);
		
		String[] sheng = {"湖南","湖北","广东","广西"};
		
		SelectItem[] gender = {
				new SelectItem("男","1"),
				new SelectItem("女","0")};
		
		m.addAttribute("sheng",sheng);
		
		m.addAttribute("gender",gender);
		
		return "reg";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
