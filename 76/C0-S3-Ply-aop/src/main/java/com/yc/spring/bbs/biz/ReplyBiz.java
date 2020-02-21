package com.yc.spring.bbs.biz;

import java.util.List;

import com.yc.spring.bbs.bean.Reply;
import com.yc.spring.bbs.dao.ReplyDao;

public class ReplyBiz {

	private ReplyDao dao;

	public void create(Reply reply) {
		dao.insert(reply);
	}

	public void modify(Reply reply) {
		dao.update(reply);
	}

	public void delete(Reply reply) {
		dao.delete(reply);
	}

	public List<Reply> query(Reply reply) {
		return dao.selectByObject(reply);
	}

}
