package com.yc.spring.bbs.biz;

import java.util.List;

import com.yc.spring.bbs.bean.Topic;
import com.yc.spring.bbs.dao.TopicDao;

public class TopicBiz {

	private TopicDao dao;

	public void create(Topic topic) {
		dao.insert(topic);
	}

	public void modify(Topic topic) {
		dao.update(topic);
	}

	public void delete(Topic topic) {
		dao.delete(topic);
	}

	public List<Topic> query(Topic topic) {
		return dao.selectByObject(topic);
	}

}
