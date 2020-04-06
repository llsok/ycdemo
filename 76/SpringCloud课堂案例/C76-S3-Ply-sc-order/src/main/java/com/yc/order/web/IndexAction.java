package com.yc.order.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexAction {

	@GetMapping("order/way")
	public String index() {
		return "order";
	}
	
}
