package com.yc.novel.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.google.common.collect.Sets;
import com.google.common.collect.Sets.SetView;
public class Test {
	public static void main(String[] args) {
		
		/*HashSet<String> hs = new HashSet<>();
		hs.add("ll");
		hs.add("kk");
		hs.add("kk");
		hs.add("nn");
		System.out.println(hs.size());
		for (String string : hs) {
			System.out.println(string);
		}*/
		
		HashSet<Integer> sets = Sets.newHashSet(1, 2, 3, 4, 5, 6);
		Set<Integer> sets2 = Sets.newHashSet(3, 4, 5, 6, 7, 8, 9);
		Iterator<Integer> iterator = sets.iterator();
		/*// 交集
		System.out.println("交集为：");
		SetView<Integer> intersection = Sets.intersection(sets, sets2);
		for (Integer temp : intersection) {
			System.out.println(temp);
		}*/
		// 差集
		System.out.println("差集为：");
		SetView<Integer> diff = Sets.difference(sets, sets2);
		for (Integer temp : diff) {
			System.out.println(temp);
		}
		/*// 并集
		System.out.println("并集为：");
		SetView<Integer> union = Sets.union(sets, sets2);
		for (Integer temp : union) {
			System.out.println(temp);
		}*/
	}
}
