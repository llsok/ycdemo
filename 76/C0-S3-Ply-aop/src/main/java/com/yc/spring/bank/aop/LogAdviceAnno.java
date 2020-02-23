package com.yc.spring.bank.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

// @Bean ===> 类之上用 ？？？
@Component
@Aspect
public class LogAdviceAnno {

	// 定义切点方法
	@Pointcut("execution(* com.yc.spring.bank.biz.*.*(..))")
	public void myPc() {
	}

	// 定义切点方法
	@Pointcut("execution(* com.yc.spring.common.dao.*.*(..))")
	public void myPc1() {
	}
	
	// 定义切点方法
	@Pointcut("execution(* com.yc.spring.bank.action.*.*(..))")
	public void myPc2() {
	}

	// 前置增强
	@Before("myPc1()")
	public void before(JoinPoint jp) {
		System.out.println("Anno 方法签名：" + jp.getSignature());
		System.out.println("Anno 方法参数列表：" + Arrays.toString(jp.getArgs()));
		System.out.println("========Anno before========");
	}

	// 后置增强: 不管业务方法正确执行完成，都会调用
	@After("myPc()")
	public void after(JoinPoint jp) {
		System.out.println("========Anno after========");
	}

	// 返回增强，实在方法正常执行之后，才调用，返回增强要指定业务方法返回的值，对应的参数
	@AfterReturning(value = "myPc()", returning = "ret")
	public void afterReturning(JoinPoint jp, Object ret) {
		System.out.println(ret);
		System.out.println("========Anno afterReturing ========");
	}

	// 异常增强
	@AfterThrowing(value = "myPc()", throwing = "e")
	public void afterThrowing(JoinPoint jp, Throwable e) {
		System.out.println(e);
		System.out.println("========Anno afterThrowing ========");
	}

	/**
	 * 环绕增强：
	 * 	性能监控
	 * 	事务管理
	 * 
	 * ProceedingJoinPoint 环绕增强特有的连接点
	 * 环绕增强的业务方法的执行，由环绕增强特有的连接点对象来控制执行
	 */
	@Around("myPc2()")
	public Object around(ProceedingJoinPoint pjp) {
		try {
			long starttime = System.currentTimeMillis();
			System.out.println("========环绕增强   before ========");
			Object ret = pjp.proceed(); // 执行业务方法并返回结果
			System.out.println("共耗时：" + (System.currentTimeMillis() - starttime));
			System.out.println("========环绕增强   afterReturning ========");
			return ret;
		} catch (Throwable e) {
			System.out.println("========环绕增强   afterThrowing ========");
			return null;
		} finally {
			System.out.println("========环绕增强   after ========");
		}
	}

}
