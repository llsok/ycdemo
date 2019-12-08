package com.yc.springmvc.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	//@ResponseBody
	@PostMapping("reg.do")
	public String reg(@Valid User user, Errors errors,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException{
		
		if(errors.hasErrors()){
			return "reg";
		}
		
		String fn = file.getOriginalFilename(); // 获取文件名   1.jpg
		file.getName();				// 获取字段名    name="file"
		//file.getInputStream();	// 获取输入流
		file.getSize();				// 获取文件大小
		
		if(fn!= null && fn.isEmpty() == false){
			String path = "/upload/" + fn;	// web 路径转成 磁盘路径
			path = request.getServletContext().getRealPath(path);
			System.out.println(path);
			File fileObj = new File(path);
			file.transferTo(fileObj);
		}
		
		return "success";
	}
	
	@GetMapping("toreg.do")
	public String toReg(){
		return "reg";
	}
	
	
	@GetMapping("tomod.do")
	public String toMod(@ModelAttribute User user){
		// User user = (User) m.asMap().get("user");
		user.setUname("武松");
		user.setUpass("123");
		//user.setRegtime("2019-12-12");
		user.setHead("广东");
		user.setGender(1);
		return "reg";
	}
	
	@ModelAttribute
	/**
	 * 1、该方法会在所有控制器方法执行前，先执行
	 * 2、该方法的返回值会被放到请求作用域中  request
	 */
	public void init(Model m){
		User user = new User();
		String[] sheng = {"湖南","湖北","广东","广西"};
		SelectItem[] gender = {
				new SelectItem("男","1"),
				new SelectItem("女","0")};
		// "user" ==> from:from modelattribute="user"
		m.addAttribute("user",user);
		m.addAttribute("sheng",sheng);
		m.addAttribute("gender",gender);
	}
	
	// 该方法实现自定义的类型转换
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// 添加日期类型转换
		binder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
