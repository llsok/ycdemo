package com.yc.easyweb.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.easyweb.bean.Control;
import com.yc.easyweb.common.DbHelper;

public class ControlDao {
	// 查询所有
	public List<Control> selectAll(Control control) throws IOException  {
		StringBuffer sb = new StringBuffer();
		sb.append(" select conid,coname,conamesecond,conadd,condelete,coninsert,conupdate,concheck,uid,"
					+ "constate,contemp from control where 1=1 ");
		if (control != null) {
			if (control.getConame() != null && !control.getConame().isEmpty() ) {
				sb.append(" and coname like '%" + control.getConame() + "%'");
			}
			if (control.getConamesecond() != null && !control.getConamesecond().isEmpty()) {
				sb.append(" and conamesecond like '%" + control.getConamesecond() + "%'");
			}
			if (control.getConadd() != 0) {
				sb.append(" and conadd =" + control.getConadd());
			}
			if (control.getCondelete() != 0) {
				sb.append(" and condelete =" + control.getCondelete());
			}
			if (control.getConupdate() != 0) {
				sb.append(" and conupdate =" + control.getConupdate());
			}
			if (control.getConcheck() != 0) {
				sb.append(" and concheck=" + control.getConcheck());
			}
			if (control.getConinsert() != 0) {
				sb.append(" and coninsert=" + control.getConinsert());
			}
			if (control.getUid() != 0) {
				sb.append(" and uid=" + control.getUid());
			}
			if (control.getConstate() != 0) {
				sb.append(" and constate=" + control.getConstate());
			}
			if (control.getContemp() != null && !control.getContemp().isEmpty()) {
				sb.append(" and contemp like '%" + control.getContemp() + "%'");
			}
		}
		sb.append(" order by  conid desc");
		return DbHelper.selectAll(sb.toString(), null, Control.class);

	}

	public Control selectSingle(Control control) throws IOException  {
		StringBuffer sb = new StringBuffer();
		sb.append(" select conid,coname,conamesecond,conadd,condelete,coninsert,conupdate,concheck,uid,constate,contemp from control where 1=1 ");
		if (control != null) {
			if (control.getConame() != null && !control.getConame().isEmpty()) {
				sb.append(" and coname = '" + control.getConame() + "'");
			}
			if (control.getConamesecond() != null && !control.getConamesecond().isEmpty()) {
				sb.append(" and conamesecond = '" + control.getConamesecond() + "'");
			}
			if (control.getConadd() != 0) {
				sb.append(" and conadd =" + control.getConadd());
			}
			if (control.getCondelete() != 0) {
				sb.append(" and condelete =" + control.getCondelete());
			}
			if (control.getConupdate() != 0) {
				sb.append(" and conupdate =" + control.getConupdate());
			}
			if (control.getConcheck() != 0) {
				sb.append(" and concheck=" + control.getConcheck());
			}
			if (control.getConinsert() != 0) {
				sb.append(" and coninsert=" + control.getConinsert());
			}
			if (control.getUid() != 0) {
				sb.append(" and uid=" + control.getUid());
			}
			if (control.getConstate() != 0) {
				sb.append(" and constate=" + control.getConstate());
			}
			if (control.getContemp() != null && !control.getContemp().isEmpty()) {
				sb.append(" and contemp = '" + control.getContemp() + "'");
			}
			if (control.getConid() != 0) {
				sb.append(" and conid=" + control.getConid());
			}
		}
		// System.out.println(sb.toString());
		return DbHelper.selectSingle(sb.toString(), null, Control.class);
	}

	// 添加
	public int insert(Control control) throws SQLException  {
		String sql = "insert into control(conid,coname,conamesecond,uid,contemp,conadd,condelete,coninsert,conupdate,concheck,constate) "
				+ " values(null,?,?,?,?,default,default,default,default,default,default);";
		return DbHelper.update(sql, control.getConame(), control.getConamesecond(), control.getUid(),
				 control.getContemp());
	}

	// 删除
	public int delete(Control control) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		if (control == null) {
			return 0;
		}
		sb.append("delete from control where 1=1 ");
		if (control.getUid() != 0) {
			sb.append(" and uid=" + control.getUid());
		}
		if (control.getConstate() != 0) {
			sb.append(" and constate=" + control.getConstate());
		}
		if (control.getConid() != 0) {
			sb.append(" and conid=" + control.getConid());
		}
		if (control.getConame() != null) {
			sb.append(" and coname ='" + control.getConame() + "'");
		}
		if (control.getConamesecond() != null) {
			sb.append(" and conamesecond = '" + control.getConamesecond() + "'");
		}
		return DbHelper.update(sb.toString(), null);

	}

	// 删除多条
	public int delete(List<Control> list) throws SQLException  {
		StringBuffer sb = null;
		if (list.size() == 0) {
			return 0;
		}
		List<String> sqList = new ArrayList<String>();
		for (Control control : list) {
			sb = new StringBuffer();
			sb.append("delete from Control where 1=1 ");
			if (control.getUid() != 0) {
				sb.append(" and uid=" + control.getUid());
			}
			if (control.getConstate() != 0) {
				sb.append(" and constate=" + control.getConstate());
			}
			if (control.getConid() != 0) {
				sb.append(" and conid=" + control.getConid());
			}
			if (control.getConame() != null) {
				sb.append(" and coname ='" + control.getConame() + "'");
			}
			if (control.getConamesecond() != null) {
				sb.append(" and conamesecond = '" + control.getConamesecond() + "'");
			}
			sqList.add(sb.toString());
		}
		return DbHelper.update(sqList);
	}

	// 更新
	public int update(Control controlNew, Control controlOld) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		if (controlNew == null || controlOld == null) {
			return 0;
		}
		sb.append("update Control set ctemp='' ");
		if (controlNew.getConame() != null && !controlNew.getConame().isEmpty()) {
			sb.append(" , coname = '" + controlNew.getConame() + "'");
		}
		if (controlNew.getConamesecond() != null && !controlNew.getConamesecond().isEmpty()) {
			sb.append(" , conamesecond ='" + controlNew.getConamesecond() + "'");
		}
		if (controlNew.getConadd() != 0) {
			sb.append(" , conadd =" + controlNew.getConadd());
		}
		if (controlNew.getCondelete() != 0) {
			sb.append(" , condelete =" + controlNew.getCondelete());
		}
		if (controlNew.getConupdate() != 0) {
			sb.append(" , conupdate =" + controlNew.getConupdate());
		}
		if (controlNew.getConcheck() != 0) {
			sb.append(" , concheck=" + controlNew.getConcheck());
		}
		if (controlNew.getConinsert() != 0) {
			sb.append(" , coninsert=" + controlNew.getConinsert());
		}
		if (controlNew.getUid() != 0) {
			sb.append(" , uid=" + controlNew.getUid());
		}
		if (controlNew.getConstate() != 0) {
			sb.append(" , constate=" + controlNew.getConstate());
		}
		if (controlNew.getContemp() != null && !controlNew.getContemp().isEmpty()) {
			sb.append(" , contemp ='" + controlNew.getContemp() + "'");
		}
		sb.append(" where 1=1 ");
		
		if (controlOld.getUid() != 0) {
			sb.append(" and uid=" + controlOld.getUid());
		}
		if (controlOld.getConstate() != 0) {
			sb.append(" and constate=" + controlOld.getConstate());
		}
		if (controlOld.getConid() != 0) {
			sb.append(" and conid=" + controlOld.getConid());
		}
		if (controlOld.getConame() != null && !controlOld.getConame().isEmpty()) {
			sb.append(" and coname ='" + controlOld.getConame() + "'");
		}
		if (controlOld.getConamesecond() != null && !controlOld.getConamesecond().isEmpty()) {
			sb.append(" and conamesecond = '" + controlOld.getConamesecond() + "'");
		}
		return DbHelper.update(sb.toString(), null);

	}
	// 其他
}
