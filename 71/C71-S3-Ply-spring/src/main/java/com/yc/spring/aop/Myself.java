package com.yc.spring.aop;

//真实主题（被代理主题）
public class Myself implements Buy, java.io.Serializable { // 真正买东西的角色 ： 我
	public void buy() {
		System.out.println("我: 东西收到了，谢谢！");
	}
}
