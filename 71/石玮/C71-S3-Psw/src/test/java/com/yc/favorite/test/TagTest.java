package com.yc.favorite.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.yc.favorite.bean.Tag;
import com.yc.favorite.dao.TagMapper;
import com.yc.favorite.util.MyBatisHelper;

public class TagTest {
	
	private SqlSession  session;
	@Before
	public void before() throws IOException{
		// ��ʼ�� MyBatis ��
		String resource = "mybatis.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// SqlSessionFactoryBuilder �Ự�����Ĺ�����
		// SqlSessionFactory  �Ự����
		// SqlSession   �Ự
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		session = sqlSessionFactory.openSession();
	}
	
	@Test
	public void insertTest() {
		try {
			session = MyBatisHelper.getSession();
			TagMapper tm = session.getMapper(TagMapper.class	);
			Tag tag = new Tag();
			tag.settCount(0);
			tag.settName("����");
			tm.insert(tag);
			Assert.assertNotNull(tag.gettId());
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			session.rollback();
		}finally {
			session.close();
		}
		
	}
	
	@Test
	public void testSelect(){
		SqlSession session  = MyBatisHelper.getSession();
		try {
			TagMapper tm = session.getMapper(TagMapper.class);
			List<Tag> fList = tm.selectAll();
			Assert.assertEquals(3, fList.size());
			Assert.assertEquals(1, fList.get(0).getFavorites().size());		
			Assert.assertEquals("�Ա�",fList.get(0).getFavorites().get(0).getfLabel());
		} finally {
			session.close();
		}

}
	
	@Test
	public void testSelectAll(){
		SqlSession session  = MyBatisHelper.getSession();
		try {
			TagMapper tm = session.getMapper(TagMapper.class);
			List<Tag> fList = tm.selectAll();
			Assert.assertEquals(3, fList.size());
			Assert.assertEquals("娱乐",fList.get(0).gettName()	);
			System.out.println("=============="+fList.get(0).toString());
			Assert.assertEquals(1, fList.get(0).getFavorites().size());		
			Assert.assertEquals("淘宝",fList.get(0).getFavorites().get(0).getfLabel());
		} finally {
			session.close();
		}

}
}
