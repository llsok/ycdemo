package com.yc.novel.biz;

import java.util.List;

import com.yc.novel.bean.Novel;
import com.yc.novel.dao.NovelDao;

public class NovelBiz {

	private NovelDao dao = new NovelDao();
	/**
	 * 操作NOvelDao的事务类
	 * @param novel
	 * @return
	 * @throws Exception
	 */
	public List<Novel> selectAll(Novel novel) throws Exception{
		return dao.selectAll(novel);
	}
	public int  insert(Novel novel) throws Exception {
		return dao.insert(novel);
		
	}
	public int  delete() throws Exception {
		return dao.delete();
		
	}
	public int  update(Novel novel) throws Exception {
		return dao.update(novel);
	}
}
