package com.yc.favorite.dao;

import org.junit.Assert;
import org.junit.Test;

import com.sjy.favorite.bean.Favorite;
import com.sjy.favorite.biz.FavoriteBiz;

public class FavoriteBizTest {
	
	@Test
	public void testInsert() {
		FavoriteBiz biz=new FavoriteBiz();
		Favorite f=new Favorite();
		f.setfLabel("淘宝");
		f.setfUrl("www.taobao.com");
		f.setfTags("购物,剁手，娱乐");
		f.setfDesc("好网站");
		biz.addFavorite(f);
		f=new Favorite();
		f.setfLabel("网易");
		f.setfUrl("www.163.com");
		f.setfTags("门户,军事，国际");
		f.setfDesc("好网站");
		biz.addFavorite(f);
		f=new Favorite();
		f.setfLabel("新浪");
		f.setfUrl("www.sina.com");
		f.setfTags("门户,经济，娱乐");
		f.setfDesc("好网站");
		biz.addFavorite(f);
		//Assert.assertNotNull(f.getfId());
	}
}
