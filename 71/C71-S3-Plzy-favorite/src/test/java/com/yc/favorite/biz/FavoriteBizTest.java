package com.yc.favorite.biz;

import org.junit.Assert;
import org.junit.Test;

import com.yc.favorite.bean.Favorite;


public class FavoriteBizTest {
	/**
	 * 添加链接的需求分析
	 * tags 字段：娱乐，军事，购物
	 * 1、判断tag是否存在
	 * 2、不存在则insert
	 * 3、存在则update
	 * 添加favorite
	 * insert
	 * 
	 */
	@Test
	public void testInsert() {
		FavoriteBiz biz=new FavoriteBiz();
		Favorite f=new Favorite();
		f.setfLabel("淘宝");
		f.setfUrl("www.taobao.com");
		f.setfTags("购物，剁手，娱乐");
		f.setfDesc("好网站");
		biz.addFavorite(f);
		Assert.assertNotNull(f.getfId());
	}
}
