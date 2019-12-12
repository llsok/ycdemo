package com.yc.thread;

import java.util.ArrayList;

/**
 * 
 * 双色球(1万行记录)，使用DBHelper 写入到数据库
 *
 */


public class Demo3 {

	ArrayList<Object> list = new ArrayList<>();

	public Demo3() {
		for (int i = 0; i < 100; i++) {
			list.add(i);
		}
	}

	/**
	 * synchronized 同步关键字 
	 * 1、加在方法之上 
	 * 		实例方法加在 synchronized 会锁定 当前对象（this）
	 * 		静态方法加在 synchronized 会锁定 当前类（class）
	 * 2、加在代码块之上
	 */
	public Object getObj() throws InterruptedException {

		// synchronized 中的对象是我要锁定的对象
		synchronized (this) {
			// 资源竞争
			if (list.size() > 0) {
				Thread.sleep(10);
				return list.remove(0);
			}
		}

		return null;
	}

	public static void main(String[] args) {

		Demo3 demo3 = new Demo3();

		MyThread t1 = new MyThread(demo3);
		MyThread t2 = new MyThread(demo3);
		MyThread t3 = new MyThread(demo3);
		MyThread t4 = new MyThread(demo3);

		t1.start();
		t2.start();
		t3.start();
		t4.start();

	}

}

class MyThread extends Thread {

	private Demo3 demo3;

	public MyThread(Demo3 demo3) {
		this.demo3 = demo3;
	}

	public void run() {

		Object obj;

		try {
			while ((obj = demo3.getObj()) != null) {
				System.out.println(Thread.currentThread().getName() + "获取了元素：" + obj);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}

}
