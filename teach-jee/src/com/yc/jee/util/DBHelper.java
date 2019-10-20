package com.yc.jee.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DBHelper {
	private static String url;
	private static String user;
	private static String[] password;

	static {
		InputStream in = DBHelper.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			/**
			 * 读取配置文件
			 * Properties key : value
			 */
			Properties p = new Properties();
			p.load(in);
			init( p.getProperty("driver"),  
					p.getProperty("url"),  
					p.getProperty("user"), 
					p.getProperty("password"));
		} catch (Exception e) {
			throw new RuntimeException("数据库驱动加载失败！", e);
		} finally {
			Utils.close(in);
		}
	}

	/**
	 * 创建连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() {
		for (int i = 0; i < password.length; i++) {
			String p = password[i];
			try {
				Connection conn = DriverManager.getConnection(url, user, p);
				if(i>0) {
					String tmp = password[i];
					password[i] = password[0];
					password[0] = tmp;
				}
				return conn;
			} catch (SQLException e) {
				continue;
			}
		}
		throw new RuntimeException(String.format("获取数据库连接失败！连接URL：%s\t用户名：%s\t密码：%s", 
				DBHelper.url, DBHelper.user, Arrays.toString(DBHelper.password)));
	}
	
	public static void init(String url) {
		init(null, url, null, null);
	}
	
	public static void init(String url, String user, String password) {
		init(null, url, user, password);
	}
	
	public static void init(String driver, String url, String user, String password) {
		if( driver != null ) {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				throw new RuntimeException("数据库驱动加载失败！", e);
			}
		}
		DBHelper.url = url == null ? DBHelper.url : url;
		DBHelper.user = user == null ? DBHelper.user : user;
		DBHelper.password = password == null ? DBHelper.password : password.split(";");
	}
	
	public static void executeByReader(Reader reader) {
		String endl = System.getProperty("line.separator");
		Connection conn = null;
		BufferedReader br = null;
		StringBuilder sql = new StringBuilder();
		try {
			br = new BufferedReader(reader);
			String line;
			conn = getConnection();
			Statement stat = conn.createStatement();
			while ((line = br.readLine())!=null) {
				//line = new String(line.getBytes("gbk"), "utf-8");
				sql.append(line).append(endl);
				if(line.endsWith(";")) {
					System.out.println("SQL:" + sql);
					stat.execute(sql.toString());
					sql.delete(0, sql.length());
				}
			}
		} catch (IOException e) {
			throw new RuntimeException("数据库语句读取失败!", e);
		} catch (SQLException e) {
			throw new RuntimeException("数据库操作失败!", e);
		} finally {
			Utils.close(reader, br, conn);
		}
	}
	public static void executeByText(String sqltext) {
		executeByReader(new StringReader(sqltext));
	}
	public static void executeByFile(String sqlfile) {
		executeByFile(new File(sqlfile));
	}
	public static void executeByFile(File sqlfile) {
		try {
			FileInputStream fis = new FileInputStream(sqlfile);
			InputStreamReader isr = new InputStreamReader(fis, "utf-8");
			executeByReader(isr);
		} catch (FileNotFoundException e) {
			throw new RuntimeException("数据库脚本文件不存在!", e);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("数据库脚本文件编码格式错误!", e);
		}
	}

	/**
	 * 执行增删改SQL
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static int update(String sql, Object... param) {
		Connection conn = null;
		try {
			// 获取连接
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("参数"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			// 异常转型
			throw new RuntimeException("SQL执行错误�?", e);
		} finally {
			// 打印关闭异常
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 只查询一条记录的查询 0~1 行， 如果查出多条记录，则抛出运行期异常，提示用户结果数大�?1
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static Map<String, Object> selectOne(String sql, Object... param) {
		
		Connection conn = null;
		try {
			// 获取连接
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("参数"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			ResultSet rs = ps.executeQuery();
			/**
			 * 获取结果集元数据对象 meta
			 */
			ResultSetMetaData rsmd = rs.getMetaData();
			if (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<String, Object>();
				for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
					// 获取列名
					String ColumnName = rsmd.getColumnName(i);
					// 获取列名
					row.put(ColumnName, rs.getObject(ColumnName));
				}
				if(rs.next()){
					throw new RuntimeException("结果数大�?1!");
				} else {
					return row;
				}
			} else {
				return null;
			}
		} catch (SQLException e) {
			// 异常转型
			throw new RuntimeException("SQL执行错误�?", e);
		} finally {
			// 打印关闭异常
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}

	/**
	 * 查询多条记录 0~N �?
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static List<Map<String, Object>> selectList(String sql, Object... param) {

		Connection conn = null;
		try {
			// 获取连接
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("参数"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			ResultSet rs = ps.executeQuery();
			List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
			/**
			 * 获取结果集元数据对象 meta
			 */
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<String, Object>();
				for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
					// 获取列名
					String ColumnName = rsmd.getColumnName(i);
					// 获取列名
					row.put(ColumnName, rs.getObject(ColumnName));
				}
				ret.add(row);
			}
			return ret;
		} catch (SQLException e) {
			// 异常转型
			throw new RuntimeException("SQL执行错误�?", e);
		} finally {
			// 打印关闭异常
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	 /**
     * 查询指定sql语句 , 返回单个�?, 默认返回第一行记录的第一个字段�??
     * 如果未查询到结果返回null 
     * 应用场景: select count(*) from * emp;
     * 
     * @param sql
     * @param params 参数列表
     * @return
     */
    public static Object selectValue(String sql, Object... param) {
    	Connection conn = null;
		try {
			// 获取连接
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("参数"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				//返回第一行记录的第一个字段�??, OK 了就这么�?单粗暴！！！
				return rs.getObject(1);
			} else {
				return null;
			}
		} catch (SQLException e) {
			// 异常转型
			throw new RuntimeException("SQL执行错误�?", e);
		} finally {
			// 打印关闭异常
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
    }
	
	/**
     * ============以下是高级部�? ( 选做 ) ============
     * 分页查询指定sql语句, 返回的数据封装在Page对象�?
     * 方法调用示例 : 
     * selectPage("select * from emp where empno  > ?" , 2 , 5, 1000)
     * @param sql
     * @param page        查询的页�?
     * @param rows        每页的行�?
     * @param params    参数列表
     * @return
     */
    public static Page selectPageForOracle(String sql, int page, int rows, Object... params) {
    	String totalSql = "select count(*) from ("+sql+")";   
    	Object totalObj = selectValue(totalSql, params);
    	long total = Long.parseLong(totalObj.toString());
    	int startRow = (page - 1 ) * rows;
    	int endRow= page * rows + 1;
    	String pageSql = " select * from "
    			+ "(select a.*,rownum rn from ("+sql+") a where rownum < "+endRow+") a"
    			+ " where a.rn > " + startRow;
    	List<Map<String,Object>> data = selectList(pageSql,params);
        return new Page(total, data);
    }

    public static Page selectPageForMysql(String sql, int page, int rows, Object... params) {
    	String totalSql = "select count(*) from ("+sql+")";   
    	Object totalObj = selectValue(totalSql, params);
    	long total = Long.parseLong(totalObj.toString());
    	int startRow = (page - 1 ) * rows;
    	String pageSql = "select count(*) from ("+sql+") limit " + startRow + ", " + rows;
    	List<Map<String,Object>> data = selectList(pageSql,params);
        return new Page(total, data);
    }

    /**
     * 分页查询结果封装类（共有的静态的内部类）
     */
    public static class Page {
        // 当前页数�?
        private List<Map<String,Object>> data;
        // 总行�?
        private long total;

        public Page(long total, List<Map<String,Object>> data) {
            this.data = data;
            this.total = total;
        }

        public List<Map<String,Object>> getData() {
            return data;
        }

        public long getTotal() {
            return total;
        }

    }

	/**
	 * 判断参数 param 是否为空 , 不为空则返回条件 condition, 并且�? param 加到 params �?
	 * 如果为空, 则放回空字符�? ( "" ), 用于拼接sql
	 * 该方法可能会被多�? dao 类中使用 , 因此�?后要放到 DBHelper 中去,成为�?个工具方�?
	 * @param param      参数�?
	 * @param params     参数集合
	 * @param condition  条件sql
	 * @return
	 */
	public static String buildCondition(Object param, ArrayList<Object> params, String condition) {
		if(param!=null) {
			if(param instanceof String) {
				String sparam = (String) param;
				sparam = sparam.trim();
				if(sparam.isEmpty()) {
					return "";
				} else {
					param = sparam;
				}
			}
			params.add(param);
			return condition;
		} else {
			return "";
		}
	}
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		String sqlfile = DBHelper.class.getResource("数据库脚本.sql").getPath();
		sqlfile = URLDecoder.decode(sqlfile, System.getProperty("file.encoding"));
		DBHelper.init("jdbc:mysql://127.0.0.1/test");
		DBHelper.executeByFile(sqlfile);
	}
}
