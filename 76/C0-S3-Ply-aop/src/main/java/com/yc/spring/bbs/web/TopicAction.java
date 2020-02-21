package com.yc.spring.bbs.web;

import com.yc.spring.bbs.bean.Result;
import com.yc.spring.bbs.bean.Topic;
import com.yc.spring.bbs.biz.TopicBiz;

public class TopicAction {

	private TopicBiz biz;

	public Result create(Topic e) {
		biz.create(e);
		return new Result();
	}

	public Result modify(Topic e) {
		biz.modify(e);
		return new Result();
	}

	public Result delete(Topic e) {
		biz.delete(e);
		return new Result();
	}

	public Result query(Topic e) {
		biz.query(e);
		return new Result();
	}

}
