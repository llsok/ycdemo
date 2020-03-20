package com.yc.index.web;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

@RestController
public class IndexAction {
	
	@Resource
	private RestTemplate restTemplate;

	@GetMapping("index/way")
	public String index() {
		return "index";
	}
	
	@GetMapping("user/way")
	@HystrixCommand(fallbackMethod="wayHystirx")
	public String user() {
		// 使用服务名替代 ip + 端口
		String url = "http://sc-user/user/way";
		// 后台远程调用
		String ret = restTemplate.getForObject(url, String.class);
		return ret;
	}
	
	public String wayHystirx() {
		return "服务器熔断, 服务降级了！！";
	}
	
	@Resource
	private IUserAction iua;
	
	@GetMapping("fuser/way")
	public String fuser() {
		return iua.user();
	}
	
	
	
	
	
	
	
	
	
}
