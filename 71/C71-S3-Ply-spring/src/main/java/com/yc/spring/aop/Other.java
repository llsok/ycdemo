package com.yc.spring.aop;

//代理主题
public class Other implements Buy { // 代理角色
	private Myself myself; // 最终是我拿到东西，所以肯定要有我

	public Other() {
	}

	public Other(Buy my) {
		this.myself = (Myself) my;
	}

	public void buying() {
		System.out.println("代理人: 你托我买的东西，我买了!");
	}

	public void buy() {
		buying();
		myself.buy();
	}
}
