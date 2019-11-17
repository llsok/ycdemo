package com.yc.spring.bmi;

import org.springframework.stereotype.Component;

//算法
@Component
public class BmiMeasurer implements IMeasurable {

	public double measure(Object obj) {
		if (obj == null) {
			throw new RuntimeException("要测量的对象不能为null");
		}
		if (!(obj instanceof Person)) {
			throw new RuntimeException("要测量的对象不是Person");
		}
		// 提供bmi算法
		Person p = (Person) obj;
		double bmi = p.getWeight() / (p.getHeight() * p.getHeight());
		return bmi;
	}

}
