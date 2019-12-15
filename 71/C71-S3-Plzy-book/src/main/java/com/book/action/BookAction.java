package com.book.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.book.bean.Book;
import com.book.biz.BookBiz;

@Controller
public class BookAction {

	@Resource
	BookBiz bbiz;

	/**
	 * 获取所有书籍并添加到attribute中
	 * 
	 * @param m
	 * @return
	 */
	@ModelAttribute
	public List<Book> initBookList(Model m) {
		List<Book> bookList = bbiz.selectAll();
		m.addAttribute("bookList", bookList);
		return bookList;
	}

	/**
	 * 获得所有的的书籍
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("selectAll.do")
	public String selectAll(Model m) {
		return "bookList";
	}

	/**
	 * 删除目标书籍
	 * 
	 * @param bookid
	 * @param m
	 * @return
	 */
	@RequestMapping("del_{bookid}")
	@ResponseBody
	public String del(@PathVariable("bookid") String bookid, Model m) {
		if (bbiz.del(bookid) != 0) {
			return "删除成功";
		} else {
			return "删除失败";
		}
	}

	/**
	 * 修改目标书籍
	 * 
	 * @param bookid
	 * @param m
	 * @return
	 */
	@RequestMapping("mod_{bookid}")
	public void mod(@PathVariable("bookid") String bookid, Model m) {

	}

	@RequestMapping("edit_{bookid}")
	public String toEdit(@PathVariable("bookid") String bookid, Model m) {
		if (bookid.equals("0")) {
			Book book = new Book();
			book.setBookImage("/images/选择书籍图片.jpg");
			m.addAttribute("book", book);
			return "bookEdit";
		} else {
			Book book = bbiz.selectByBookId(bookid);
			m.addAttribute("book", book);
			return "bookEdit";
		}

	}

	@RequestMapping("modify")
	public ModelAndView update(@ModelAttribute Book book, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("book对象==============================" + book);
		if (book.getBookId() != null) {
			// 获取文件名

			String fn = file.getOriginalFilename();
			System.out.println("filename=========" + fn);
			// 将web路径转换为数据所存的路径 即 /images/xxx.jpg
			String path = "/images/" + fn;
			System.out.println("数据库存储路径名=======================" + path);
			book.setBookImage(path);
			bbiz.update(book);
			// 磁盘路径
			String diskPath = request.getServletContext().getRealPath(path);
			System.out.println("磁盘存储路径=============================" + diskPath);
			File fileobj = new File(diskPath);
			file.transferTo(fileobj);
			return new ModelAndView("bookList");
		} else {
			// 获取文件路径
			String fn = file.getOriginalFilename();
			System.out.println("filename=========" + fn);
			// 将web路径转换为数据所存的路径 即 /images/xxx.jpg
			String path = "/images/" + fn;
			System.out.println("数据库存储路径名=======================" + path);
			book.setBookImage(path);
			bbiz.insert(book);
			// 将web路径转换成磁盘路径
			String diskPath = request.getServletContext().getRealPath(path);
			System.out.println("磁盘存储路径=============================" + diskPath);
			File fileobj = new File(diskPath);
			file.transferTo(fileobj);
			return new ModelAndView("bookList");
		}
	}

	@RequestMapping("fuzzyQuery")
	@ResponseBody
	public List<Book> fuzzyQuery(@RequestParam("qbookname") String qbookname,
			@RequestParam("qbookpress") String qbookpress,
			@RequestParam("qbookauthor") String qbookauthor) {
		System.out.println("qbookname============"+qbookname);
		System.out.println("qbookpress============"+qbookpress);
		System.out.println("qbookauthor============"+qbookauthor);
		return bbiz.fuzzyQuery(qbookname,qbookpress,qbookauthor);
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// 添加日期转换类型
		binder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
	}
}
