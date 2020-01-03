package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.BookType;
import com.yc.easyweb.dao.BookTypeDao;

/**
 * 操作BookType表的事务类
 * @author psq
 *
 */
public class BookTypeBiz {

	private BookTypeDao book = new BookTypeDao();
	
	//查询所有
		public List<BookType> selectAll(BookType bookType) throws IOException, BizException{
			if(bookType ==null){
				throw new BizException("请填写类型信息！！！");
			}
				return book.selectAll(bookType);
		}
		//添加
		public int insert(BookType bookType) throws BizException, SQLException{
			if(bookType ==null){
				throw new BizException("请填写类型信息！！！");
			}
			if(bookType.getBtname() == null ){
				throw new BizException("请填写主类型信息！！！");
			}else if(bookType.getBtname().isEmpty() ){
				throw new BizException("请填写主类型信息！！！");
			}
			if(bookType.getBtnamesecond() == null ){
				throw new BizException("请填写副类型信息！！！");
			}else if(bookType.getBtnamesecond().isEmpty()){
				throw new BizException("请填写副类型信息！！！");
			}
			return book.insert(bookType);
			
		}
		//删除
		public int delete(BookType bookType)throws BizException, SQLException{
			if(bookType ==null){
				throw new BizException("请填写需要删除的类型信息！！！");
			}
			if(bookType.getBtname() == null && bookType.getBtid() == 0 && bookType.getBtnamesecond() == null && bookType.getBtnamethird() == null){
				throw new BizException("请指定需要删除的类型！！！");
			}
				return book.delete(bookType);
		}
		//更新
		public  int update (BookType bookTypeNew,BookType bookTypeOld)throws BizException, SQLException {
			if(bookTypeOld ==null){
				throw new BizException("请填写类型信息！！！");
			}
			if(bookTypeOld.getBtname() == null && bookTypeOld.getBtid() == 0 && bookTypeOld.getBtnamesecond() == null && bookTypeOld.getBtnamethird() == null){
				throw new BizException("请指定需要修改的类型！！！");
			}
			if(bookTypeNew ==null){
				throw new BizException("请填写需要修改的信息！！！");
			}
			return book.update(bookTypeNew, bookTypeOld);
		}
		//其他
}
