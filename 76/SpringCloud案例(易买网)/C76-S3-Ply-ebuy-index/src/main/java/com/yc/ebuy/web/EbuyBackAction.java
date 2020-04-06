package com.yc.ebuy.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import com.yc.ebuy.bean.EasybuyNews;
import com.yc.ebuy.bean.EasybuyProduct;
import com.yc.ebuy.bean.EasybuyProductCategory;

@Component
public class EbuyBackAction implements IEbuyBackAction {

	@Override
	public List<EasybuyProductCategory> getPc() {
		/**
		 * 参考实现: 用 redis 缓存 以前查询的商品分类
		 */
		List<EasybuyProductCategory> list = new ArrayList<>();
		list.add(new EasybuyProductCategory(1, "化妆品"));
		list.add(new EasybuyProductCategory(2, "箱包"));
		list.add(new EasybuyProductCategory(3, "保健食品"));
		list.add(new EasybuyProductCategory(4, "电子商品"));
		list.add(new EasybuyProductCategory(5, "进口食品,生鲜"));
		return list;
	}

	@Override
	public List<EasybuyNews> getNews() {
		return null;
	}

	@Override
	public List<EasybuyProduct> getHotP() {
		return null;
	}

	@Override
	public EasybuyProduct product(int id) {
		return null;
	}

}
