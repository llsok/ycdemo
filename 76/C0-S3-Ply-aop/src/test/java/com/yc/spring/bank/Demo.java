package com.yc.spring.bank;

public class Demo {

	public static void main(String[] args) {
		
		A real1 = new Real();   // 引用转型，父类指向子类对象 ， 多态
		System.out.println("未代理的对象");
		real1.play();
		
		A real2 = new StaticProxy();
		System.out.println("代理的对象");
		real2.play();
	}
}


interface A {
	void play();
}

/**
 * 真实的业务类
 */
class Real implements A{

	@Override
	public void play() {
		System.out.println(" 开心的玩 ");
	}
	
}

/**
 * 代理类
 */
class StaticProxy implements A {
	
	Real real = new Real();

	@Override
	public void play() {
		System.out.println(" 准备好玩具 ");
		real.play();
		System.out.println(" 守时好玩具 ");
	}
	
}





