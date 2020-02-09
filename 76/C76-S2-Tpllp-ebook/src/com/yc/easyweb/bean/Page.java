package com.yc.easyweb.bean;

import java.util.*;


/**
 * 分页查询结果封装类（共有的静态的内部类）
 * @param <T>
 */
public class Page<T> {
	// 当前页数
    private  List<T> data;
    // 总行
    private long total;
    private int page;
	private int rows;
	public Page() {
		super();
	}
	public Page(List<T> data, long total, int page, int rows) {
		super();
		this.data = data;
		this.total = total;
		this.page = page;
		this.rows = rows;
	}

	//获取所有的数据
    public List<T> getData() {
        return data;
    }

    //获取最大页面数
    public long getTotal() {
        return total;
    }
    //获取当前页面数字
    public int getPage(){
    	return page;
    }
    
    //获取最后一个页面数字
    public int getLastPage(){
    	long lastPage = total / rows;
    	return (int) (total % rows == 0 ?  lastPage : (lastPage + 1));
    }
    //获取下一个页面数字
    public int getNextPage(){
    	int lastpage = getLastPage();
    	return page < lastpage ? page + 1 : lastpage;
    }
    //获取上一个页面数字
    public int getPreviousPage(){
    	return page > 1 ? page - 1 : 1;
    }
    //获取第一个页面
    public int getFirstPage(){
    	return 1;
    }
}
