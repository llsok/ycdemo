package com.book.bean;

import java.sql.Date;

public class Book {
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", bookPress=" + bookPress + ", pressDate="
				+ pressDate + ", bookAuthor=" + bookAuthor + ", bookCount=" + bookCount + ", bookImage=" + bookImage
				+ "]";
	}
	private Integer bookId;
	private String bookName;
	private String bookPress;
	private Date pressDate;
	private String bookAuthor;
	private Integer bookCount;
	private String bookImage;
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookPress() {
		return bookPress;
	}
	public void setBookPress(String bookPress) {
		this.bookPress = bookPress;
	}
	public Date getPressDate() {
		return pressDate;
	}
	public void setPressDate(Date pressDate) {
		this.pressDate = pressDate;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public Integer getBookCount() {
		return bookCount;
	}
	public void setBookCount(Integer bookCount) {
		this.bookCount = bookCount;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public Book(Integer bookId, String bookName, String bookePress, Date pressDate, String bookAuthor,
			Integer bookCount, String bookImage) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookPress = bookPress;
		this.pressDate = pressDate;
		this.bookAuthor = bookAuthor;
		this.bookCount = bookCount;
		this.bookImage = bookImage;
	}
	public Book() {
		super();
	}
	
}
