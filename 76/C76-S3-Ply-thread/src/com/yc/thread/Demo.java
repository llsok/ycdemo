package com.yc.thread;

public class Demo {

	public static void main(String[] args) throws InterruptedException {
		
		/**
		 * 设定优先级，必须在线程启动前设置
		 */
		
		Thread t1 = new MyThread1();
		
		t1.setPriority(10);  // 1 表示最低优先级
		t1.start();
		
		Runnable r1 = new MyRunnable2();
		Thread t2 = new Thread(r1);
		
		t2.setPriority(1);  // 10 表示最低优先级
		t2.start();
		
		/**
		 * 线程创建方式：
		 * 1、继承 Thread 类
		 * 2、实现 Runnable 接口
		 */

	}

	public void demo() throws InterruptedException {
		// 主线程 main

		Thread t = Thread.currentThread();// 返回当前线程对象

		t.getId(); // 唯一标识
		t.getName(); // 名称
		t.getPriority(); // 优先级
		t.getState(); // 状态
		t.getThreadGroup(); // 线程组
		t.isAlive(); // 判断线程是否处于活动状态
		t.isDaemon(); // 判断当前线程是否是精灵线程
		t.isInterrupted(); // 判断线程是否处于中断状态

		Thread.currentThread();// 返回当前线程对象
		Thread.sleep(1000); // 线程休眠
		Thread.yield(); // 让渡、屈服

		t.join(); // 加入
		t.run(); // 运行代码逻辑方法
		t.start(); // 启动线程
	}

}

class A{
	
}

class B extends A implements Runnable{

	@Override
	public void run() {
		
	}
	
}


class MyThread1 extends Thread{

	@Override
	public void run() {
		for (int i = 0; i < 100; i++) {
			System.out.println("听歌 " + i);
			/*try {
				Thread.sleep(20);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}*/
		}
	}
	
}

class MyRunnable2 implements Runnable{

	@Override
	public void run() {
		for (int i = 0; i < 100; i++) {
			System.out.println("玩游戏 " + i);
			/*try {
				Thread.sleep(20);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}*/
		}
	}
	
}


