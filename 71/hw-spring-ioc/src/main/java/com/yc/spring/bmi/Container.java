package com.yc.spring.bmi;

import java.util.ArrayList;
import java.util.List;

//测量的容器
public class Container {
	// 测量设备
	private IMeasurable measurer; 
	// 测量对象过滤器
	private Filter filter;
	// 存放测量对象的集合
	private List<Object> list = new ArrayList<>();
	// 最大的对象
	private Object max;
	// 最小的对象
	private Object min;
	// 测量结果平均值
	private double avg;
	// 测量结果汇总值
	private double total;

	public void setFilter(Filter filter) {
		this.filter = filter;
	}

	public void setMeasurer(IMeasurable measurer) {
		this.measurer = measurer;
	}

	/**
	 * 向容器添加对象
	 */
	public void add(Object obj) throws Exception {
		if (measurer == null) {
			throw new Exception("没有配备测量设备...");
		}
		if (obj == null) {
			return;
		}
		
		if(  this.filter!=null   ){
			if(   this.filter.filter(obj) ==false  ){
				throw new RuntimeException(  obj+",数据不合理...");
			}
		}
		list.add(obj);
	}
	
	/**
	 * 对容器中的对象进行测量
	 */
	public void measure() {
		for(Object obj : list) {
			double value = this.measurer.measure(obj);
			if (max == null && min == null) {
				max = obj;
				min = obj;
			} else {
				double maxvalue = this.measurer.measure(max);
				double minvalue = this.measurer.measure(min);
				if (value > maxvalue) {
					this.max = obj;
				}
				if (value < minvalue) {
					this.min = obj;
				}
			}
			total += value;
			avg = total / list.size();
		}
	}

	public double getTotal() {
		return total;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	public Object getMax() {
		return max;
	}

	public Object getMin() {
		return min;
	}

	public double getAvg() {
		return avg;
	}

}
