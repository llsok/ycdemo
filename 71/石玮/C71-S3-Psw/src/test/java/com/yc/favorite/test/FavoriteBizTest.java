package com.yc.favorite.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import com.yc.favorite.bean.Favorite;
import com.yc.favorite.biz.FavoriteBiz;
import com.yc.favorite.dao.FavoriteMapper;
import com.yc.favorite.util.MyBatisHelper;


/**
 * ������ӵ��������
 * tags �ֶΣ�  ���֣����£�����
 * 	1���ж� tag �Ƿ����
 * 	2����������insert
 * 	3��������upldate
 * ��� favorite
 * 	insert 
 * 
 * 
 *
 */

public class FavoriteBizTest {

	@Test
	public void testInsert(){
		FavoriteBiz biz = new FavoriteBiz();
		Favorite f = new Favorite();
		f.setfLabel("b站");
		f.setfUrl("www.bilibili.com");
		
		f.setfDesc("2次元聚集地");
		biz.addFavorite(f);
		Assert.assertNotNull(f.getfId());
	}
	
	@Test
	public void selectByTagName() {
	SqlSession session = MyBatisHelper.getSession();
	FavoriteMapper fm = session.getMapper(FavoriteMapper.class);
	
		List<Favorite> flist = fm.selectByTagName("����");
		Assert.assertEquals("�Ա�", flist.get(0).getfLabel()	);
		
		
	}
}
