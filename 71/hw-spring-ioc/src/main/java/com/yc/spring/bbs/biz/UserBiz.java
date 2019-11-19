package com.yc.spring.bbs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.spring.bbs.bean.User;
import com.yc.spring.bbs.dao.UserDao;

// Spring 组件注解  ===》 Bean  <bean>
@Component
public class UserBiz {

	// 需要从容器中获取 UserDao
	@Autowired
	private UserDao uDao;
	
	public UserDao getuDao() {
		return uDao;
	}

	public void create(User user) throws InterruptedException {
		Thread.sleep(200);
		uDao.insert(user);
	}

	public void modify(User user) {
		uDao.update(user);
	}

	public void remove(User user) throws InterruptedException {
		Thread.sleep(300);
		uDao.delete(user);
	}

}
