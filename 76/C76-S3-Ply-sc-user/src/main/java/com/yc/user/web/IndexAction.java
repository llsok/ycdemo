package com.yc.user.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexAction {

	@GetMapping("user/way")
	public String index() {
		return "user";
	}
	
}
