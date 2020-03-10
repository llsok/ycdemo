package com.yc.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexAction {

	@GetMapping({"/","index","index.html"})
	public String index() {
		return "index";
	}
	
}
