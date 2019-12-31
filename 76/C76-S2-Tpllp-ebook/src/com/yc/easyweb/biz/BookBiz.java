package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.biz.BizException;
import com.yc.easyweb.bean.Book;
import com.yc.easyweb.bean.BookChild;
import com.yc.easyweb.bean.OrderDetial;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.dao.BookDao;

/**
 * 操作book表的事务类
 * 
 * @author psq
 *
 */
public class BookBiz {

	private BookDao dao = new BookDao();

	// 查询所有
	public List<Book> selectAll(Book book) throws  IOException, BizException {
		if (book == null) {
			throw new BizException("请填写书籍信息！！！");
		}
		return dao.selectAll(book);
	}
	// 查询单条
	public Book selectSingle(Book book) throws BizException, IOException {
		if (book == null) {
			throw new BizException("请填写书籍信息！！！");
		}
		if(book.getBid() == 0  && book.getBname() == null ){
			throw new BizException("未指定书籍！！！");
		}
		return dao.selectSingle(book);
	}
	// 添加
	public int insert(Book book) throws BizException, SQLException {
		if (book == null) {
			throw new BizException("请填写书籍信息！！！");
		}
		if(book.getBname() == null ){
			throw new BizException("请填写书名！！！");
		}else if(book.getBname().isEmpty()){
			throw new BizException("请填写书名！！！");
		}
		if(book.getBprice() == 0){
			throw new BizException("请填写书籍价格！！！");
		}
		return dao.insert(book);
	}

	// 删除
	public int delete(Book book) throws BizException, SQLException, IOException {
		if (book == null) {
			throw new BizException("请填写书籍信息！！！");
		}
		if(book.getBid() == 0 && book.getUid() ==0 && book.getBname() == null){
			throw new BizException("未指定删除的书籍！！！");
		}
		EorderBiz biz = new EorderBiz();
		OrderDetial eo = new OrderDetial();
		eo.setBid(book.getBid());
		List<OrderDetial> list = biz.selectAllDetail(eo);
		if(list.size() != 0 ){
			for(OrderDetial o : list){
				if(o.getEostate() != 5 && o.getEostate() != 6){
					throw new BizException("还有订单未处理完不能删除！！！");
				}
			}
		}
		return dao.delete(book);
	}

	// 删除多条
	public int deleteMore(List<Book> list) throws BizException, SQLException, IOException {
		if (list.size() == 0) {
			throw new BizException("请填写书籍信息！！！");
		}
		for(Book book : list){
			if(book.getBid() == 0 && book.getUid() ==0 && book.getBname() == null){
				throw new BizException("未指定删除的书籍！！！");
			}
			EorderBiz biz = new EorderBiz();
			OrderDetial eo = new OrderDetial();
			eo.setBid(book.getBid());
			List<OrderDetial> list1 = biz.selectAllDetail(eo);
			if(list1.size() != 0 ){
				for(OrderDetial o : list1){
					if(o.getEostate() != 5 && o.getEostate() != 6){
						throw new BizException("还有订单未处理完不能删除！！！");
					}
				}
			}
		}
			return dao.delete(list);
	}

	// 更新
	public int update(Book newBook, Book oldBook) throws BizException, SQLException {
		if (newBook == null ) {
			throw new BizException("请填写需要修改的信息！！！");
		}
		if (oldBook == null ) {
			throw new BizException("请填写需要修改的书籍！！！");
		}
		if(oldBook.getBid() == 0 && oldBook.getBname() == null && oldBook.getBtid() == 0){
			throw new BizException("请填写需要修改的书籍信息！！！");
		}
		return dao.update(newBook, oldBook);
	}
	//分页
	public Page<Book> bookPage(int page, int rows,Book book) throws IOException{
		return dao.bookPage(page, rows, book);
	}
	public Page<Book> bookChildPage(int page, int rows,BookChild book) throws IOException{
		return dao.bookChildPage(page, rows, book);
	}
	// 其他
}
