package com.yc.ebuy.web;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import com.yc.ebuy.bean.EasybuyNews;
import com.yc.ebuy.bean.EasybuyProductCategory;

@FeignClient(name = "ebuy-back", fallback = EbuyBackAction.class)
public interface IEbuyBackAction {
	/**
	 * http://ebuy-back/getPc
	 * @return
	 */
	@GetMapping("getPc")
	public List<EasybuyProductCategory> getPc();
	
	@GetMapping("getNews")
	public List<EasybuyNews> getNews();
}
