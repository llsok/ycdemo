package com.yc.damai.util;

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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {
	private static String url;
	private static String user;
	private static String[] password;

	/*static {
		InputStream in = DBHelper.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			*//**
			 * 璇诲彇閰嶇疆鏂囦欢
			 * Properties key : value
			 *//*
			Properties p = new Properties();
			p.load(in);
			init( p.getProperty("driver"),  
					p.getProperty("url"),  
					p.getProperty("user"), 
					p.getProperty("password"));
		} catch (Exception e) {
			throw new RuntimeException("鏁版嵁搴撻┍鍔ㄥ姞杞藉け璐ワ紒", e);
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}*/

	/**
	 * 鍒涘缓杩炴帴
	 * 
	 * @return
	 * @throws NamingException 
	 * @throws SQLException
	 */
	public static Connection getConnection() {
		// 创建JNDI 上下文对象
		try{
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/mysql/damai");
			return ds.getConnection();
		} catch (Exception e ){
			throw new RuntimeException(e);
		}
		
		/*for (int i = 0; i < password.length; i++) {
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
		throw new RuntimeException(String.format("鑾峰彇鏁版嵁搴撹繛鎺ュけ璐ワ紒杩炴帴URL锛�%s\t鐢ㄦ埛鍚嶏細%s\t瀵嗙爜锛�%s", 
				DBHelper.url, DBHelper.user, Arrays.toString(DBHelper.password)));*/
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
				throw new RuntimeException("鏁版嵁搴撻┍鍔ㄥ姞杞藉け璐ワ紒", e);
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
			throw new RuntimeException("鏁版嵁搴撹鍙ヨ鍙栧け璐�!", e);
		} catch (SQLException e) {
			throw new RuntimeException("鏁版嵁搴撴搷浣滃け璐�!", e);
		} finally {
			//Utils.close(reader, br, conn);
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
			throw new RuntimeException("鏁版嵁搴撹剼鏈枃浠朵笉瀛樺湪!", e);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("鏁版嵁搴撹剼鏈枃浠剁紪鐮佹牸寮忛敊璇�!", e);
		}
	}

	/**
	 * 鎵ц澧炲垹鏀筍QL
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static int update(String sql, Object... param) {
		Connection conn = null;
		try {
			// 鑾峰彇杩炴帴
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("鍙傛暟"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			// 寮傚父杞瀷
			throw new RuntimeException("SQL鎵ц閿欒锟�?", e);
		} finally {
			// 鎵撳嵃鍏抽棴寮傚父
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 鍙煡璇竴鏉¤褰曠殑鏌ヨ 0~1 琛岋紝 濡傛灉鏌ュ嚭澶氭潯璁板綍锛屽垯鎶涘嚭杩愯鏈熷紓甯革紝鎻愮ず鐢ㄦ埛缁撴灉鏁板ぇ锟�?1
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static Map<String, Object> selectOne(String sql, Object... param) {
		
		Connection conn = null;
		try {
			// 鑾峰彇杩炴帴
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("鍙傛暟"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			ResultSet rs = ps.executeQuery();
			/**
			 * 鑾峰彇缁撴灉闆嗗厓鏁版嵁瀵硅薄 meta
			 */
			ResultSetMetaData rsmd = rs.getMetaData();
			if (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<String, Object>();
				for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
					// 鑾峰彇鍒楀悕
					String ColumnName = rsmd.getColumnName(i);
					// 鑾峰彇鍒楀悕
					row.put(ColumnName, rs.getObject(ColumnName));
				}
				if(rs.next()){
					throw new RuntimeException("缁撴灉鏁板ぇ锟�?1!");
				} else {
					return row;
				}
			} else {
				return null;
			}
		} catch (SQLException e) {
			// 寮傚父杞瀷
			throw new RuntimeException("SQL鎵ц閿欒锟�?", e);
		} finally {
			// 鎵撳嵃鍏抽棴寮傚父
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}

	/**
	 * 鏌ヨ澶氭潯璁板綍 0~N 锟�?
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static List<Map<String, Object>> selectList(String sql, Object... param) {

		Connection conn = null;
		try {
			// 鑾峰彇杩炴帴
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("鍙傛暟"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			ResultSet rs = ps.executeQuery();
			List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
			/**
			 * 鑾峰彇缁撴灉闆嗗厓鏁版嵁瀵硅薄 meta
			 */
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<String, Object>();
				for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
					// 鑾峰彇鍒楀悕
					String ColumnName = rsmd.getColumnName(i);
					// 鑾峰彇鍒楀悕
					row.put(ColumnName, rs.getObject(ColumnName));
				}
				ret.add(row);
			}
			return ret;
		} catch (SQLException e) {
			// 寮傚父杞瀷
			throw new RuntimeException("SQL鎵ц閿欒锟�?", e);
		} finally {
			// 鎵撳嵃鍏抽棴寮傚父
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	 /**
     * 鏌ヨ鎸囧畾sql璇彞 , 杩斿洖鍗曚釜锟�?, 榛樿杩斿洖绗竴琛岃褰曠殑绗竴涓瓧娈碉拷??
     * 濡傛灉鏈煡璇㈠埌缁撴灉杩斿洖null 
     * 搴旂敤鍦烘櫙: select count(*) from * emp;
     * 
     * @param sql
     * @param params 鍙傛暟鍒楄〃
     * @return
     */
    public static Object selectValue(String sql, Object... param) {
    	Connection conn = null;
		try {
			// 鑾峰彇杩炴帴
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(sql);
			for (int i = 1; i <= param.length; i++) {
				System.out.println("鍙傛暟"+i+" : " + param[i-1]);
				ps.setObject(i, param[i - 1]);
			}
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				//杩斿洖绗竴琛岃褰曠殑绗竴涓瓧娈碉拷??, OK 浜嗗氨杩欎箞锟�?鍗曠矖鏆达紒锛侊紒
				return rs.getObject(1);
			} else {
				return null;
			}
		} catch (SQLException e) {
			// 寮傚父杞瀷
			throw new RuntimeException("SQL鎵ц閿欒锟�?", e);
		} finally {
			// 鎵撳嵃鍏抽棴寮傚父
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
    }
	
	/**
     * ============浠ヤ笅鏄珮绾ч儴锟�? ( 閫夊仛 ) ============
     * 鍒嗛〉鏌ヨ鎸囧畾sql璇彞, 杩斿洖鐨勬暟鎹皝瑁呭湪Page瀵硅薄锟�?
     * 鏂规硶璋冪敤绀轰緥 : 
     * selectPage("select * from emp where empno  > ?" , 2 , 5, 1000)
     * @param sql
     * @param page        鏌ヨ鐨勯〉锟�?
     * @param rows        姣忛〉鐨勮锟�?
     * @param params    鍙傛暟鍒楄〃
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
     * 鍒嗛〉鏌ヨ缁撴灉灏佽绫伙紙鍏辨湁鐨勯潤鎬佺殑鍐呴儴绫伙級
     */
    public static class Page {
        // 褰撳墠椤垫暟锟�?
        private List<Map<String,Object>> data;
        // 鎬昏锟�?
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
	 * 鍒ゆ柇鍙傛暟 param 鏄惁涓虹┖ , 涓嶄负绌哄垯杩斿洖鏉′欢 condition, 骞朵笖锟�? param 鍔犲埌 params 锟�?
	 * 濡傛灉涓虹┖, 鍒欐斁鍥炵┖瀛楃锟�? ( "" ), 鐢ㄤ簬鎷兼帴sql
	 * 璇ユ柟娉曞彲鑳戒細琚锟�? dao 绫讳腑浣跨敤 , 鍥犳锟�?鍚庤鏀惧埌 DBHelper 涓幓,鎴愪负锟�?涓伐鍏锋柟锟�?
	 * @param param      鍙傛暟锟�?
	 * @param params     鍙傛暟闆嗗悎
	 * @param condition  鏉′欢sql
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
		String sqlfile = DBHelper.class.getResource("鏁版嵁搴撹剼鏈�.sql").getPath();
		sqlfile = URLDecoder.decode(sqlfile, System.getProperty("file.encoding"));
		DBHelper.init("jdbc:mysql://127.0.0.1/test");
		DBHelper.executeByFile(sqlfile);
	}
}
