package com.yc.damai.dao;

import java.util.List;

import com.yc.damai.bean.Lottery;
import com.yc.damai.common.DbHelper;

/**
 * 操作lottery表的类
 * @author psq
 *
 */
public class LotteryDao {
	/**
	 * 查询所有数据
	 * @param lottery 传入lottery对象
	 * @return
	 * @throws Exception
	 * 
	 */
	public List<Lottery> selectAll(Lottery lottery) throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("select id,opendate,num,redone,redtwo,redthree,redfour,redfive"
				+ ",redsix,blue,sale,firstprize,secondeprize"
				+ " from lottery  where 1=1 ");
		if(lottery != null){
			//传入限制条件 期数
			if(lottery.getNum() != null){
				sb.append(" and num = "+lottery.getNum());
			}
			//传入限制条件日期
			if(lottery.getOpendate() != null){
				sb.append(" and opendate like '%" + lottery.getOpendate() + "%'");
			}
		}
		sb.append(" order by  id asc");
		//System.out.println(sb.toString());
		return DbHelper.selectAll(sb.toString(), null, Lottery.class);
	}
	/**
	 * 添加数据
	 * @param lottery
	 * @return
	 * @throws Exception
	 */
	public int insert(Lottery lottery) throws Exception{
		String sql = "insert into lottery values(null,?,?,?,?,?,?,?,?,?,?,?,?);";
		
		return DbHelper.update(sql, lottery.getOpendate(),lottery.getNum(),lottery.getRedone(),
							lottery.getRedtwo(),lottery.getRedthree(),lottery.getRedfour(),
							lottery.getRedfive(),lottery.getRedsix(),lottery.getBlue(),
							lottery.getSale(),lottery.getFirstprize(),lottery.getSecondeprize());
		
	}

}
