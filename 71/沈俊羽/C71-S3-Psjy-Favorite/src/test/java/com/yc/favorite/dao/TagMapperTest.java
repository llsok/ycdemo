package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.sjy.favorite.bean.Favorite;
import com.sjy.favorite.bean.Tag;
import com.sjy.favorite.dao.TagMapper;
import com.sjy.favorite.util.MyBatisHelper;

public class TagMapperTest {

	private SqlSession session;
	private TagMapper tm;
	
	@Before
	public void before() {
		session=MyBatisHelper.getSession();
		tm=session.getMapper(TagMapper.class);
	}
	
	@After
	public void after() {
		session.close();
	}
	
	@Test
	public void testInsert() {
		try {
			Tag tag=new Tag();
			tag.settName("嘿嘿嘿");
			tag.settCount(0);
			
			tm.insert(tag);
			
			Assert.assertNotNull(tag.gettId());
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
	}
	
	@Test
	public void testSelectAll() {
		List<Tag> fList= tm.selectAll();
		
		Assert.assertEquals(3, fList.size());
		Assert.assertEquals(1, fList.get(0).getfList().size());
		Assert.assertEquals("淘宝", fList.get(0).getfList().get(0).getfLabel());
	}
}
