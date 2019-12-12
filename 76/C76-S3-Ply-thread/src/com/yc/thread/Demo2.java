package com.yc.thread;

/**
 * 线程分类
 * 1、父线程   默认情况下，父线程会等到所有的子线程执行完才结束，尽管主线程的代码已经执行完，主线程仍然会等待
 * 2、子线程
 * 2、精灵线程（守护线程） setDaemon(true)必须在启动前设置好
 *
 */
public class Demo2 {
	
	
	public static void main(String[] args) {
		
		
		
		Thread t1 = new Thread("精灵线程"){
			@Override
			public void run() {
				for(int i=0; i<100;i++){
					System.out.println(Thread.currentThread().getName() + i);
					try {
						Thread.sleep(50);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		};
		
		// 主线程不会等到精灵线程执行完，才结束
		t1.setDaemon(true);
		
		t1.start();
		
		for(int i=0; i<100;i++){
			System.out.println(Thread.currentThread().getName() + i);
			try {
				Thread.sleep(20);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("主程序的代码已经执行完毕");
	}

}
