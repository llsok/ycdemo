package com.yc.springboot.C71S3PlyBlog.web;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
	
	@Autowired
    private JavaMailSender mailSender;
    @Value("${mail.fromMail.addr}")
    private String from;

    @PostMapping("sendEmail")
    public String sendSimpleMail(String to, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        mailSender.send(message);
        return "success";
    }
    
    /**
     * 使用SpringBoot的邮件功能实现用户忘记密码时, 给用户发送一封包含一个验证码的邮件, 
     * 在用户重置密码时, 必须填写邮件里面的验证码, 验证码正确才允许重置密码
     */
    

}
