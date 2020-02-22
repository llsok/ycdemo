package com.yc.easyweb.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.easyweb.bean.Bought;
import com.yc.easyweb.bean.Eorderitem;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.common.DbHelper;

/**
 * 操作Eorderitem表的dao类
 * @author psq
 *
 */
public class EorderitemDao {
	DbHelper db = new DbHelper();
	//查询所有
	@SuppressWarnings("static-access")
	public List<Eorderitem> selectAll(Eorderitem eorderitem) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(" select itemid,count,bid,eoid,total,eitemp,uid,cartstate,carttime"
				+ " from eorderitem where 1=1 ");
		if(eorderitem != null){
			if(eorderitem.getBid() != 0){
				sb.append(" and bid="+eorderitem.getBid());
			}
			if(eorderitem.getUid() != 0){
				sb.append(" and uid="+eorderitem.getUid());
			}
			if(eorderitem.getCartstate() != 0){
				sb.append(" and cartstate="+eorderitem.getCartstate());
			}
			if(eorderitem.getEoid() != null && !eorderitem.getEoid().isEmpty()){
				sb.append(" and eoid like'%"+eorderitem.getEoid() +"%'");
			}
			if(eorderitem.getItemid() != null && !eorderitem.getItemid().isEmpty()){
				sb.append(" and itemid like '%"+eorderitem.getItemid()+"%'");
			}
		}
		sb.append("  order by  itemid desc");
		List<Eorderitem> list = db.selectAll(sb.toString(), null, Eorderitem.class);
		return list;
		
	}
	//查询单个
		@SuppressWarnings("static-access")
		public Eorderitem selectSingle(Eorderitem eorderitem) throws IOException {
			StringBuffer sb = new StringBuffer();
			sb.append(" select itemid,count,bid,eoid,total,eitemp,uid,cartstate,carttime"
					+ " from eorderitem where 1=1 ");
			if(eorderitem != null){
				if(eorderitem.getBid() != 0){
					sb.append(" and bid="+eorderitem.getBid());
				}
				if(eorderitem.getUid() != 0){
					sb.append(" and uid="+eorderitem.getUid());
				}
				if(eorderitem.getEoid() != null && !eorderitem.getEoid().isEmpty()){
					sb.append(" and eoid ='"+eorderitem.getEoid() +"'");
				}
				if(eorderitem.getItemid() != null && !eorderitem.getItemid().isEmpty()){
					sb.append(" and itemid ='"+eorderitem.getItemid()+"'");
				}
			}
			sb.append("  order by  itemid desc");
			return db.selectSingle(sb.toString(), null, Eorderitem.class);
			
			
		}
	//添加
	public int insert(Eorderitem eorderitem) throws SQLException {
		String sql = "insert into eorderitem(itemid,bid,count,total,eitemp,uid,carttime,cartstate,eoid) " 
					+ " values(?,?,?,?,?,?,?,?,?);";
		return DbHelper.update(sql, eorderitem.getItemid(),eorderitem.getBid(),eorderitem.getCount(),
				eorderitem.getTotal(),eorderitem.getEitemp()
				,eorderitem.getUid(),eorderitem.getCarttime(),eorderitem.getCartstate(),eorderitem.getEoid());
	}
	//删除
	public int delete(Eorderitem eorderitem) throws SQLException {
		StringBuffer sb = new StringBuffer();
		if (eorderitem == null) {
			return 0;
		}
		sb.append("delete from eorderitem where 1=1 ");
		if(eorderitem.getBid() != 0){
			sb.append(" and bid="+eorderitem.getBid());
		}
		if(eorderitem.getUid() != 0){
			sb.append(" and uid="+eorderitem.getUid());
		}
		if(eorderitem.getEoid() != null && !eorderitem.getEoid().isEmpty()){
			sb.append(" and eoid ='"+eorderitem.getEoid() +"'");
		}
		if(eorderitem.getItemid() != null && !eorderitem.getItemid().isEmpty()){
			sb.append(" and itemid ='"+eorderitem.getItemid()+"'");
		}
		return DbHelper.update(sb.toString(), null);
	}
	//删除多条数据
	public int delete(List<Eorderitem > list) throws SQLException {
		StringBuffer sb = null;
		if (list.size() == 0) {
			return 0;
		}
		List<String> sqList = new ArrayList<String>();
		for (Eorderitem eorderitem : list) {
			sb = new StringBuffer();
			sb.append("delete from eorderitem where 1=1 ");
			if(eorderitem.getBid() != 0){
				sb.append(" and bid="+eorderitem.getBid());
			}
			if(eorderitem.getUid() != 0){
				sb.append(" and uid="+eorderitem.getUid());
			}
			if(eorderitem.getEoid() != null && !eorderitem.getEoid().isEmpty()){
				sb.append(" and eoid ='"+eorderitem.getEoid() +"'");
			}
			if(eorderitem.getItemid() != null && !eorderitem.getItemid().isEmpty()){
				sb.append(" and itemid ='"+eorderitem.getItemid()+"'");
			}
			sqList.add(sb.toString());
		}
		return DbHelper.update(sqList);
	}
	
	//更新
	public  int update (Eorderitem eoNew,Eorderitem eoOld) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		if (eoNew== null || eoOld== null) {
			return 0;
		}
		sb.append("update eorderitem set eitemp='' ");
		if(eoNew.getBid() != 0){
			sb.append(" , bid="+eoNew.getBid());
		}
		if(eoNew.getCount() != 0){
			sb.append(" , count ="+eoNew.getCount());
		}
		if(eoNew.getTotal() != 0){
			sb.append(" , total ="+eoNew.getTotal());
		}
		if(eoNew.getCartstate() != 0){
			sb.append(" , cartstate="+eoNew.getCartstate());
		}
		if(eoNew.getCarttime() != null && !eoNew.getCarttime().isEmpty()){
			sb.append(" , carttime ='"+eoNew.getCarttime() +"'");
		}
		if(eoNew.getEoid() != null && !eoNew.getEoid().isEmpty()){
			sb.append(" , eoid ='"+eoNew.getEoid() +"'");
		}
		if(eoNew.getEitemp() != null && !eoNew.getEitemp().isEmpty()){
			sb.append(" , eitemp ='"+eoNew.getEitemp() +"'");
		}
		
		sb.append(" where 1=1 ");
		if(eoOld.getBid() != 0){
			sb.append(" and bid="+eoOld.getBid());
		}
		if(eoOld.getEoid() != null && !eoOld.getEoid().isEmpty()){
			sb.append(" and eoid ='"+eoOld.getEoid() +"'");
		}
		if(eoOld.getItemid() != null && !eoOld.getItemid().isEmpty()){
			sb.append(" and itemid ='"+eoOld.getItemid()+"'");
		}
		if(eoOld.getUid() != 0){
			sb.append(" and uid="+eoOld.getUid());
		}
		return DbHelper.update(sb.toString(), null);
	}
	//查询购物车详情
		public List<Bought> selectAll(Bought bought) throws IOException {
			StringBuffer sb = new StringBuffer();
			String sql = "select bucollege,bumajor,bclass,bname,bprice,bimg,itemid,count,eo.bid,eo.eoid,total,eitemp,"
					+ " eo.uid,cartstate,carttime "
					+ " from book b,eorderitem eo  where 1=1 and eo.bid=b.bid  ";
			sb.append(sql);
			if(bought != null){
				if(bought.getBid() != 0){
					sb.append(" and eo.bid="+bought.getBid());
				}
				if(bought.getEoid() != null && !bought.getEoid().isEmpty()){
					sb.append(" and eoid ='"+bought.getEoid() +"'");
				}
				if(bought.getItemid() != null && !bought.getItemid().isEmpty()){
					sb.append(" and itemid ='"+bought.getItemid()+"'");
				}
				if(bought.getUid() != 0){
					sb.append(" and eo.uid="+bought.getUid());
				}
				if(bought.getCartstate() != 0){
					sb.append(" and cartstate="+bought.getCartstate());
				}
			}
			sb.append(" order by  itemid desc");
			return DbHelper.selectAll(sb.toString(), null, Bought.class);
		}
		//查询单个购物车详情
		public Bought selectSingle(Bought bought) throws IOException {
			StringBuffer sb = new StringBuffer();
			String sql = "select bucollege,bumajor,bclass,bname,bprice,bimg,itemid,count,eo.bid,eo.eoid,total,eitemp,"
					+ " eo.uid,cartstate,carttime "
					+ " from book b,eorderitem eo  where 1=1 and eo.bid=b.bid  ";
			sb.append(sql);
			if(bought != null){
				if(bought.getBid() != 0){
					sb.append(" and eo.bid="+bought.getBid());
				}
				if(bought.getEoid() != null && !bought.getEoid().isEmpty()){
					sb.append(" and eoid ='"+bought.getEoid() +"'");
				}
				if(bought.getItemid() != null && !bought.getItemid().isEmpty()){
					sb.append(" and itemid ='"+bought.getItemid()+"'");
				}
				if(bought.getUid() != 0){
					sb.append(" and eo.uid="+bought.getUid());
				}
				if(bought.getCartstate() != 0){
					sb.append(" and cartstate="+bought.getCartstate());
				}
			}
			sb.append(" order by  itemid asc");
			return DbHelper.selectSingle(sb.toString(), null, Bought.class);
		}
		
		//购物车分页
		@SuppressWarnings({ "unchecked", "static-access" })
		public Page<Bought> eoPage(int page, int rows,Bought bought) throws IOException {
			String sql = "select bucollege,bumajor,bclass,bname,bprice,bimg,itemid,count,eo.bid,eo.eoid,total,eitemp,"
					+ " eo.uid,cartstate,carttime "
					+ " from book b,eorderitem eo  where 1=1 and eo.bid=b.bid  ";
			StringBuffer sb = new StringBuffer();
			sb.append(sql);
			if(bought != null){
				if(bought.getBid() != 0){
					sb.append(" and eo.bid="+bought.getBid());
				}
				if(bought.getEoid() != null && !bought.getEoid().isEmpty()){
					sb.append(" and eoid ='"+bought.getEoid() +"'");
				}
				if(bought.getItemid() != null && !bought.getItemid().isEmpty()){
					sb.append(" and itemid ='"+bought.getItemid()+"'");
				}
				if(bought.getUid() != 0){
					sb.append(" and eo.uid="+bought.getUid());
				}
				if(bought.getCartstate() != 0){
					sb.append(" and cartstate="+bought.getCartstate());
				}
			}
			sb.append(" order by  itemid asc");
			return db.selectPageForMysql(page, rows, Bought.class,sb.toString());
		}
		
	//其他
}
