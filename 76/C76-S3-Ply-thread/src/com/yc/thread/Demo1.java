package com.yc.thread;

/**
 * join 案例
 */
public class Demo1 {
	
	public static void main(String[] args) {
		/**
		 * 使用匿名类创建线程
		 */
		Thread t1 = new Thread("看书"){
			@Override
			public void run() {
				for(int i=0; i<100;i++){
					System.out.println(Thread.currentThread().getName() + i);
					try {
						Thread.sleep(20);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		};
		
		Thread t2 = new Thread("听歌"){
			@Override
			public void run() {
				for(int i=0; i<100;i++){
					
					if(i==50){
						try {
							// 听歌线程当前处于 阻塞 状态
							t1.join();
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
					
					System.out.println(Thread.currentThread().getName() + i);
					try {
						Thread.sleep(20);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		};
		
		t1.start();
		t2.start();
		
	}

}
