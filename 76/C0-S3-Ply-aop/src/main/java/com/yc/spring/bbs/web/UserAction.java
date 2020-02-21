package com.yc.spring.bbs.web;

import com.yc.spring.bbs.bean.Result;
import com.yc.spring.bbs.bean.User;
import com.yc.spring.bbs.biz.UserBiz;

public class UserAction {

	private UserBiz biz;

	public Result create(User e) {
		biz.create(e);
		return new Result();
	}

	public Result modify(User e) {
		biz.modify(e);
		return new Result();
	}

	public Result delete(User e) {
		biz.delete(e);
		return new Result();
	}

	public Result query(User e) {
		biz.query(e);
		return new Result();
	}

}
