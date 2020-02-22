package com.yc.mybatis.dao;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@MyAnno(value = "test", /*type= {"1","3"},*/type = "3")
public class AnnotationTest {
	@MyAnno
	String name;

	@MyAnno
	public void test() {

	}
	
	
	public static void main(String[] args) {
		MyAnno myanno = AnnotationTest.class.getAnnotation(MyAnno.class);
		System.out.println(myanno);
		
		myanno = SubAnnotationTest.class.getAnnotation(MyAnno.class);
		System.out.println(myanno);
		
		/**
		 * 定义作者的注解，配置在类上，要求通过反射获取到该类的作者
		 */
	}
	
}

// 定义注解
// 元注解：目标注解
@Target({ ElementType.TYPE, ElementType.FIELD, ElementType.METHOD })
// 元注解：保持性：SOURSE 源代码有效   CLASS 字节码有效   RUNTIME 运行时后效
@Retention(RetentionPolicy.RUNTIME)
/**
 * 添加公共文档Documented: 在默认情况下在使用javadoc自动生成文档时，注解将被省略掉，
 * 如果想在文档中也包含注解，必须使用Documented为文档注解.
 */
/**
 * @Inherited 表示该注解可以被子类继承
 */
@Inherited
@interface MyAnno {

	// 定义 name 属性  defalut 是默认值选项
	public String name() default "test";

	// value 是缺省属性名，默认属性在只写一个属性值的情况下，可以在定义时不加 value 名称
	public String value() default "";

	// 注解数组属性，使用{} 进行数组赋值， 如果只有一个值，可以省略 {}
	public String[] type() default {};

}


class SubAnnotationTest extends AnnotationTest{
	
}




