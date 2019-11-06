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

}
