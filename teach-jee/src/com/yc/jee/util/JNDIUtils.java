package com.yc.jee.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JNDIUtils {

	@SuppressWarnings("unchecked")
	public static <T> T lookup(String jndi) {
		try {
			Context cxt = new InitialContext();
			return (T) cxt.lookup("java:comp/env/" + jndi);
		} catch (NamingException e) {
			throw new RuntimeException(e);
		}
	}

	public static Connection getConnection(String jndi) {
		DataSource ds = lookup(jndi);
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
