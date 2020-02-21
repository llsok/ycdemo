package com.yc.spring.bbs.web;

import com.yc.spring.bbs.bean.Result;
import com.yc.spring.bbs.bean.Reply;
import com.yc.spring.bbs.biz.ReplyBiz;

public class ReplyAction {

	private ReplyBiz biz;

	public Result create(Reply e) {
		biz.create(e);
		return new Result();
	}

	public Result modify(Reply e) {
		biz.modify(e);
		return new Result();
	}

	public Result delete(Reply e) {
		biz.delete(e);
		return new Result();
	}

	public Result query(Reply e) {
		biz.query(e);
		return new Result();
	}

}
