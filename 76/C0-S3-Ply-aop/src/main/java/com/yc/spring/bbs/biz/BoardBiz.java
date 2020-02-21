package com.yc.spring.bbs.biz;

import java.util.List;

import com.yc.spring.bbs.bean.Board;
import com.yc.spring.bbs.dao.BoardDao;

public class BoardBiz {

	private BoardDao dao;

	public void create(Board board) {
		dao.insert(board);
	}

	public void modify(Board board) {
		dao.update(board);
	}

	public void delete(Board board) {
		dao.delete(board);
	}

	public List<Board> query(Board board) {
		return dao.selectByObject(board);
	}

}
