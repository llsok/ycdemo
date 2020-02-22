package com.yc.thread;

import java.util.ArrayList;
import java.util.List;

/**
 * 生产者与消费者模式
 * 
 * @author Administrator
 *
 */
public class Company {

	private List<Object> list = new ArrayList<>();

	public static void main(String[] args) {
		Company c = new Company();
		c.product();
		c.comsume();
	}

	/**
	 * 生产方法
	 */
	public void product() {

		new Thread("生产者") {
			public void run() {
				try {
					while (true) {
						synchronized (list) {
							for (int i = 0; i < 10; i++) {
								System.out.println(Thread.currentThread().getName() + "：生产了一个产品");
								Thread.sleep(200);
								list.add(new Object());
							}
							list.notify();
							// 等待消费者的通知
							list.wait();
						}
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}.start();

	}

	/**
	 * 消费方法
	 */
	public void comsume() {
		new Thread("消费者") {
			public void run() {
				try {
					synchronized (list) {
						while (true) {
							while (list.size() > 0) {
								System.out.println(Thread.currentThread().getName() + "：消费了一个产品");
								Thread.sleep(100);
								list.remove(0);
							}
							// 通知生产者开始生产
							list.notify();
							// 等待生产完成生产
							list.wait();
						}
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}.start();
	}

}
