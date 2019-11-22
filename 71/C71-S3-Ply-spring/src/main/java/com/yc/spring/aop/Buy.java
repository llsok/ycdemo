package com.yc.spring.aop;

public interface Buy { // 买东西接口
	public abstract void buy();
}

// 真实主题（被代理主题）
class Myself implements Buy, java.io.Serializable { // 真正买东西的角色 ： 我
	public void buy() {
		System.out.println("我: 东西收到了，谢谢！");
	}
}

// 代理主题
class Other implements Buy { // 代理角色
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
