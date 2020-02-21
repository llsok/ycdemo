package com.yc.spring.bbs.web;

import com.yc.spring.bbs.bean.Result;
import com.yc.spring.bbs.bean.Board;
import com.yc.spring.bbs.biz.BoardBiz;

public class BoardAction {

	private BoardBiz biz;

	public Result create(Board e) {
		biz.create(e);
		return new Result();
	}

	public Result modify(Board e) {
		biz.modify(e);
		return new Result();
	}

	public Result delete(Board e) {
		biz.delete(e);
		return new Result();
	}

	public Result query(Board e) {
		biz.query(e);
		return new Result();
	}

}
