package com.yc.myassert;

public class MyAssert {
	public static void assertEquals(Object expected, Object actual) {
		if(!expected.equals(actual)) {
			failNotEquals(expected,actual);
		}
	}
	
	public static void assertNotNullEquals(Object expected) {
		if(expected.equals(null)) {
			fail("该对象为空");
		}
	}
	
	public static void assertTrue(boolean expected) {
		if(expected==false) {
			fail("实际是为"+expected);
		}
	}

	public static void failNotEquals( Object expected, Object actual) {
		String msg="期待值为："+expected+"但实际值是"+actual;
		fail(msg);
	}

	public static void fail(String msg) {
		if (msg == null) {
			throw new AssertionError();
		}
		throw new AssertionError(msg);
	}

}
