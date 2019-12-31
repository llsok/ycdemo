package com.yc.springboot.C71S3PlyBlog;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.mockito.internal.stubbing.answers.ThrowsException;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.util.Assert;

import com.yc.springboot.C71S3PlyBlog.bean.User;
import com.yc.springboot.C71S3PlyBlog.bean.UserExample;
import com.yc.springboot.C71S3PlyBlog.biz.BizException;
import com.yc.springboot.C71S3PlyBlog.biz.LogBiz;
import com.yc.springboot.C71S3PlyBlog.biz.UserBiz;
import com.yc.springboot.C71S3PlyBlog.dao.LogMapper;
import com.yc.springboot.C71S3PlyBlog.dao.UserMapper;

/**
 * SpringBoot 默认集成了 Mockito
 * 使用 MockBean 标注要虚拟的对象
 * 1、打桩：定义方法的返回值  when（。。。）
 * 2、行为判断：判断指定的方法是否执行，  verify（方法调用， 次数）
 */
@SpringBootTest
class C71S3PlyBlogApplicationTests {
	
	@MockBean
	private UserMapper um;
	
	@MockBean
	private LogBiz lbiz;
	
	@Resource
	private UserBiz ubiz;

	@Test
	void contextLoads() {
		
		User user = new User();
		
		user.setAccount("root");
		user.setPwd("123");
		
		// 模拟查询参数
		/*UserExample example = new UserExample();
		example.createCriteria()
			.andAccountEqualTo(user.getAccount())
			.andPwdEqualTo(user.getPwd());
		// 模拟返回结果
		 */
		List<User> ret = new ArrayList<>();
		ret.add(user);
		
		// 打桩（模拟方法的返回值）
		// 当执行 selectByExample 方法时，Mock将会返回 ret
		// Mockito.any() 表示该方法可以传入任意参数
		Mockito.when(um.selectByExample(Mockito.any())).thenReturn(ret);
		
		// 模拟异常抛出
		Mockito.when(lbiz.log2(null)).thenThrow(new NullPointerException("空值异常"));
		
		// 执行测试方法
		try {
			User dbuser = ubiz.login(user);
			Assert.isTrue(dbuser!=null,"从数据库返回的用户对象为空");
			Assert.isTrue(dbuser.getAccount().equals("root"),"用户名不正确");
			Assert.isTrue(dbuser.getPwd().equals("123"),"密码不正确");
			
			// 行为判断
			// 判断 um 对象一定执行过一次 selectByExample
			Mockito.verify(um).selectByExample(Mockito.any());
			
			// 验证方法调用 2 次
			// Mockito.verify(lbiz,Mockito.times(2)).log(Mockito.any());
			
			// 最少不能低于 5 次
			Mockito.verify(lbiz,Mockito.atLeast(5)).log(Mockito.any());
			
			// 最多不能超过 8 次
			Mockito.verify(lbiz,Mockito.atMost(8)).log1(Mockito.any());
			
			try{
				ubiz.login(null);
			} catch (NullPointerException e){
				System.out.println(e.getMessage());
			}
			
			
		} catch (BizException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	
	// SpringBoot 将会在测试方法运行时，将 Mock虚拟的 LogMapper 注入到LogBiz 中
	@MockBean
	private LogMapper logMapper;
	
	@Resource
	private LogBiz logBiz;
	
	@Test
	void mockTest(){
		
		logBiz.log(new Object());
		
	}
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
