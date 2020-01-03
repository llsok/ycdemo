package com.yc.easyweb.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.easyweb.bean.Book;
import com.yc.easyweb.bean.BookChild;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.common.DbHelper;

/**
 * 操作notice表的dao类
 * 
 * @author psq
 *
 */
public class BookDao {
	DbHelper db = new DbHelper();

	// 查询所有
	@SuppressWarnings("static-access")
	public List<Book> selectAll(Book book) throws IOException  {
		StringBuffer sb = new StringBuffer();
		sb.append(" select bid,bname,buniversity,bucollege,bumajor,bclass, "
				+ " bcontent,bimg,bprice,bstate,btid,btemp,btemp1,bnum,bauthor,bdate,uid" + " from book where 1=1 ");
		if (book != null) {
			//书名
			if (book.getBname() != null && !book.getBname().isEmpty()) {
				sb.append(" and bname like '%" + book.getBname() + "%'");
			}
			//大学
			if (book.getBuniversity() != null && !book.getBuniversity().isEmpty()) {
				sb.append(" and buniversity like '%" + book.getBuniversity() + "%'");
			}
			//学院
			if (book.getBucollege() != null && !book.getBucollege().isEmpty()) {
				sb.append(" and bucollege like '%" + book.getBucollege() + "%'");
			}
			//专业
			if (book.getBumajor() != null && !book.getBumajor().isEmpty()) {
				sb.append(" and bumajor like '%" + book.getBumajor() + "%'");
			}
			//年级
			if (book.getBclass() != null && !book.getBclass().isEmpty()) {
				sb.append(" and bclass like '%" + book.getBclass() + "%'");
			}
			//库存
			if(book.getBnum() != 0 ){
				sb.append(" and bnum =" + book.getBnum());
			}
			//作者
			if (book.getBauthor() != null && !book.getBauthor().isEmpty()) {
				sb.append(" and bauthor like '%" + book.getBauthor() + "%'");
			}
			//类别
			if (book.getBtid() != 0) {
				sb.append(" and btid = " + book.getBtid());
			}
			//价格
			if(book.getBprice() != 0){
				sb.append(" and bprice = " + book.getBprice());
			}
			//发布者
			if(book.getUid() != 0){
				sb.append(" and uid = " + book.getUid());
			}
			//状态
			if (book.getBstate() != 0) {
				sb.append(" and bstate = " + book.getBstate());
			}
			//系列
			if (book.getBtemp() != null && !book.getBtemp().isEmpty()) {
				sb.append(" and btemp like '%" + book.getBtemp() + "%'");
			}
			//书id
			if (book.getBid() != 0) {
				sb.append(" and bid = " + book.getBid());
			}
			//加入日期
			if (book.getBdate() != null && !book.getBdate().isEmpty()) {
				sb.append(" and bdate like '%" + book.getBdate() + "%'");
			}
		}
		sb.append(" order by  bid desc");
		List<Book> list = db.selectAll(sb.toString(), null, Book.class);
		return list;
	}
	//查询单条记录
	@SuppressWarnings("static-access")
	public Book selectSingle(Book book) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(" select bid,bname,buniversity,bucollege,bumajor,bclass, "
				+ " bcontent,bimg,bprice,bstate,btid,btemp,uid,btemp1,bnum,bauthor,bdate" + " from book where 1=1 ");
		if (book != null) {
			//书名
			if (book.getBname() != null && !book.getBname().isEmpty()) {
				sb.append(" and bname = '" + book.getBname() + "'");
			}
			//大学
			if (book.getBuniversity() != null && !book.getBuniversity().isEmpty()) {
				sb.append(" and buniversity = '" + book.getBuniversity() + "'");
			}
			//学院
			if (book.getBucollege() != null && !book.getBucollege().isEmpty()) {
				sb.append(" and bucollege = '" + book.getBucollege() + "'");
			}
			//专业
			if (book.getBumajor() != null && !book.getBumajor().isEmpty()) {
				sb.append(" and bumajor = '" + book.getBumajor() + "'");
			}
			//年级
			if (book.getBclass() != null && !book.getBclass().isEmpty()) {
				sb.append(" and bclass = '" + book.getBclass() + "'");
			}
			//所有者
			if(book.getUid() != 0){
				sb.append(" and uid = " + book.getUid());
			}
			//作者
			if (book.getBauthor() != null && !book.getBauthor().isEmpty()) {
				sb.append(" and bauthor = '" + book.getBauthor() + "'");
			}
			//类别
			if (book.getBtid() !=0) {
				sb.append(" and btid = " + book.getBtid());
			}
			//价格
			if(book.getBprice() != 0){
				sb.append(" and bprice = " + book.getBprice());
			}
			//状态
			if (book.getBstate() != 0) {
				sb.append(" and bstate = " + book.getBstate());
			}
			//系列
			if (book.getBtemp() != null && !book.getBtemp().isEmpty()) {
				sb.append(" and btemp = '" + book.getBtemp() + "'");
			}
			//id
			if (book.getBid() != 0) {
				sb.append(" and bid = " + book.getBid());
			}
			//加入时间
			if (book.getBdate() != null && !book.getBdate().isEmpty()) {
				sb.append(" and bdate = '" + book.getBdate() + "'");
			}
		}
		sb.append(" order by  bid desc");
		return db.selectSingle(sb.toString(), null, Book.class);	
	}
	
	// 添加
	public int insert(Book book) throws SQLException  {
		String sql = "insert into book(bid,bname,buniversity,bucollege," + "bumajor,bclass,bcontent,bimg,bprice,btid,"
				+ "btemp,bnum,bauthor,bdate,uid,bstate,btemp1) " + " values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,?);";

		return DbHelper.update(sql, book.getBname(), book.getBuniversity(), book.getBucollege(), book.getBumajor(),
				book.getBclass(), book.getBcontent(), book.getBimg(), book.getBprice(), book.getBtid(), book.getBtemp(),
				book.getBnum(), book.getBauthor(), book.getBdate(),book.getUid(),book.getBtemp1());
	}

	// 删除
	public int delete(Book book) throws  SQLException {
		StringBuffer sb = new StringBuffer();
		sb.append("delete from book where 1=1 ");
		if (book != null) {
			//书名
			if (book.getBname() != null && !book.getBname().isEmpty()) {
				sb.append(" and bname ='" + book.getBname() + "'");
			}
			//大学
			if (book.getBuniversity() != null && !book.getBuniversity().isEmpty()) {
				sb.append(" and buniversity ='"  + book.getBuniversity() + "'");
			}
			//学院
			if (book.getBucollege() != null && !book.getBucollege().isEmpty()) {
				sb.append(" and bucollege ='"  + book.getBucollege() + "'");
			}
			//专业
			if (book.getBumajor() != null && !book.getBumajor().isEmpty()) {
				sb.append(" and bumajor ='"  + book.getBumajor() + "'");
			}
			//年级
			if (book.getBclass() != null && !book.getBclass().isEmpty()) {
				sb.append(" and bclass ='"  + book.getBclass() + "'");
			}
			//库存
			if(book.getBnum() != 0){
				sb.append(" and bnum =" + book.getBnum());
			}
			//作者
			if (book.getBauthor() != null && !book.getBauthor().isEmpty()) {
				sb.append(" and bauthor ='"  + book.getBauthor() + "'");
			}
			//类别
			if (book.getBtid() != 0) {
				sb.append(" and btid = " + book.getBtid());
			}
			//所有者
			if (book.getUid() != 0) {
				sb.append(" and uid = " + book.getUid());
			}
			//价格
			if(book.getBprice() != 0){
				sb.append(" and bprice = " + book.getBprice());
			}
			//状态
			if (book.getBstate() != 0) {
				sb.append(" and bstate = " + book.getBstate());
			}
			//系列
			if (book.getBtemp() != null && !book.getBtemp().isEmpty()) {
				sb.append(" and btemp ='"  + book.getBtemp() + "'");
			}
			//书id
			if (book.getBid() != 0) {
				sb.append(" and bid = " + book.getBid());
			}
			//加入时间
			if (book.getBdate() != null && !book.getBdate().isEmpty()) {
				sb.append(" and bdate ='"  + book.getBdate() + "'");
			}
		}
		return db.update(sb.toString(), null);
	}

	// 删除多条数据
	@SuppressWarnings("static-access")
	public int delete(List<Book> list) throws SQLException  {
		StringBuffer sb = null;
		if (list.size() == 0) {
			return 0;
		}
		// 保存所有的数据库语句
		List<String> sqList = new ArrayList<String>();
		for (Book book : list) {
			sb = new StringBuffer();
			sb.append("delete from book where 1=1 ");
			if (book != null) {
				if (book.getBid() != 0) {
					sb.append(" and bid = " + book.getBid());
				}
				if (book.getBdate() != null && !book.getBdate().isEmpty()) {
					sb.append(" and bdate ='"  + book.getBdate() + "'");
				}
				sqList.add(sb.toString());
			}
		}
		return db.update(sqList);
	}

	// 更新
	public int update(Book bookNew, Book bookOld) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		if (bookNew == null || bookOld == null) {
			return 0;
		}
		sb.append("update book set btemp1='' ");
		//书名
		if (bookNew.getBname() != null && !bookNew.getBname().isEmpty()) {
			sb.append(" ,bname = '" + bookNew.getBname() + "'");
		}
		//大学
		if (bookNew.getBuniversity() != null && !bookNew.getBuniversity().isEmpty()) {
			sb.append(" ,buniversity =  '" + bookNew.getBuniversity() + "'");
		}
		//学院
		if (bookNew.getBucollege() != null && !bookNew.getBucollege().isEmpty()) {
			sb.append(" ,bucollege =  '" + bookNew.getBucollege() + "'");
		}
		//专业
		if (bookNew.getBumajor() != null && !bookNew.getBumajor().isEmpty()) {
			sb.append(" ,bumajor =  '" + bookNew.getBumajor() + "'");
		}
		//年级
		if (bookNew.getBclass() != null && !bookNew.getBclass().isEmpty()) {
			sb.append(" ,bclass =  '" + bookNew.getBclass() + "'");
		}
		//类别名
		if (bookNew.getBtid() != 0 ) {
			sb.append(" ,btid = " + bookNew.getBtid());
		}
		//系列
		if (bookNew.getBtemp() != null && !bookNew.getBtemp().isEmpty()) {
			sb.append(" ,btemp = '" + bookNew.getBtemp() + "'");
		}
		//作者
		if (bookNew.getBauthor() != null && !bookNew.getBauthor().isEmpty()) {
			sb.append(" ,bauthor =  '" + bookNew.getBauthor() + "'");
		}
		//价格
		if(bookNew.getBprice()!=0){
			sb.append(" ,bprice = " + bookNew.getBprice());
		}
		//库存
		if(bookNew.getBnum()!=0){
			sb.append(" ,bnum = " + bookNew.getBnum());
		}
		//图片
		if(bookNew.getBimg()!=null && !bookNew.getBimg().isEmpty()){
			sb.append(" ,bimg = '" + bookNew.getBimg()+"'");
		}
		//内容
		if(bookNew.getBcontent()!=null && !bookNew.getBcontent().isEmpty()){
			sb.append(" ,bcontent = '" + bookNew.getBcontent()+"'");
		}
		//状态
		if (bookNew.getBstate() != 0) {
			sb.append(" ,bstate = " + bookNew.getBstate());
		}
		//加入日期
		if (bookNew.getBdate() != null && !bookNew.getBdate().isEmpty()) {
			sb.append(" ,bdate = '" + bookNew.getBdate()+"'");
		}
		//备用字段
		if(bookNew.getBtemp1() != null && !bookNew.getBtemp1().isEmpty()){
			sb.append(" ,btemp1 = '" + bookNew.getBtemp1()+"'");
		}
		//内容
		if(bookNew.getBcontent() != null && !bookNew.getBcontent().isEmpty()){
			sb.append(" ,bcontent = '" + bookNew.getBcontent()+"'");
		}
		sb.append(" where 1=1 ");
		
		if (bookOld.getBname() != null && !bookOld.getBname().isEmpty()) {
			sb.append(" and bname =  '" + bookOld.getBname() + "'");
		}
		if (bookOld.getBauthor() != null && !bookOld.getBauthor().isEmpty()) {
			sb.append(" and bauthor =  '" + bookOld.getBauthor() + "'");
		}
		if (bookOld.getBtid() !=0) {
			sb.append(" and btid = " + bookOld.getBtid());
		}
		if (bookOld.getBstate() != 0) {
			sb.append(" and bstate = " + bookOld.getBstate());
		}
		if (bookOld.getBid() != 0) {
			sb.append(" and bid = " + bookOld.getBid());
		}
		if(bookOld.getUid() != 0){
			sb.append(" and uid = " + bookOld.getUid());
		}
		return db.update(sb.toString(), null);
		
	}
	//book分页
	@SuppressWarnings({ "static-access", "unchecked" })
	public Page<Book> bookPage(int page, int rows,Book book) throws IOException {
		StringBuffer sb = new StringBuffer();
    	sb.append("select * from book where 1=1 ");
    	if(book != null){
    		//书名
			if (book.getBname() != null && !book.getBname().isEmpty()) {
				sb.append(" and bname ='" + book.getBname() + "'");
			}
			//大学
			if (book.getBuniversity() != null && !book.getBuniversity().isEmpty()) {
				sb.append(" and buniversity ='"  + book.getBuniversity() + "'");
			}
			//学院
			if (book.getBucollege() != null && !book.getBucollege().isEmpty()) {
				sb.append(" and bucollege ='"  + book.getBucollege() + "'");
			}
			//专业
			if (book.getBumajor() != null && !book.getBumajor().isEmpty()) {
				sb.append(" and bumajor ='"  + book.getBumajor() + "'");
			}
			//年级
			if (book.getBclass() != null && !book.getBclass().isEmpty()) {
				sb.append(" and bclass ='"  + book.getBclass() + "'");
			}
			//作者
			if (book.getBauthor() != null && !book.getBauthor().isEmpty()) {
				sb.append(" and bauthor ='"  + book.getBauthor() + "'");
			}
			//类别
			if (book.getBtid() != 0) {
				sb.append(" and btid = " + book.getBtid());
			}
			//所有者
			if (book.getUid() != 0) {
				sb.append(" and uid = " + book.getUid());
			}
		}
    	sb.append(" order by  bid asc");
    	return  db.selectPageForMysql(page, rows, Book.class, sb.toString());
	}
	//book分页
		@SuppressWarnings({ "static-access", "unchecked" })
		public Page<Book> bookChildPage(int page, int rows,BookChild book) throws IOException {
			StringBuffer sb = new StringBuffer();
			sb.append(" select bid,bname,buniversity,bucollege,bumajor,bclass, "
					+ " bcontent,bimg,bprice,bstate,b.btid,btemp,btemp1,bnum,bauthor,bdate,uid,btname,btnamesecond,btnamethird" + " from book b,booktype bt where 1=1 and b.btid = bt.btid ");
	    	if(book != null){
	    		//类别名
				if(book.getBtname() != null && !book.getBtname().isEmpty()){
					sb.append(" and btname = '"+book.getBtname()+"'");
				}
				//类别id
				if(book.getBtid() != 0){
					sb.append(" and b.btid = "+book.getBtid());
				}
				//大学
				if (book.getBuniversity() != null && !book.getBuniversity().isEmpty()) {
					sb.append(" and buniversity = '" + book.getBuniversity() + "'");
				}
				//学院
				if (book.getBucollege() != null && !book.getBucollege().isEmpty()) {
					sb.append(" and bucollege = '" + book.getBucollege() + "'");
				}
				//专业
				if (book.getBumajor() != null && !book.getBumajor().isEmpty()) {
					sb.append(" and bumajor = '" + book.getBumajor() + "'");
				}
				//年级
				if (book.getBclass() != null && !book.getBclass().isEmpty()) {
					sb.append(" and bclass = '" + book.getBclass() + "'");
				}
				//所以者
				if(book.getUid() != 0){
					sb.append(" and uid = "+book.getUid());
				}
			}
	    	sb.append(" order by  bid asc");
	    	return  db.selectPageForMysql(page, rows, Book.class, sb.toString());
		}
	// 其他
}
