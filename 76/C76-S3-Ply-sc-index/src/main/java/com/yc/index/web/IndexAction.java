package com.yc.index.web;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class IndexAction {
	
	@Resource
	private RestTemplate restTemplate;

	@GetMapping("index/way")
	public String index() {
		return "index";
	}
	
	@GetMapping("user/way")
	public String user() {
		String url = "http://127.0.0.1:8001/user/way";
		// 后台远程调用
		String ret = restTemplate.getForObject(url, String.class);
		return ret;
	}
}
