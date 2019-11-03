package com.yc.damai.servlet;

import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * 用户在线监听器
 * 
 * 监听器没有资源路径
 * 
 * 问题：如果会话自动失效，如何监听在线人数
 * 
 * 
 */
@WebListener
public class OnLineListener implements HttpSessionAttributeListener {
	
	private HashSet<Object> userSet = new HashSet<>();

	/**
     * 新增属性触发的事件方法
     * 
     * HttpSessionBindingEvent e 保存着当前添加的属性值
     */
    public void attributeAdded(HttpSessionBindingEvent e)  { 
        // 每一次登陆，我保存登陆的用户对象到一个集合中
    	if("loginedUser".equals(e.getName())){
    		userSet.add(e.getValue());
    		// 获取应用上下文对象  也就是 jsp 的 application
    		ServletContext application = e.getSession().getServletContext();
    		if(application.getAttribute("onlineUserSet") == null ){
    			application.setAttribute("onlineUserSet", userSet);
    		}
    	}
    }

	/**
     * 移除属性触发的事件方法
     */
    public void attributeRemoved(HttpSessionBindingEvent e)  { 
    	if("loginedUser".equals(e.getName())){
    		userSet.remove(e.getValue());
    	}
    }

	/**
     * 替换（修改）属性触发的事件方法
     */
    public void attributeReplaced(HttpSessionBindingEvent e)  { 
         
    }
	
}
