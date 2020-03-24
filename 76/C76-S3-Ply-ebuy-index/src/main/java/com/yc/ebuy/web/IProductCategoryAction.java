package com.yc.ebuy.web;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import com.yc.ebuy.bean.EasybuyProductCategory;

@FeignClient("ebuy-back")
public interface IProductCategoryAction {
	/**
	 * http://ebuy-back/getPc
	 * @return
	 */
	@GetMapping("getPc")
	public List<EasybuyProductCategory> getPc();
}
