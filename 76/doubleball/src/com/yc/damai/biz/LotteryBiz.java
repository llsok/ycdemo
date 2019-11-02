package com.yc.damai.biz;

import java.util.List;

import com.yc.damai.bean.Lottery;
import com.yc.damai.dao.LotteryDao;
/**
 * 操作LotteryDao的事务类
 * @author psq
 *
 */
public class LotteryBiz {
	LotteryDao dao = new LotteryDao();
	//查询所有对应的事件
	public List<Lottery> query(Lottery lottery) throws Exception{
		return dao.selectAll(lottery);
	}
	//添加数据
	public int add(Lottery lottery) throws Exception {
		return dao.insert(lottery);
	}
}
