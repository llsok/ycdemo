package com.yc.index.web;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name="sc-user",fallback = UserAction.class)
public interface IUserAction {
	
	@GetMapping("user/way")
	public String user();

}
