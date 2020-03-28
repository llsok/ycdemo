package com.yc.ebuy.web;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yc.ebuy.bean.EasybuyNews;
import com.yc.ebuy.bean.EasybuyProduct;
import com.yc.ebuy.bean.EasybuyProductCategory;

@FeignClient(name = "ebuy-back", fallback = EbuyBackAction.class)
public interface IEbuyBackAction {
	/**
	 * http://ebuy-back/getPc
	 * @return
	 */
	@GetMapping("getPc")
	public List<EasybuyProductCategory> getPc();
	
	@GetMapping("getHotP")
	public List<EasybuyProduct> getHotP();
	
	@GetMapping("getNews")
	public List<EasybuyNews> getNews();
	
	@GetMapping("product")
	public EasybuyProduct product(@RequestParam("id")int id);
}
