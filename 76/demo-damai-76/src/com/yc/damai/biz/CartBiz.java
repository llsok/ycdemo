package com.yc.damai.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.yc.damai.dao.ProductDao;

import redis.clients.jedis.Jedis;

public class CartBiz {
	
	private ProductDao pdao = new ProductDao();
	
	public void addCart(String uid, String pid, int number){
		Jedis jedis = new Jedis("127.0.0.1",6379);
		
		try{
			String cartNo = "cart_" + uid;
			/**
			 * 分析：要存储数量，那么购物车集合就不能只保存商品id，还必须带上数量。
			 * 		因此，将商品id和商品数量拼接成一个字符串保存，
			 * 		例如：23:3 表示3个编号（pid）为23的商品 
			 */
			// 获取用户的购车set集合
			Set<String> set = jedis.smembers(cartNo);
			for(String oldData : set) {
				// 解析出商品pid和购物车数量
				String[] items = oldData.split(":");
				// 查找商品（比较pid）
				if(items[0].equals(pid)) {
					// 计算添加后的数量
					number += Integer.parseInt(items[1]);
					// 构建新的存储的数据
					String newData = pid + ":" + number;
					// 删除原有的数据
					jedis.srem(cartNo, oldData);
					// 添加新的数据
					jedis.sadd(cartNo, newData);
					// 注意：完成后立即退出
					return;
				}
			}
			// 如果循环完成，还没有退出程序，说明这次是向购物车添加一个新的商品
			jedis.sadd(cartNo, pid + ":" + number);
			/**
			 * 至此，1、基于Redis实现用户购物商品数量的增减，要求将数量也保存在redis中  完成！！！
			 */
		} finally {
			jedis.close();
		}
	}
	
	/**
	 * 根据用户查询购物车商品信息
	 * @param uid
	 * @return
	 */
	public List<Map<String,Object>> queryByUid(String uid){
		Jedis jedis = new Jedis("127.0.0.1",6379);
		try{
			String cartNo = "cart_" + uid;
			// 获取用户的购车set集合
			Set<String> set = jedis.smembers(cartNo);
			List<String> pList = new ArrayList<>();
			for(String oldData : set) {
				// 解析出商品pid和购物车数量
				String[] items = oldData.split(":");
				// 将商品id添加到集合中
				pList.add(items[0]);
			}
			// 查出商品信息，注意，这里返回的是Map集合，目的是为了等下要将购物车商品数量加入进去
			List<Map<String,Object>> ret = pdao.selectForCart(pList);
			for(String oldData : set) {
				String[] items = oldData.split(":");
				for(Map<String,Object> map : ret) {
					// 查找对应商品
					if(map.get("pid").toString().equals(items[0])) {
						// 将购物车数量加入，注意这里添加的键名“count”，页面展示时要用到
						map.put("count", Integer.parseInt(items[1]));
					}
				}
			}
			return ret;
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
