package com.yc.spring.test.ioc;

import java.util.Map;
import java.util.Set;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.spring.bbs.bean.Board;
import com.yc.spring.bbs.bean.Page;
import com.yc.spring.bbs.bean.User;

/**
 * 配置Spring，让测试方法全部测试通过
 */
public class E01IocForXmlTest {

	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("IOC01.xml");

	@Test
	public void test1() {
		User user = (User) context.getBean("myUser");
		Assert.assertNotNull(user);
		Assert.assertEquals("武松", user.getUname());
		Assert.assertEquals("abc123", user.getUpass());
		Assert.assertEquals("20.gif", user.getHead());
		Assert.assertEquals(Integer.valueOf(1), user.getGender());
	}

	// 必须设置主bean primary=true
	@Test
	public void test2() {
		User user = (User) context.getBean(User.class);
		Assert.assertNotNull(user);
		Assert.assertEquals("石秀", user.getUname());
		Assert.assertEquals("XYZ890", user.getUpass());
		Assert.assertEquals("345.gif", user.getHead());
		Assert.assertEquals(Integer.valueOf(0), user.getGender());
	}

	@Test
	public void test3() {
		Page page = (Page) context.getBean("page1");
		Assert.assertNotNull(page);
		Assert.assertEquals(100, page.getTotal());
		Assert.assertNotNull(page.getRows());
		Assert.assertEquals("湖南", page.getRows().get(0));
		Assert.assertEquals("广东", page.getRows().get(1));
		Assert.assertEquals(100, page.getRows().get(3));
	}

	@Test
	public void test4() {
		Board board = (Board) context.getBean("board");
		Assert.assertEquals((Integer) 100, board.getBoardid());
		Assert.assertEquals((Integer) 200, board.getParentid());
		Assert.assertEquals("jsp", board.getBoardname());
		
		
		Assert.assertEquals((Integer) 300, board.getParent().getBoardid());
		Assert.assertEquals("java", board.getParent().getBoardname());
		
		
		Assert.assertEquals(5, board.getTopicList().size());
		Assert.assertEquals(null, board.getTopicList().get(0));
		Assert.assertNull(board.getTopicList().get(1));
		Assert.assertEquals((Integer) 400, board.getTopicList().get(3).getUid());
	}

	@SuppressWarnings("unchecked")
	@Test
	public void test5() {
		Page page = (Page) context.getBean("page2");
		Assert.assertNotNull(page);
		Assert.assertEquals(200, page.getTotal());
		Assert.assertNotNull(page.getRows());

		/**
		 * 测试实体对象
		 */
		User user = (User) page.getRows().get(0);
		Assert.assertEquals("华荣", user.getUname());
		/**
		 * 测试Map集合
		 */
		Map<String, Object> map = (Map<String, Object>) page.getRows().get(1);
		Assert.assertEquals("衡阳", map.get("0734"));
		Assert.assertEquals("长沙", map.get("0731"));
		/**
		 * 测试Set集合
		 */
		User wuSong = (User) context.getBean("myUser");
		Set<Object> set = (Set<Object>) page.getRows().get(2);
		Assert.assertEquals(true, set.contains(100));
		Assert.assertEquals(true, set.contains(wuSong));
		Assert.assertEquals(true, set.contains("呵呵"));
	}

}

