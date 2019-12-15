package com.yc.springboot.C71S3PlySpringBoot.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HelloAction {
	
	@GetMapping("hello")
	public String hello(){
		return "hello world!";
	}
	
	@GetMapping("/")
	public ModelAndView index(ModelAndView mav){
		mav.setViewName("index");
		return mav;
	}

}
