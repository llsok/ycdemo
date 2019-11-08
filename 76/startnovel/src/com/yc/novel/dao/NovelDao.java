package com.yc.novel.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.yc.novel.bean.Novel;
import com.yc.novel.common.DbHelper;

/**
 * 操作novels表的dao类
 * 
 * @author psq
 *
 */
public class NovelDao {

	/**
	 * 查询所有
	 * 
	 * @param novel
	 * @return
	 * @throws Exception
	 */
	public List<Novel> selectAll(Novel novel) throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("select * from novels  where 1=1 ");
		if (novel != null) {
			// 根据作者查询
			if (novel.getAuthor() != null) {
				sb.append(" and author='" + novel.getAuthor() + "'");
			}
			// 根据书名查询
			if (novel.getNname() != null) {
				sb.append(" and nname ='" + novel.getNname() + "'");
			}
			sb.append(" order by nid asc");
		}
		System.out.println(sb.toString());
		return DbHelper.selectAll(sb.toString(), null, Novel.class);
	}

	/**
	 * 添加数据
	 * 
	 * @param novel
	 * @return
	 * @throws Exception
	 */
	public int insert(Novel novel) throws Exception {
		String sql = "insert into novels(ntype,nname,clickNum,dateStr,author)" + " values(?,?,?,?,?)";
		System.out.println(sql);
		return DbHelper.update(sql, novel.getNtype(), novel.getNname(), novel.getClickNum(), novel.getDateStr(),
				novel.getAuthor());
	}

	/**
	 * 删除数据
	 * 
	 * @param novel
	 * @return
	 * @throws Exception
	 * 
	 */

	public int delete() throws Exception {
		String sql = "delete from novels where 1=1";
		System.out.println(sql);
		return DbHelper.update(sql, null);
	}

	/**
	 * 更新
	 * @param novel
	 * @return
	 * @throws Exception
	 */
	public int update(Novel novel) throws Exception{
		//更新 UPDATE table_name SET field1=new-value1, field2=new-value2[WHERE Clause]
		if(novel == null){
			return -1;
		}
		StringBuffer sb = new StringBuffer();
		sb.append("update novels set  ");
		List<Object> list = new ArrayList<Object>();
		//因为我们需要满足三个条件才会更新，所以没必要写更多的判断
		if(novel.getNname() != null && novel.getAuthor() != null && novel.getNtype() != null){
			sb.append(" nname='"+novel.getNname()+"' ,author='"+novel.getAuthor()+"' ,ntype='"+novel.getNtype()+"'");
		}
		//为了拼接方便而加了一个条件，对数据无影响
		sb.append(" where nname='"+novel.getNname()+"' ");
		if(novel.getClickNum() != null){
			sb.append(" and clickNum='"+novel.getClickNum()+"' ");
		}
		if( novel.getDateStr() != null){
			sb.append(" and dateStr='"+novel.getDateStr()+"' ");
		}
		/*else if(novel.getNname() != null && novel.getAuthor() == null){
			sb.append(" nname=?");
		}else if(novel.getNname() == null && novel.getAuthor()!= null){
			sb.append(" author=?");
		}*/
		System.out.println(sb.toString());
		return DbHelper.update(sb.toString(), null);
		
	}
}