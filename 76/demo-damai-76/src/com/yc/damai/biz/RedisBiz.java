package com.yc.damai.biz;

import redis.clients.jedis.Jedis;

public class RedisBiz {
	
	public static void main(String[] args) {
		
		Jedis jedis = new Jedis("127.0.0.1",6379);
		
		try{
			jedis.set("book3", "redis");
			jedis.lpush("books", "test", "java", "c++");
		} finally {
			jedis.close();
		}
		
		
		
	}
	
	/**
	 * 加入购物车 
	 * 每个用户都定义一个set集合，用于保存商品pid
	 * 定义set键名：cart_1,cart_2
	 * 
	 * uid pid
	 * 
	 * 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
