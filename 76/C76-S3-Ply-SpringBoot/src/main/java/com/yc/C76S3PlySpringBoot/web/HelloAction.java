package com.yc.C76S3PlySpringBoot.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloAction {
	
	@GetMapping({"hello"})
	public String hello() {
		return "hello world";
	}

}
