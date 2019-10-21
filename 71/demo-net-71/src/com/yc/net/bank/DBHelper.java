package com.yc.net.bank;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.management.RuntimeErrorException;


/**
 * 
 * MySQL 乱码问题  ，中文保存成为  ???? 
 * 解决方法： 百度关键字：  mysql url 字符集
 * 
 * 
 * 
 * @author OMEN
 *
 */


public class DBHelper {
	// 浣跨敤闈欐�佸潡锛屽姞杞介┍鍔�
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			//濡備綍澶勭悊寮傚父
			//缂栬瘧鏈熷紓甯告棤娉曞湪闈欐�佸潡涓姏鍑�
			throw new RuntimeException(e);//寮傚父杞瀷===銆嬪紓甯搁摼
		}
	}
	
	public static Connection opConnection() {
		// 2.鑾峰彇杩炴帴
		String url = "jdbc:mysql://localhost/bank?useOldAliasMetadataBehavior=true";
		String user = "root";
		String password = "a";
		
		try {
			return  DriverManager.getConnection(url, user, password);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		
		
		
		
	}
	
	
	
	//澧炲垹鏀�
	/**
	 * 
	 * @param sql
	 * @param Object...param 鍙彉鍙傛暟鏁扮粍
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	public static int executeUpdate(String sql,Object...param) {
		Connection conn=opConnection();
		
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			//璁剧疆鍙傛暟
			for(int i=0;i<param.length;i++) {
				ps.setObject(i+1, param[i]);
				
			}
			ps.executeUpdate();
			
		}catch(Exception e){
			throw new RuntimeException(e);
			
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {

				throw new RuntimeException(e);
			}
			
		}
		

		
		return 0;
		
		
		
	}
	
	//鏌ヨ
	
	/**
	 * 鍒嗛〉鏌ヨ:     绗嚑椤碉紝姣忛〉琛屾暟
	 * @param sql
	 * @param page  绗嚑椤�
	 * @param rows  姣忛〉琛屾暟
	 * @param param
	 * @return
	 */
	
	public static List<Map<String,Object>> queryPage(String sql,int page,int rows,Object...param){
		
		sql="select * from (select t.*,rownum rn from ("+sql+")t where rownum <= ?) where rn >?";
		
		
		int endRow = page* rows;	
		
		int startRow = (page-1)* rows;
		
		Object[] newParam =new Object[param.length+2];
		
		System.arraycopy(param, 0, newParam, 0, param.length);
		
		newParam[newParam.length-2] = endRow;
		
		newParam[newParam.length-1] = startRow;
		
		return executeQuery(sql,newParam);
		
		
		
	}
public static List<Map<String,Object>> queryPageMysql(String sql,int page,int rows,Object...param){
		
//		sql="select * from (select t.*,rownum rn from ("+sql+")t where rownum <= ?) where rn >?";
		sql="select * from ("+sql+") t limit ? , ? ";
		
		
		int startRow = (page-1)* rows;
		
		Object[] newParam =new Object[param.length+2];
		
		System.arraycopy(param, 0, newParam, 0, param.length);
		
		
		
		newParam[newParam.length-2] = startRow;
		newParam[newParam.length-1] = rows;
		
		return executeQuery(sql,newParam);
		
		
		
	}
	

	
	
	public static List<Map<String, Object>> executeQuery(String sql,Object...param){
		Connection conn=opConnection();
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			
			//璁剧疆鍙傛暟
			for(int i=0;i<param.length;i++) { 
				ps.setObject(i+1, param[i]);
				
			}
			
			//灏佽缁撴灉闆�
			
			ResultSet rs=ps.executeQuery();
			
			List<Map<String,Object>> ret=new ArrayList<Map<String,Object>>();
			
			//缁撴灉闆嗙殑鍘熸暟鎹璞★紝灏佽浜嗙粨鏋滈泦鐨勬墍鏈変俊鎭紝鍖呮嫭鍒楃殑鏁伴噺锛屽垪鐨勫悕瀛�
				
			ResultSetMetaData rsmd=rs.getMetaData();
			
			while(rs.next()) {
				
				//鎶婃瘡涓�琛岀殑鍊煎啓鍏ap
				//rs.getString(1)
				
				Map<String ,Object> row =new LinkedHashMap<String , Object>();
				
				
				//getColumnCount  鑾峰彇缁撴灉闆嗕腑鍒楃殑鏁伴噺
				
				for(int i=0;i<rsmd.getColumnCount();i++) {
					
					//getColumnName  鏍规嵁鍒楃紪鍙疯幏鍙栧垪鍚�
					
					String columnName = rsmd.getColumnName(i+1);
					Object value =rs.getObject(columnName);
					
					row.put(columnName, value);
					
					
					
				}
				
				ret.add(row);

				
				
				
				
			}
			return ret;
		
		}catch (Exception e) {
			throw new RuntimeException(e);
			
			
		}finally {
			
			
				
				try {
					conn.close();
				} catch (SQLException e) {
					
					throw new RuntimeException(e);
				}
			
			
		
		}
		
		
		
	}
	
	
	
	public static long executeCount(String sql,Object...param) {
		
		sql="select count(*) cnt from ("+sql+") a";
		List<Map<String, Object>> list=executeQuery(sql, param);
		//return list.size();

		
		return Long.parseLong( ""+list.get(0).get("cnt"));
	}
	
	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException, ParseException {
		//List<Object> param =new ArrayList<Object>();
		
		
		
		//System.out.println(DBHelper.executeUpdate("insert into dept values(?,?,?)",90,"璐㈠姟閮�","琛￠槼"));
		
		//鑾峰彇褰撳墠鏃堕棿锛屾敞鎰忥細璇ate鏄痡ava.sql.Date  璇ate琛ㄧず  骞存湀鏃�
		
		//Date date =new Date(System.currentTimeMillis());
		/*
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		
		java.util.Date d=format.parse("2019/06/21");
		
		Date date = new Date(d.getTime());
		*/
		
//		Date date =Date.valueOf("2008-5-12");
//		
//		DBHelper.executeUpdate("insert into emp (empno,ename,job,hiredate,sal) values (?,?,?,?,?)"
//				,7001,"寮犱笁","coder",date,10000);
		
		
		/*System.out.println("======================================================");
		
		System.out.println(DBHelper.executeQuery("select * from dept"));
		
		System.out.println("======================================================");
		
		System.out.println(DBHelper.executeQuery("select * from emp where sal> ?", 8000));*/
		
		System.out.println(DBHelper.queryPage("select * from emp",2, 5));
		
		System.out.println(DBHelper.queryPage("select * from emp",2, 5).size());
		
		
		
	}
	
	

}

