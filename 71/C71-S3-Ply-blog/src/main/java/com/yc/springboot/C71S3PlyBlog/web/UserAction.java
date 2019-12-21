package com.yc.springboot.C71S3PlyBlog.web;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.springboot.C71S3PlyBlog.bean.User;
import com.yc.springboot.C71S3PlyBlog.biz.BizException;
import com.yc.springboot.C71S3PlyBlog.biz.UserBiz;
import com.yc.springboot.C71S3PlyBlog.vo.Result;


@RestController
@SessionAttributes("loginedUser")
public class UserAction {
	
	@Resource
	private UserBiz uBiz;
	
	@PostMapping("login")
	public Result login(@Valid User user, Errors errors, Model m){
		try {
			
			if(errors.hasErrors()){
				return new Result(2,"表单验证错误",errors.getFieldErrors());
			}
			
			user = uBiz.login(user);
			m.addAttribute("loginedUser",user);
			return new Result(1,"登录成功！", user);
		} catch (BizException e) {
			e.printStackTrace();
			return new Result(0,e.getMessage());
		} catch (RuntimeException e){
			e.printStackTrace();
			return new Result(0,"业务繁忙，稍后再试");
		}
	}
	

}
