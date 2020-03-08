package com.yc.C76S3PlySpringBoot;

import java.io.IOException;
import java.util.Hashtable;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

// WebScock 服务器注解, value 表示的是建立连接的请求地址
@ServerEndpoint(value = "/websocket/{id}")
@Component
public class MyWebSocket {
	// Hashtable 用来存放每个客户端对应的 id : Session 对象。
	private static Hashtable<String,Session> webSocketMap = new Hashtable<>();

	// 连接建立成功调用的方法
	@OnOpen
	public void onOpen(@PathParam("id")String id, Session session) {
		session.getUserProperties().put("id", id);
		webSocketMap.put(id, session);
	}
	// 连接关闭调用的方法

	@OnClose
	public void onClose(Session session) {
		System.out.println(session);
		webSocketMap.remove(session.getUserProperties().get("id"));
	}
	// 收到客户端消息后调用的方法

	/**
	 * 在接收到消息时的事件方法
	 * @param message	接收到的消息
	 * @param session	发送者的会话
	 * @throws IOException 
	 */
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		String[] strings = message.split(":");
		String id = strings[0];
		message = strings[1];
		Session targetSession = webSocketMap.get(id);
		if(targetSession != null) {
			String msg = session.getUserProperties().get("id") + ": " + message;
			targetSession.getBasicRemote().sendText(msg);
		} else {
			System.out.println(id + "不在线!");
		}
	}
	
	/**
		参数说明
		@Scheduled 参数可以接受两种定时的设置，一种是我们常用的cron="* /6 * * * * ?",一种是 fixedRate = 6000，两种都表示每隔六秒打印一下内容。
		fixedRate 说明
		@Scheduled(fixedRate = 6000) ：上一次开始执行时间点之后6秒再执行
		@Scheduled(fixedDelay = 6000) ：上一次执行完毕时间点之后6秒再执行
		@Scheduled(initialDelay=1000, fixedRate=6000) ：第一次延迟1秒后执行，之后按fixedRate的规则每6秒执行一次
		
		一个cron表达式有至少6个（也可能7个）有空格分隔的时间元素。按顺序依次为：
		1 秒	（0~59）
		2 分钟	（0~59）
		3 小时	（0~23）
		4 天	（0~31）
		5 月	（0~11）
		6 星期	（1~7 1=SUN ）
		7 年份	（1970－2099）
		其中每个元素可以是一个值(如6),一个连续区间(9-12),一个间隔时间(8-18/4)(/表示每隔4小时),一个列表(1,3,5),
		通配符。由于”月份中的日期”和”星期中的日期”这两个元素互斥的,必须要对其中一个设置。
		
		cron表达式实例：
		　　0 0 2 1 * ? *   表示在每月的1日的凌晨2点调整任务
		　　0 15 10 ? * MON-FRI   表示周一到周五每天上午10:15执行作业
		　　0 15 10 ? 6L 2002-2006   表示2002-2006年的每个月的最后一个星期五上午10:15执行作
		　　0 0 10,14,16 * * ?   每天上午10点，下午2点，4点 
		　　0 0/30 9-17 * * ?   朝九晚五工作时间内每半小时 
		　　0 0 12 ? * WED    表示每个星期三中午12点 
		　　0 0 12 * * ?   每天中午12点触发 
		　　0 15 10 ? * *    每天上午10:15触发 
		　　0 15 10 * * ?     每天上午10:15触发 
		　　0 15 10 * * ? *    每天上午10:15触发 
		　　0 15 10 * * ? 2005    2005年的每天上午10:15触发 
		　　0 * 14 * * ?     在每天下午2点到下午2:59期间的每1分钟触发 
		　　0 0/5 14 * * ?    在每天下午2点到下午2:55期间的每5分钟触发 

		
	 */
    @Scheduled(cron="*/5 * 10-13 * * ?")
    private void process() throws IOException{
    	
    	System.out.println("======================" + System.currentTimeMillis()/1000);
       
    	for( Session session : webSocketMap.values()) {
    		String id = (String) session.getUserProperties().get("id");
    		session.getBasicRemote().sendText(id + ": 你好,现在时间是" + System.currentTimeMillis()/1000);
    	}
    }

}
