package com.yc.favorite.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import com.yc.favorite.bean.Tag;
import com.yc.favorite.util.MyBatisHelper;

public class TagMapperTest {
	
	@Test
	public void testInsert(){
		SqlSession session  = MyBatisHelper.getSession();
		try {
			TagMapper tm = session.getMapper(TagMapper.class);
			Tag tag = new Tag();
			tag.settName("娱乐");
			tag.settCount(0);
			tm.insert(tag);
			Assert.assertNotNull(tag.gettId());
			session.commit();
		} catch( Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

}
