package com.yc.net.bank;

public class BankDao {
	
	public void update(String cardno, float money){
		String sql = "update account set balance=balance + ? where accountid=?";
		DBHelper.executeUpdate(sql, money, cardno);
	}

}
