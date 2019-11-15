package com.yc.favorite.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import com.yc.favorite.bean.Tag;
import com.yc.favorite.util.MyBatisHelper;


public class TagMapperTest {
	@Test
	public void testInsert() {
		SqlSession session=MyBatisHelper.getSession();
		try {
			TagMapper tm=session.getMapper(TagMapper.class);
			
			Tag tag=new Tag();
			tag.settName("”È¿÷");
			tag.settCount(0);
			
			tm.insert(tag);
			
			session.commit();
			Assert.assertNotNull(tag.gettId());
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
	}
	@Test
	public void testSelectAll() {
		SqlSession session=MyBatisHelper.getSession();
		try {
			TagMapper tm=session.getMapper(TagMapper.class);
			List<Tag> fList=tm.selectAll();
			Assert.assertEquals(3, fList.size());
			Assert.assertEquals(1, fList.get(0).getFlist().size());
			Assert.assertEquals("Ã‘±¶", fList.get(0).getFlist().get(0).getfLabel());
		}finally {
			session.close();
		}
	}
}