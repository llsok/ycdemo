package com.yc.damai.common;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;

import com.yc.damai.bean.Lottery;
import com.yc.damai.util.Page;

public class DbHelper {
	private static Connection conn = null;
	private static PreparedStatement pstmt =null;
	private static ResultSet rs =null;
	/*static {
		try {
			Class.forName(MyProperties.getInstace().getProperty("driver"));
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}*/
	/**
	 * @return
	 * @throws Naming
	public Connection getConn() throws Exception 
	 * @throws SQLException 
	 */
	
	public static Connection getConn() throws Exception{
	
		/*conn = DriverManager.getConnection(MyProperties.getInstace().getProperty("url"),MyProperties.getInstace().getProperty("username"),MyProperties.getInstace().getProperty("password"));
		return conn;*/
		//创建JNDI上下文对象
		Context context = new InitialContext();
		DataSource dSource = (DataSource) context.lookup("java:comp/env/mysql/doubleball");
		conn = dSource.getConnection();
		return conn;
	}
	
	public static  void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs) {
		if(null != rs){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(null != pstmt){
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(null != conn){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/**
	 * 更新多行数据
	 * @throws SQLException 
	 * @throws Exception 
	 */
	public int update(List<String> sqls,List<List<Object>> params)
			throws Exception {
		int result  =0;
		
		try {
			conn = getConn();
			conn.setAutoCommit(false);
			for (int i = 0; i <sqls.size(); i++) {
				pstmt = conn.prepareStatement(sqls.get(i));
				List<Object> param = params.get(i);
				setParamsList(pstmt, param);
				result = pstmt.executeUpdate();
				if(result <= 0){
					conn.rollback();
					return result;
				}
			}
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
		}finally{
			conn.setAutoCommit(true);
			closeAll(conn, pstmt, null);
		}
		
		return result;
		
	}
	/**
	 *设置参数
	 * @param pstmt
	 * @param params
	 * @throws SQLException
	 */
	private static void setParamsList(PreparedStatement pstmt, List<Object> params) 
			throws SQLException {
		if (null == params || params.isEmpty()) {
			return;
		}
		for (int i = 0; i < params.size(); i++) {
			pstmt.setObject(i+1, params.get(i));
		}
	}
	/**
	 * 更新单行数据
	 * @throws Exception 
	 */
	public static int update(String sql,Object...params) throws Exception{
		int result = 0;
		conn = getConn();
		pstmt = conn.prepareStatement(sql);
		setParamsObject(pstmt,params);
		result = pstmt.executeUpdate();
		closeAll(conn, pstmt, null);
		return result;
		
	}
	private static void setParamsObject(PreparedStatement pstmt2, Object[] params)
			throws SQLException {
		if(null == params || params.length <= 0){
			return;
		}
		for (int i = 0; i < params.length; i++) {
			pstmt2.setObject(i+1, params[i]);
		}
	}
	/**
	 * 查询所有
	 * @param <T> 将要转换的实体类，以泛型的形式传入
	 * @param sql 数据库语句
	 * @param params 数据库语句中的参数
	 * @return
	 * @throws Exception 
	 * @throws SQLException
	 */
	public static <T> List<T> selectAll(String sql,List<Object> params,Class<T> cls)
				throws  Exception{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = null;
	
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			setParamsList(pstmt,params);
			rs = pstmt.executeQuery();
			//获取所有列名
			List<String> columnName = getColumnNames(rs);
			String typeName =null;		
			while (rs.next()) {
				map = new HashMap<String, Object>();
				//循环列
				for (String string : columnName) {
					Object obj = rs.getObject(string);
					if(null != obj){
						typeName = obj.getClass().getName();
					}
					if ("mysql.sql.BLOB".equals(typeName)) {
						Blob blob = (Blob)rs.getBlob(string);
						InputStream in = blob.getBinaryStream();
						//图片字节数组存储map中
						byte [] bt = new byte[(int)blob.length()];
						in.read(bt);
						map.put(string, bt);
					}else{
						map.put(string, rs.getObject(string));
					}
				}
				//将map添加到 list集合中
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, rs);
		}
		//将map集合转为泛型
		List<T> realList = DbHelper.populate(list, cls);
		return realList;
	}
	
	/**
	 * 获取结果集中所有的列名
	 * @param rs2
	 * @return
	 * @throws SQLException 
	 */
	private static List<String> getColumnNames(ResultSet rs) throws SQLException {
		List<String> list = new ArrayList<String>();
		//获取结果集列的名称，结果集数据视图
		ResultSetMetaData data = rs.getMetaData();
		int count = data.getColumnCount();
		//System.out.println(count);
		for (int i = 1; i <= count; i++) {
			//System.out.println(data.getColumnName(i));
			list.add(data.getColumnName(i));
		}
		return list;
	}
	/**
	 * 查询操作， 之返回一条记录
	 * @return
	 * @throws Exception 
	 */
	public static Map<String, Object> selectSingle(String sql,List<Object> params)
			throws Exception{
		Map<String, Object> map = null;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			//设置参数List
			setParamsList(pstmt, params);
		//	System.out.println(sql);
			rs = pstmt.executeQuery();
			//获取所有的列
			List<String> columNames = getColumnNames(rs);
			String typeName = null;
			//System.out.println(rs.next());
			if(rs.next()) {
				map = new HashMap<String, Object>();
				//循环列
				for (String cname : columNames) {
					Object obj =rs.getObject(cname);
					if (obj != null) {
						typeName = obj.getClass().getName();
					}
					//System.err.println(obj+"---"+typeName);
					if ("oracle.sql.BLOB".equals(typeName)) {
						Blob blob = (Blob)rs.getBlob(typeName);
						InputStream in = blob.getBinaryStream();
						//图片字节数组存储map中
						byte [] bt = new byte[(int)blob.length()];
						in.read(bt);
						map.put(cname, bt);
					}else{
						map.put(cname, rs.getObject(cname));
					}
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, rs);
		}
		return map;
		
	}
	/**
	 * 对从mysql数据库中查询到的数据分页
	 * @param page 从那一页开始
	 * @param rows 每一页多少行数据
	 * @param id	对查询的数据的限制条件(id : 期数)
	 * @return
	 * @throws Exception
	 */
	 public static Page selectPageForMysql(int page, int rows,int id) throws Exception {
	    	StringBuffer sb = new StringBuffer();
	    	sb.append("select * from lottery");
	    	if(id != 0){
	    		sb.append(" where num="+id);
	    	}
	    	String sql = "select count(*) from("+sb.toString()+")b";
	    	Map<String, Object> totalObj = DbHelper.selectSingle(sql, null);
	    	long  total = 0;
	    	if(totalObj != null){
	    		total = Long.parseLong(totalObj.get("count(*)").toString());
	    	}
	    	int startRow = (page - 1 ) * rows;
	    	String pageSql =  "select * from ("+sb.toString()+")a limit " + startRow + ", " + rows;
	    	List<Lottery> data = DbHelper.selectAll(pageSql, null, Lottery.class);
	        return new Page(data,total,page,rows);
	    }
	 
	 /**
	  * 将List集合中的Map集合进行转换为实体类，
	  * @param list
	  * @param cls
	  * @return
	  */
	 public static <T> List<T> populate(List<Map<String,Object>> list,Class<T> cls) {
			List<T> reList = new ArrayList<T>();
			for (Map<String, Object> t : list) {
				T p;
				try {
					p = cls.newInstance();//等效于new T()
					BeanUtils.populate(p, t);
					reList.add(p);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
			return reList;
		}
}
