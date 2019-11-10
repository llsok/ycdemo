package com.yc.novel.util;

import java.util.*;

import com.yc.novel.bean.Novel;
/**
 * 分页查询结果封装类（共有的静态的内部类）
 */
public class Page {
	 // 当前页数?
    private  List<Novel> data;
    // 总行?
    private long total;
    private int page;
	private int rows;
   

    public Page(List<Novel>data, long total, int page, int rows) {
		super();
		this.data = data;
		this.total = total;
		this.page = page;
		this.rows = rows;
	}

	

	//获取所有的数据
    public List<Novel> getData() {
        return data;
    }

    //获取全部的页面数
    public long getTotal() {
        return total;
    }
    //获取当前页面数字
    public int getPage(){
    	return page;
    }
    
    //获取最后一个页面数?
    public int getLastPage(){
    	long lastPage = total / rows;
    	return (int) (total % rows == 0 ?  lastPage : (lastPage + 1));
    }
    //获取下一个页面数?
    public int getNextPage(){
    	int lastpage = getLastPage();
    	return page < lastpage ? page + 1 : lastpage;
    }
    //获取上一个页面数?
    public int getPreviousPage(){
    	return page > 1 ? page - 1 : 1;
    }
    //获取第一个页?
    public int getFirstPage(){
    	return 1;
    }
}
