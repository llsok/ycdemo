package com.yc.net.UI_bank;

import java.text.DecimalFormat;
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

	public String register(String user, String pwd) {
		String sql="select accountid from account where accountid=?";
		if(DBHelper.executeQuery(sql, user).size()>0) {
			return "该账号已存在，请更换账户名";
		}else {
			sql="INSERT INTO account VALUES(?,0,?)";
			DBHelper.executeUpdate(sql, user,pwd);
			return "开户成功";
		}
	}

	public String transfer(String outId, String inId, float money) {
		String sql="select balance from account where accountid = ?";
		String str= String.valueOf( DBHelper.executeQuery(sql, outId).get(0).get("balance"));
		Float balance= Float.parseFloat(str);
		if(balance< money) {
			return "您的账户中存款不足";
		}else {
			BankDao d=new BankDao();
			d.update(outId, -money);
			d.update(inId, money);
			DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
			//format 返回的是字符串,保留两位小数
			return "您已经向账户："+inId+"转入金额："+decimalFormat.format(money)+"元";
		}
	}
}
