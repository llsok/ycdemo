package com.yc.spring.bank;

import java.lang.reflect.Method;

import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

/**
 * 动态字节码技术，动态生成目标对象的子类对象
 * 
 * Enhancer 类      MethodInterceptor 接口
 */
public class CGLIBProxy implements MethodInterceptor{
	
	private Object targetObject;

	@Override
	/**
	 * Object proxy, 	代理对象
	 * Method method, 	子类的方法
	 * Object[] args, 	参数列表
	 * MethodProxy superMethod	父类的方法（代理对象）
	 */
	public Object intercept(Object proxy, Method method, Object[] args, 
			MethodProxy superMethod) throws Throwable {
		System.out.println(" 准备好玩具 ===" + method.getName());
		Object ret = superMethod.invoke(targetObject, args);
		System.out.println(" 收拾好玩具 ===" + ret);
		return ret;
	}
	
	@SuppressWarnings("unchecked")
	public <E> E buildProxy(E targetObject) {
		this.targetObject = targetObject;
		Enhancer enhancer = new Enhancer();
		// 设置父类的类对象
		enhancer.setSuperclass(targetObject.getClass());
		// 设置方法回调对象 this
		enhancer.setCallback(this);
		// 创建代理对象
		return (E) enhancer.create();
	}
	
	public static void main(String[] args) {
		// 真实主题==》被代理对象
		A real1 = new Real();
		
		CGLIBProxy cglibProxy = new CGLIBProxy();
		A real2 = cglibProxy.buildProxy(real1);
		
		real2.play();
	}
}
