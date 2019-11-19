package com.yc.spring.bbs.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
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
		System.out.println("前置增强===方法签名：" + jp.getSignature());
		System.out.println("前置增强===获取所有参数：" + Arrays.toString(jp.getArgs()));
	}
	
	// 拦截dao包下的所有的 select 方法
	@After("execution(* com.yc.spring.bbs.dao.*.select*(..))")
	public void after(JoinPoint jp){
		System.out.println("后置增强===方法签名：" + jp.getSignature());
		System.out.println("后置增强===获取所有参数：" + Arrays.toString(jp.getArgs()));
	}
	
	/**
	 * 返回增强
	 * @param jp
	 * returning 属性用于定义 方法的返回值的名字
	 */
	@AfterReturning(returning="ret",pointcut="execution(* com.yc.spring.bbs.dao.*.select*(..))")
	public void afterRutening(JoinPoint jp, Object ret){
		System.out.println("返回增强===方法签名：" + jp.getSignature());
		System.out.println("返回增强===获取所有参数：" + Arrays.toString(jp.getArgs()));
	}
	
	@AfterThrowing(throwing="e",pointcut="execution(* com.yc.spring.bbs.dao.*.select*(..))")
	public void afterThrowing(JoinPoint jp,Exception e){
		System.out.println("异常增强===方法签名：" + jp.getSignature());
		System.out.println("异常增强===异常对象：" + e);
		System.out.println("异常增强===获取所有参数：" + Arrays.toString(jp.getArgs()));
	}
	
	/**
	 * 性能监控   环绕增强 必须由增强方法来执行业务方法
	 */
	@Around("execution(* com.yc.spring.bbs.biz.*.*(..))")
	public void around(ProceedingJoinPoint pjp){
		
		try {
			long start = System.currentTimeMillis();
			pjp.proceed();  // 执行业务方法
			long time = System.currentTimeMillis() - start;
			System.out.println(pjp.getSignature() + " 花了 " +  time + " 毫秒");
		} catch (Throwable e) {
			e.printStackTrace();
		}  
		
	}

}
