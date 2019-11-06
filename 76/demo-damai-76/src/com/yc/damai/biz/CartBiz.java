package com.yc.damai.biz;

import redis.clients.jedis.Jedis;

public class CartBiz {
	
	
	public void addCart(String uid, String pid){
		Jedis jedis = new Jedis("127.0.0.1",6379);
		
		try{
			String cartNo = "cart_" + uid; 
			jedis.sadd(cartNo, pid);
		} finally {
			jedis.close();
		}
	}
	
	
	/**
	 * 作业：
     * 基本功能
	 * 1、基于Redis实现用户购物商品数量的增减，要求将数量也保存在redis中
	 * 2、根据用户id查出保存在redis中的所有购物车商品pid，从数据库查询到对应商品信息并展示到页面上
     *
     * 进阶功能
     * 服务器关闭时，将Redis数据保存到磁盘上（持久化）。提示：使用监听器实现
     * 
	 */
	
	
	
	
	
	
	
	
	

}
