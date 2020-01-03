package com.yc.easyweb.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.easyweb.bean.Usercontrol;
import com.yc.easyweb.common.DbHelper;

public class UsercontrolDao {
	// 查询所有
		public List<Usercontrol> selectAll(Usercontrol usercontrol) throws IOException  {
			StringBuffer sb = new StringBuffer();
			sb.append(" select uid,conid,ucon from usercontrol where 1=1 ");
			if (usercontrol != null) {
				if (usercontrol.getConid() != 0) {
					sb.append(" and conid =" + usercontrol.getConid());
				}
				if (usercontrol.getUid() != 0) {
					sb.append(" and uid =" + usercontrol.getUid());
				}
				if (usercontrol.getUcon() != 0) {
					sb.append(" and ucon =" + usercontrol.getUcon());
				}
			}
			sb.append(" order by  ucon desc");
			List<Usercontrol> list = DbHelper.selectAll(sb.toString(), null, Usercontrol.class);
			return list;
		}
		//查询单个
		public Usercontrol selectSingle(Usercontrol usercontrol) throws IOException  {
			StringBuffer sb = new StringBuffer();
			sb.append(" select uid,conid,ucon from usercontrol where 1=1 ");
			if (usercontrol != null) {
				if (usercontrol.getConid() != 0) {
					sb.append(" and conid =" + usercontrol.getConid());
				}
				if (usercontrol.getUid() != 0) {
					sb.append(" and uid =" + usercontrol.getUid());
				}
				if (usercontrol.getUcon() != 0) {
					sb.append(" and ucon =" + usercontrol.getUcon());
				}
			}
			sb.append(" order by  ucon desc");
			return DbHelper.selectSingle(sb.toString(), null, Usercontrol.class);
		}
		// 添加
		public int insert(Usercontrol usercontrol) throws SQLException  {
			String sql = "insert into Usercontrol(ucon,conid,uid) " + " values(null,?,?);";
			return DbHelper.update(sql, usercontrol.getConid(),usercontrol.getUid());
		}
		
		// 删除
		public int delete(Usercontrol usercontrol) throws SQLException  {
			StringBuffer sb = new StringBuffer();
			if (usercontrol == null) {
				return 0;
			}
			sb.append("delete from usercontrol where 1=1 ");
			if (usercontrol.getConid() != 0) {
				sb.append(" and conid =" + usercontrol.getConid());
			}
			if (usercontrol.getUid() != 0) {
				sb.append(" and uid =" + usercontrol.getUid());
			}
			if (usercontrol.getUcon() != 0) {
				sb.append(" and ucon =" + usercontrol.getUcon());
			}
			return DbHelper.update(sb.toString(), null);

		}
		
		//删除多条
		public int delete(List<Usercontrol> list) throws SQLException  {
			StringBuffer sb = null;
			if (list.size() == 0) {
				return 0;
			}
			List<String> sqList = new ArrayList<String>();
			for (Usercontrol usercontrol : list) {
				sb = new StringBuffer();
				sb.append("delete from usercontrol where 1=1 ");
				if (usercontrol.getConid() != 0) {
					sb.append(" and conid =" + usercontrol.getConid());
				}
				if (usercontrol.getUid() != 0) {
					sb.append(" and uid =" + usercontrol.getUid());
				}
				if (usercontrol.getUcon() != 0) {
					sb.append(" and ucon =" + usercontrol.getUcon());
				}
				sqList.add(sb.toString());
			}
			return DbHelper.update(sqList);
		}

		// 更新
		public int update(Usercontrol usercontrolNew,Usercontrol usercontrolOld) throws SQLException  {
			StringBuffer sb = new StringBuffer();
			if (usercontrolNew== null || usercontrolOld== null) {
				return 0;
			}
			sb.append("update Usercontrol set ctemp='' ");
			if (usercontrolNew.getConid() != 0) {
				sb.append(" , conid =" + usercontrolNew.getConid());
			}
			if (usercontrolNew.getUid() != 0) {
				sb.append(" , uid =" + usercontrolNew.getUid());
			}
			if (usercontrolNew.getUcon() != 0) {
				sb.append(" , ucon =" + usercontrolNew.getUcon());
			}
			sb.append(" where 1=1 ");
			if (usercontrolOld.getConid() != 0) {
				sb.append(" and conid =" + usercontrolOld.getConid());
			}
			if (usercontrolOld.getUid() != 0) {
				sb.append(" and uid =" + usercontrolOld.getUid());
			}
			if (usercontrolOld.getUcon() != 0) {
				sb.append(" and ucon =" + usercontrolOld.getUcon());
			}
			return DbHelper.update(sb.toString(), null);

		}
		// 其他
}
