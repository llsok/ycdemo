package com.yc.junit;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 定义注解
 * @author LiuZiyuan
 *
 */

//注解的注解Target  定义该注解定义的位置
@Target(value= {ElementType.TYPE,ElementType.METHOD,ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface Test {
	public String name() default "test";
	
	public int type() default 0;
	
	public  String value();
	
	//如果注解有一个value 属性 那么value 就是该注解的默认属性，默认属性可以不用写属性名
	//（前提：只定义一个属性时）
}


