package com.yc.C71S3Plythymeleaf.web;

import java.io.IOException;
import java.util.Hashtable;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

@ServerEndpoint(value = "/websocket/{id}")
@Component
public class MyWebSocket {
	// 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	// private static int onlineCount = 0;
	
	private static Hashtable<String,Session> sessionTable = new Hashtable<>();
	
	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	// private Session session;

	/**
	 * 连接建立成功调用的方法, 那么 Session 对象就会被容器创建
	 * @param session
	 */
	@OnOpen
	public void onOpen(@PathParam("id") String id, Session session) {
		sessionTable.put(id, session);
	}

	// 连接关闭调用的方法
	@OnClose
	public void onClose(Session session) {
		sessionTable.remove(session.getId());
	}

	// 收到客户端消息后调用的方法
	@OnMessage
	public void onMessage(@PathParam("id") String id, String message, Session session) throws IOException {
		System.out.println(message);
		String[] idAndMsg = message.split(":");
		Session destSession = sessionTable.get(idAndMsg[0]);
		if(destSession!=null){
			destSession.getBasicRemote().sendText(idAndMsg[1]);
		} else {
			System.out.println("目标用户不在线！" + idAndMsg[0]);
		}
		
	}
}
