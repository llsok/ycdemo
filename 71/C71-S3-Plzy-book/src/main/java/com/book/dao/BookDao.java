package com.book.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.book.bean.Book;

@Component
public class BookDao {
	@Resource
	private JdbcTemplate jdbcTemplate;

	public List<Book> selectAll() {
		String sql = "select * from books";
		return jdbcTemplate.query(sql, new RowMapper<Book>() {
			@Override
			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();
				book.setBookId(rs.getInt("bookid"));
				book.setBookName(rs.getString("bookname"));
				book.setBookPress(rs.getString("bookpress"));
				book.setPressDate(rs.getDate("pressdate"));
				book.setBookAuthor(rs.getString("bookauthor"));
				book.setBookCount(rs.getInt("bookcount"));
				book.setBookImage(rs.getString("bookimage"));
				return book;
			}

		});
	}

	public int del(String bookid) {
		String sql = "delete from books where bookid= ?";
		return jdbcTemplate.update(sql, bookid);
	}

	public Book selectByBookId(String bookid) {
		String sql = "select * from books where bookid=?";
		// 因为jdbcTemplate.query()方法只能接收参数数组 所以将参数填入一个数组中使用
		Object[] args = { bookid };
		return (Book) jdbcTemplate.query(sql, args, new ResultSetExtractor<Book>() {
			@Override
			public Book extractData(ResultSet rs) throws SQLException, DataAccessException {
				rs.next();
				Book book = new Book();
				book.setBookId(rs.getInt("bookid"));
				book.setBookName(rs.getString("bookname"));
				book.setBookPress(rs.getString("bookpress"));
				book.setPressDate(rs.getDate("pressdate"));
				book.setBookAuthor(rs.getString("bookauthor"));
				book.setBookCount(rs.getInt("bookcount"));
				book.setBookImage(rs.getString("bookimage"));
				return book;
			}

		});
	}

	public int updateBook(Book book) {
		String sql = "update books set bookname=? , bookpress= ? , pressdate= ? ,"
				+ "bookauthor= ? , bookcount = ? ,bookimage= ? where bookid=?";
		Object[] args = { book.getBookName(), book.getBookPress(), book.getPressDate(), book.getBookAuthor(),
				book.getBookCount(), book.getBookImage(), book.getBookId() };
		return jdbcTemplate.update(sql, args);
	}

	public int insert(Book book) {
		String sql="insert into books values(null,?,?,?,?,?,?)";
		Object[] args = { book.getBookName(), book.getBookPress(), book.getPressDate(), book.getBookAuthor(),
				book.getBookCount(), book.getBookImage() };
		return jdbcTemplate.update(sql, args);
	}

	public List<Book> fuzzyQuery(String qbookname, String qbookpress, String qbookauthor) {
		String sql="select * from books where 1=1 ";
		if(!qbookname.trim().equals("")&&qbookname!=null) {
			sql+=" and bookname like concat(\'%\',\'"+qbookname+"\',\'%\')";
		}
		if(!qbookpress.trim().equals("")&&qbookpress!=null) {
			sql+=" and bookpress like concat(\'%\',\'"+qbookpress+"\',\'%\')";
		}
		if(!qbookauthor.trim().equals("")&&qbookauthor!=null) {
			sql+=" and bookauthor like concat(\'%\',\'"+qbookauthor+"\',\'%\')";
		}
		return jdbcTemplate.query(sql,new RowMapper<Book>() {
			@Override
			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();
				book.setBookId(rs.getInt("bookid"));
				book.setBookName(rs.getString("bookname"));
				book.setBookPress(rs.getString("bookpress"));
				book.setPressDate(rs.getDate("pressdate"));
				book.setBookAuthor(rs.getString("bookauthor"));
				book.setBookCount(rs.getInt("bookcount"));
				book.setBookImage(rs.getString("bookimage"));
				return book;
			}
			
		});
	}
}
