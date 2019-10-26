package com.yc.net.UI_bank;

import java.util.List;
import java.util.Map;

public class BankDao {
	public void update (String cardno,float money) {
		String sql="update account set balance=balance+? where accountid=?";
		DBHelper.executeUpdate(sql, money,cardno);
	}

	public List<Map<String, Object>> login(String user, String pwd) {
		String sql="select * from account  where accountid =? and `password`=?";
		return DBHelper.executeQuery(sql, user,pwd);
	}

	public int register(String user, String pwd) {
		String sql="INSERT INTO account VALUES(?,0,?)";
		return DBHelper.executeUpdate(sql, user,pwd);
	}
}
