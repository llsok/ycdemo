package com.yc.spring.bbs.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.aop.Pointcut;
import org.springframework.stereotype.Component;

// 切面也是一个组件
@Component
@Aspect
public class LogAspect {
	
	// aspectj 表达式，用于对方法拦截的表达式定义
	// execution 表示要拦截的方法  切点  pointcut
	// Before 前置增强  advice
	@Before("execution(* com.yc.spring.bbs.biz.*.*(..))")
	/**
	 * 构造方法注入、setter注入、接口注入
	 * @param  Pointcut  p 连接点对象     joinpoint
	 */
	public void log(JoinPoint jp){
		
		jp.getSignature(); // 方法签名
		jp.getArgs();// 获取所有参数
		System.out.println("方法签名：" + jp.getSignature());
		System.out.println("获取所有参数：" + Arrays.toString(jp.getArgs()));
	}

}
