package com.yc.spring.bmi;

import org.springframework.stereotype.Component;

public class BmiFilter implements Filter {

	private double minHeight;
	private double maxHeight;
	private int minWeight;
	private int maxWeight;

	public boolean filter(Object obj) {
		if (obj == null) {
			throw new RuntimeException("要过滤的对象不能为null");
		}
		if (!(obj instanceof Person)) {
			throw new RuntimeException("要过滤的对象不是Person");
		}
		Person p = (Person) obj;
		if (p.getHeight() > minHeight && p.getHeight() < maxHeight&& p.getWeight() > minWeight
				&& p.getWeight() < maxWeight) {
			return true;
		}
		return false;
	}

	public void setMinHeight(double minHeight) {
		this.minHeight = minHeight;
	}

	public void setMaxHeight(double maxHeight) {
		this.maxHeight = maxHeight;
	}

	public void setMinWeight(int minWeight) {
		this.minWeight = minWeight;
	}

	public void setMaxWeight(int maxWeight) {
		this.maxWeight = maxWeight;
	}

}
