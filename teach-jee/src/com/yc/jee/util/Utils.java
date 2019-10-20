package com.yc.jee.util;

public class Utils {

	public static void close(AutoCloseable... cs) {
		for (AutoCloseable c : cs) {
			if (c != null)
				try {
					c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	}

}
