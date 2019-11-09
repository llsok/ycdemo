package com.yc.damai.servlet;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import redis.clients.jedis.Jedis;

/**
 * 应用上下文监听器
 */
@WebListener
public class ServerListener implements ServletContextListener {

	// 服务器停止时执行（注意是停止，不是意外关闭）
	public void contextDestroyed(ServletContextEvent e)  { 
    	Jedis jedis = new Jedis();
    	try {
    		System.out.println("Redis数据持久化。。。");
    		jedis.save();
    		System.out.println("Redis数据持久化完成！");
    	}finally {
    		jedis.close();
    	}
    }

	// 服务器启动时执行
    public void contextInitialized(ServletContextEvent e)  { 
    }
	
}
