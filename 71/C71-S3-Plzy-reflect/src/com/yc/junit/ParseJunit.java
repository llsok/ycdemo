package com.yc.junit;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ParseJunit {
	int successNum=0;
	int failNum=0;
	public void parseMethod(Class c) throws InstantiationException, IllegalAccessException, InterruptedException
			 {
		Object obj = c.newInstance();
		Method[] methods = c.getDeclaredMethods();

		Method[] before =new Method[1];
		Method[] after = new Method[1];
		Method[] Tests = null;

		int index = 0;
		
		// 循环所有的方法
		for (Method m : methods) {
			// 得到方法的注解
			Annotation[] myJunits = m.getAnnotations();
			for (int i = 0; i < myJunits.length; i++) {
				// 根据名字匹配注解的类型
				if (myJunits[0].annotationType().getSimpleName().endsWith("Before")) {
					before[0] = m;
				} else if (myJunits[0].annotationType().getSimpleName().endsWith("Test")) {
					if (Tests == null) {
						Tests = new Method[methods.length];
					}
					Tests[index] = m;
					index++;
				} else if (myJunits[0].annotationType().getSimpleName().endsWith("After")) {
					after[0] = m;
				}
			}
		}

		if(Tests!=null) {
			if (before != null&&after != null) {
				for(Method m:Tests) {
					if(m!=null) {
					new Thread(new Runnable() {
						@Override
						public void run() {
							try {
								before[0].invoke(obj);
								m.invoke(obj);
								after[0].invoke(obj);
								successNum++;
							} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
								e.printStackTrace();
								failNum++;
							}
						}
					}).start();
					Thread.sleep(1000);
					}
				}
			}
			System.out.println("成功次数："+successNum);
			System.out.println("失败次数："+failNum);
//			
//			if (after != null&&before == null) {
//				for(Method m:Tests) {
//					if(m!=null) {
//						m.invoke(obj);
//						after.invoke(obj);
//					}
//				}
//			}
//			
//			
//			if (after == null&&before != null) {
//				for(Method m:Tests) {
//					if(m!=null) {
//						before.invoke(obj);
//						m.invoke(obj);
//					}
//				}
//			}
//			
//			
//			if(after==null&&before==null) {
//				for(Method m:Tests) {
//					if(m!=null) {
//						m.invoke(obj);
//					}
//				}
//			}

			
		}
	}
}
