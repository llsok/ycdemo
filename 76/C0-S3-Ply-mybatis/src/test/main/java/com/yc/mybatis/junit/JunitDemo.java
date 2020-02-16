package com.yc.mybatis.junit;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;

import com.yc.mybatis.dao.HallMapperTest;

public class JunitDemo {
	/**
	 * Test注解：表示该方式是一个测试的方法
	 * Before注解：表示该方式是在被测试的方法执行“前”执行的方法
	 * After注解：表示该方式是在被测试的方法执行“后”执行的方法
	 * 
	 * 作业：
	 * 	1、Junit 测试错误结果统计：1、测试失败（错误的问题），2、测试错误（结果不正确，捕获断言错误）
	 * 	2、请参考 junit API， 自定义实现 @BeforeClass、@AfterClass
	 */

	public static void main(String[] args) {
		Object obj = new HallMapperTest();
		JunitDemo jd = new JunitDemo();
		jd.testObject(obj);
	}

	public void testObject(Object obj) {
		if (obj == null) {
			return;
		}
		Class<?> cls = obj.getClass();
		// 获取所有的共有方法
		Method[] methods = cls.getMethods();
		//将不同方法（Test、Before、After） 放入各自集合中
		List<Method> tList = new ArrayList<Method>();
		List<Method> bList = new ArrayList<Method>();
		List<Method> aList = new ArrayList<Method>();
		for (Method m : methods) {
			Test t = m.getAnnotation(Test.class);
			if (t != null) {
				tList.add(m);
			}
			Before b = m.getAnnotation(Before.class);
			if (b != null) {
				bList.add(m);
			}
			After a = m.getAnnotation(After.class);
			if (a != null) {
				aList.add(m);
			}
		}

		int success = 0;
		int failure = 0;
		//启动测试：循环 test 方法集合
		for (Method m : tList) {
			//调动 test 方法，在执行前后，调用 before 方法和 after方法{
			try {
				// 执行before方法
				for (Method bm : bList) {
					try {
						bm.invoke(obj);
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
				}
				// 执行测试方法
				m.invoke(obj);
				// 执行after
				for (Method am : aList) {
					try {
						am.invoke(obj);
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
				}
				success++;
			} catch (Exception e) {
				e.printStackTrace();
				failure++;
			}
		}
		//运行通过，没有出现异常的，统计为正确，出现异常则错误数加一
		System.out.println("测试通过方法数量：" + success);
		System.out.println("测试失败方法数量：" + failure);
	}
}
