package com.yc.easyweb.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.easyweb.bean.Eorder;
import com.yc.easyweb.bean.OrderDetial;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.common.DbHelper;

/**
 * 操作Eorder表的dao类
 * 
 * @author psq
 *
 */
public class EorderDao {
	DbHelper db = new DbHelper();

	// 查询所有
	@SuppressWarnings("static-access")
	public List<Eorder> selectAll(Eorder eorder) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(" select eoid,uid,eostate,eotime,eotemp,uname,eoaddr,eotype,eoespress,eopaytypeid "
				+ " from eorder where 1=1 ");
		if (eorder != null) {
			if (eorder.getUid() != 0) {
				sb.append(" and uid=" + eorder.getUid());
			}
			if (eorder.getEoid() != null && !eorder.getEoid().isEmpty()) {
				sb.append(" and eoid like '%" + eorder.getEoid() + "%'");
			}
			if (eorder.getEotime() != null && !eorder.getEotime().isEmpty()) {
				sb.append(" and eotime like '%" + eorder.getEotime() + "%'");
			}
			if (eorder.getUname() != null && !eorder.getUname().isEmpty()) {
				sb.append(" and uname like '%" + eorder.getUname() + "%'");
			}
			if (eorder.getEotype() != null && !eorder.getEotype().isEmpty()) {
				sb.append(" and eotype like '%" + eorder.getEotype() + "%'");
			}
			if (eorder.getEostate() != 0) {
				sb.append(" and eostate = " + eorder.getEostate());
			}
			if (eorder.getEoaddr() != null && !eorder.getEoaddr().isEmpty()) {
				sb.append(" and eoaddr like '%" + eorder.getEoaddr() + "%'");
			}
			if (eorder.getEoespress() != null && !eorder.getEoespress().isEmpty()) {
				sb.append(" and eoespress like '%" + eorder.getEoespress() + "%'");
			}
			if (eorder.getEopaytypeid() != 0) {
				sb.append(" and eopaytypeid = " + eorder.getEopaytypeid());
			}
		}
		sb.append("  order by  eoid desc");
		List<Eorder> list = db.selectAll(sb.toString(), null, Eorder.class);
		return list;
	}

	// 查询所有订单详细信息
	@SuppressWarnings("static-access")
	public List<OrderDetial> selectAllDetail(OrderDetial detial) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(
				" select e.eoid,bname,u.uid,b.bid,total,eotime,eotype,eoaddr,uphone,e.uname,count,eostate,eoespress,eopayname,bimg,eotemp "
						+ " from eorder e,book b,eorderitem eo,user u,paytype pay "
						+ " where  e.eoid = eo.eoid and b.bid = eo.bid  and pay.eopaytypeid = e.eopaytypeid "
						+ " and u.uid = e.uid and 1=1 ");
		if (detial != null) {
			if (detial.getEoid() != null && !detial.getEoid().isEmpty()) {
				sb.append(" and e.eoid = '" + detial.getEoid() + "'");
			}
			if (detial.getEotime() != null && !detial.getEotime().isEmpty()) {
				sb.append(" and eotime like '%" + detial.getEotime() + "%'");
			}
			if (detial.getEostate() != 0) {
				sb.append(" and eostate = " + detial.getEostate());
			}
			if (detial.getUid() != 0) {
				sb.append(" and u.uid = " + detial.getUid());
			}
			if (detial.getBid() != 0) {
				sb.append(" and b.bid = " + detial.getBid());
			}
		}
		sb.append("  order by  e.eoid desc");
		return db.selectAll(sb.toString(), null, OrderDetial.class);

	}

	// 查询单个订单详细信息
	@SuppressWarnings("static-access")
	public OrderDetial selectSingleDetail(OrderDetial detial) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(
				" select e.eoid,bname,u.uid,b.bid,total,eotime,eotype,eoaddr,uphone,e.uname,count,eostate,eoespress,eopayname,bimg "
						+ " from eorder e,book b,eorderitem eo,user u,paytype pay "
						+ " where  e.eoid = eo.eoid and b.bid = eo.bid  and pay.eopaytypeid = e.eopaytypeid "
						+ " and u.uid = e.uid and 1=1 ");
		if (detial != null) {
			if (detial.getEoid() != null && !detial.getEoid().isEmpty()) {
				sb.append(" and e.eoid = '" + detial.getEoid() + "'");
			}
			if (detial.getEotime() != null && !detial.getEotime().isEmpty()) {
				sb.append(" and eotime like '%" + detial.getEotime() + "%'");
			}
			if (detial.getEostate() != 0) {
				sb.append(" and eostate = " + detial.getEostate());
			}
			if (detial.getUid() != 0) {
				sb.append(" and u.uid = " + detial.getUid());
			}
			if (detial.getBid() != 0) {
				sb.append(" and b.bid = " + detial.getBid());
			}
		}
		sb.append("  order by  e.eoid desc");
		return db.selectSingle(sb.toString(), null, OrderDetial.class);
	}

	// 查询单个
	@SuppressWarnings("static-access")
	public Eorder selectSingle(Eorder eorder) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(" select eoid,uid,eostate,eotime,eotemp,uname,eoaddr,eotype,eoespress,eopaytypeid "
				+ " from eorder where 1=1 ");
		if (eorder != null) {
			if (eorder.getUid() != 0) {
				sb.append(" and uid=" + eorder.getUid());
			}
			if (eorder.getEoid() != null && !eorder.getEoid().isEmpty()) {
				sb.append(" and eoid='" + eorder.getEoid() + "'");
			}
			if (eorder.getEotime() != null && !eorder.getEotime().isEmpty()) {
				sb.append(" and eotime = '" + eorder.getEotime() + "'");
			}
			if (eorder.getUname() != null && !eorder.getUname().isEmpty()) {
				sb.append(" and uname = '" + eorder.getUname() + "'");
			}
			if (eorder.getEotype() != null && !eorder.getEotype().isEmpty()) {
				sb.append(" and eotype = '" + eorder.getEotype() + "'");
			}
			if (eorder.getEostate() != 0) {
				sb.append(" and eostate = " + eorder.getEostate());
			}
			if (eorder.getEoaddr() != null && !eorder.getEoaddr().isEmpty()) {
				sb.append(" and eoaddr ='" + eorder.getEoaddr() + "'");
			}
			if (eorder.getEoespress() != null && !eorder.getEoespress().isEmpty()) {
				sb.append(" and eoespress = '" + eorder.getEoespress() + "'");
			}
			if (eorder.getEopaytypeid() != 0) {
				sb.append(" and eopaytypeid = " + eorder.getEopaytypeid());
			}
		}
		sb.append("  order by  eoid desc");
		return db.selectSingle(sb.toString(), null, Eorder.class);
	}

	// 添加
	public int insert(Eorder eorder) throws SQLException {
		String sql = "insert into eorder(eoid,uid,eotime,eotemp,uname,eoaddr,eotype,eoespress,eopaytypeid,eostate  ) "
				+ " values(?,?,?,?,?,?,?,?,?,?);";
		return DbHelper.update(sql, eorder.getEoid(), eorder.getUid(), eorder.getEotime(), eorder.getEotemp(),
				eorder.getUname(), eorder.getEoaddr(), eorder.getEotype(), eorder.getEoespress(),
				eorder.getEopaytypeid(), eorder.getEostate());
	}

	// 删除
	public int delete(Eorder eorder) throws SQLException {
		StringBuffer sb = new StringBuffer();
		if (eorder == null) {
			return 0;
		}
		sb.append("delete from eorder where 1=1 ");
		if (eorder.getEoid() != null && !eorder.getEoid().isEmpty()) {
			sb.append(" and eoid='" + eorder.getEoid() + "'");
		}
		if (eorder.getEotime() != null && !eorder.getEotime().isEmpty()) {
			sb.append(" and eotime = '" + eorder.getEotime() + "'");
		}
		if (eorder.getUname() != null && !eorder.getUname().isEmpty()) {
			sb.append(" and uname = '" + eorder.getUname() + "'");
		}
		if (eorder.getEotype() != null && !eorder.getEotype().isEmpty()) {
			sb.append(" and eotype = '" + eorder.getEotype() + "'");
		}
		if (eorder.getEostate() != 0) {
			sb.append(" and eostate = " + eorder.getEostate());
		}
		if (eorder.getEoaddr() != null && !eorder.getEoaddr().isEmpty()) {
			sb.append(" and eoaddr ='" + eorder.getEoaddr() + "'");
		}
		if (eorder.getEoespress() != null && !eorder.getEoespress().isEmpty()) {
			sb.append(" and eoespress = '" + eorder.getEoespress() + "'");
		}
		if (eorder.getEopaytypeid() != 0) {
			sb.append(" and eopaytypeid = " + eorder.getEopaytypeid());
		}
		return DbHelper.update(sb.toString(), null);
	}

	// 删除多条
	public int delete(List<Eorder> list) throws SQLException {
		StringBuffer sb = null;
		if (list.size() == 0) {
			return 0;
		}
		List<String> sqList = new ArrayList<String>();
		for (Eorder eorder : list) {
			sb = new StringBuffer();
			sb.append("delete from eorder where 1=1 ");
			if (eorder.getEoid() != null && !eorder.getEoid().isEmpty()) {
				sb.append(" and eoid='" + eorder.getEoid() + "'");
			}
			if (eorder.getEotime() != null && !eorder.getEotime().isEmpty()) {
				sb.append(" and eotime = '" + eorder.getEotime() + "'");
			}
			if (eorder.getUname() != null && !eorder.getUname().isEmpty()) {
				sb.append(" and uname = '" + eorder.getUname() + "'");
			}
			if (eorder.getEotype() != null && !eorder.getEotype().isEmpty()) {
				sb.append(" and eotype = '" + eorder.getEotype() + "'");
			}
			if (eorder.getEostate() != 0) {
				sb.append(" and eostate = " + eorder.getEostate());
			}
			if (eorder.getEoaddr() != null && !eorder.getEoaddr().isEmpty()) {
				sb.append(" and eoaddr ='" + eorder.getEoaddr() + "'");
			}
			if (eorder.getEoespress() != null && !eorder.getEoespress().isEmpty()) {
				sb.append(" and eoespress = '" + eorder.getEoespress() + "'");
			}
			if (eorder.getEopaytypeid() != 0) {
				sb.append(" and eopaytypeid = " + eorder.getEopaytypeid());
			}
			sqList.add(sb.toString());
		}
		return DbHelper.update(sqList);
	}

	// 更新
	public int update(Eorder eorderNew, Eorder eorderOld) throws SQLException {
		StringBuffer sb = new StringBuffer();
		if (eorderNew == null || eorderOld == null) {
			return 0;
		}
		sb.append("update  eorder set eotemp='' ");
		if (eorderNew.getUid() != 0) {
			sb.append(" , uid=" + eorderNew.getUid());
		}
		if (eorderNew.getEotime() != null && !eorderNew.getEotime().isEmpty()) {
			sb.append(" , eotime ='" + eorderNew.getEotime() + "'");
		}
		if (eorderNew.getUname() != null && !eorderNew.getUname().isEmpty()) {
			sb.append(" , uname ='" + eorderNew.getUname() + "'");
		}
		if (eorderNew.getEotype() != null && !eorderNew.getEotype().isEmpty()) {
			sb.append(" , eotype ='" + eorderNew.getEotype() + "'");
		}
		if (eorderNew.getEostate() != 0) {
			sb.append(" , eostate = " + eorderNew.getEostate());
		}
		if (eorderNew.getEoaddr() != null && !eorderNew.getEoaddr().isEmpty()) {
			sb.append(" , eoaddr ='" + eorderNew.getEoaddr() + "'");
		}
		if (eorderNew.getEotemp() != null && !eorderNew.getEotemp().isEmpty()) {
			sb.append(" , eotemp ='" + eorderNew.getEotemp() + "'");
		}
		if (eorderNew.getEoespress() != null && !eorderNew.getEoespress().isEmpty()) {
			sb.append(" , eoespress = '" + eorderNew.getEoespress() + "'");
		}
		if (eorderNew.getEopaytypeid() != 0) {
			sb.append(" , eopaytypeid = " + eorderNew.getEopaytypeid());
		}
		sb.append(" where 1=1 ");
		if (eorderOld.getUid() != 0) {
			sb.append(" and uid=" + eorderOld.getUid());
		}
		if (eorderOld.getEotime() != null && !eorderOld.getEotime().isEmpty()) {
			sb.append(" and eotime ='" + eorderOld.getEotime() + "'");
		}
		if (eorderOld.getUname() != null && !eorderOld.getUname().isEmpty()) {
			sb.append(" and uname ='" + eorderOld.getUname() + "'");
		}
		if (eorderOld.getEotype() != null && !eorderOld.getEotype().isEmpty()) {
			sb.append(" and eotype ='" + eorderOld.getEotype() + "'");
		}
		if (eorderOld.getEostate() != 0) {
			sb.append(" and eostate = " + eorderOld.getEostate());
		}
		if (eorderOld.getEoaddr() != null && !eorderOld.getEoaddr().isEmpty()) {
			sb.append(" and eoaddr ='" + eorderOld.getEoaddr() + "'");
		}
		if (eorderOld.getEoid() != null && !eorderOld.getEoid().isEmpty()) {
			sb.append(" and eoid ='" + eorderOld.getEoid() + "'");
		}
		return db.update(sb.toString(), null);
	}

	// Eorder分页
	@SuppressWarnings({ "unchecked", "static-access" })
	public Page<Eorder> eorderPage(int page, int rows, Eorder eorder) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append("select * from eorder where 1=1 ");
		if (eorder != null) {
			if (eorder.getEoid() != null && !eorder.getEoid().isEmpty()) {
				sb.append(" and eoid='" + eorder.getEoid() + "'");
			}
			if (eorder.getEotime() != null && !eorder.getEotime().isEmpty()) {
				sb.append(" and eotime = '" + eorder.getEotime() + "'");
			}
			if (eorder.getUname() != null && !eorder.getUname().isEmpty()) {
				sb.append(" and uname = '" + eorder.getUname() + "'");
			}
			if (eorder.getEotype() != null && !eorder.getEotype().isEmpty()) {
				sb.append(" and eotype = '" + eorder.getEotype() + "'");
			}
			if (eorder.getEostate() != 0) {
				sb.append(" and eostate = " + eorder.getEostate());
			}
			if (eorder.getEoaddr() != null && !eorder.getEoaddr().isEmpty()) {
				sb.append(" and eoaddr ='" + eorder.getEoaddr() + "'");
			}
			if (eorder.getEoespress() != null && !eorder.getEoespress().isEmpty()) {
				sb.append(" and eoespress = '" + eorder.getEoespress() + "'");
			}
			if(eorder.getUid() != 0){
				sb.append(" and uid = " + eorder.getUid());
			}
		}
		sb.append("  order by  eoid asc");
		return db.selectPageForMysql(page, rows, Eorder.class, sb.toString());
	}

	// Eorder详情分页
	@SuppressWarnings({ "unchecked", "static-access" })
	public Page<OrderDetial> orderPage(int page, int rows, OrderDetial detial) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(
				" select e.eoid,bname,u.uid,b.bid,total,eotime,eotype,eoaddr,uphone,e.uname,count,eostate,eoespress,eopayname,bimg "
						+ " from eorder e,book b,eorderitem eo,user u,paytype pay "
						+ " where  e.eoid = eo.eoid and b.bid = eo.bid  and pay.eopaytypeid = e.eopaytypeid "
						+ " and u.uid = e.uid and 1=1 ");
		if (detial != null) {
			if (detial.getEoid() != null && !detial.getEoid().isEmpty()) {
				sb.append(" and e.eoid = '" + detial.getEoid() + "'");
			}
			if (detial.getEotime() != null && !detial.getEotime().isEmpty()) {
				sb.append(" and eotime like '%" + detial.getEotime() + "%'");
			}
			if (detial.getEostate() != 0) {
				sb.append(" and eostate = " + detial.getEostate());
			}
			if (detial.getUid() != 0) {
				sb.append(" and eo.uid = " + detial.getUid());
			}
			if (detial.getBid() != 0) {
				sb.append(" and eo.bid = " + detial.getBid());
			}
		}
		sb.append("  order by  eoid asc");
		return db.selectPageForMysql(page, rows, OrderDetial.class, sb.toString());
	}
	// 其他
}
