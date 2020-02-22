package com.yc.easyweb.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.easyweb.bean.User;
import com.yc.easyweb.common.DbHelper;

/**
 * 操作User表的dao类
 * 
 * @author psq
 *
 */
public class UserDao {
	DbHelper db = new DbHelper();

	// 查询所有
	@SuppressWarnings("static-access")
	public List<User> selectAll(User user) throws IOException  {
		StringBuffer sb = new StringBuffer();
		sb.append(" select uid,uname,uminname,uphone,university,ucollege,umajor,upassword, "
				+ " ustate,utemp,utype,uemail,utime,usex,uage,uclass " + " from user where 1=1 ");
		if (user != null) {
			if (user.getUminname() != null) {
				sb.append(" and uminname like '%" + user.getUminname() + "%'");
			}
			if (user.getUname() != null) {
				sb.append(" and uname like '%" + user.getUname() + "%'");
			}
			if (user.getUphone() != null) {
				sb.append(" and uphone like '%" + user.getUphone() + "%'");
			}
			if (user.getUniversity() != null) {
				sb.append(" and university like '%" + user.getUniversity() + "%'");
			}
			if (user.getUcollege() != null) {
				sb.append(" and ucollege like '%" + user.getUcollege() + "%'");
			}
			if (user.getUmajor() != null) {
				sb.append(" and umajor like '%" + user.getUmajor() + "%'");
			}
			if (user.getUemail()!= null) {
				sb.append(" and uemail like '%" + user.getUemail() + "%'");
			}
			if (user.getUstate() != 0) {
				sb.append(" and ustate = " + user.getUstate());
			}
			if (user.getUclass() != null) {
				sb.append(" and uclass = '" + user.getUclass() + "'");
			}
			if (user.getUtype() != 0) {
				sb.append(" and utype = " + user.getUtype());
			}
			if (user.getUage() != 0) {
				sb.append(" and uage = " + user.getUage());
			}
			if (user.getUsex() != 0) {
				sb.append(" and usex = " + user.getUsex());
			}
			
		}
		sb.append("  order by  uid desc");
		List<User> list = db.selectAll(sb.toString(), null, User.class);
		return list;

	}
	// 查询单个
		@SuppressWarnings("static-access")
		public User selectSingle(User user) throws IOException  {
			StringBuffer sb = new StringBuffer();
			sb.append(" select uid,uname,uminname,uphone,university,ucollege,umajor,upassword, "
					+ " ustate,utemp,utype,uemail,utime,usex,uage,uclass " + " from user where 1=1 ");
			if (user != null) {
				if (user.getUminname() != null) {
					sb.append(" and uminname = '" + user.getUminname() + "'");
				}
				if (user.getUname() != null) {
					sb.append(" and uname = '" + user.getUname() + "'");
				}
				if (user.getUphone() != null) {
					sb.append(" and uphone = '" + user.getUphone() + "'");
				}
				if (user.getUpassword() != null) {
					sb.append(" and upassword = '" + user.getUpassword() + "'");
				}
				//邮箱
				if (user.getUemail()!= null) {
					sb.append(" and uemail = '" + user.getUemail() + "'");
				}
				if (user.getUid() != 0) {
					sb.append(" and uid = " + user.getUid());
				}
			}
			sb.append("  order by  uid desc");
			return db.selectSingle(sb.toString(), null,User.class);
		}
	// 添加
	public int insert(User user) throws SQLException  {
		String sql = "insert into user(uid,uname,uminname,uphone,university,ucollege,umajor,uclass,upassword,"
				+ " utemp,utype,uemail,utime,usex,uage,ustate) " + " values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default);";
		return DbHelper.update(sql, user.getUname(), user.getUminname(), user.getUphone(), user.getUniversity(),
				user.getUcollege(), user.getUmajor(), user.getUclass(), user.getUpassword(), 
				user.getUtemp(), user.getUtype(), user.getUemail(), user.getUtime(), user.getUsex(), user.getUage());
	}

	// 删除
	public int delete(User user) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		if (user == null) {
			return 0;
		}
		sb.append("delete from user where 1=1 ");
		if (user.getUminname() != null) {
			sb.append(" and uminname ='" + user.getUminname() + "'");
		}
		if (user.getUphone() != null) {
			sb.append(" and uphone = '" + user.getUphone() + "'");
		}
		if (user.getUname() != null) {
			sb.append(" and uname ='" + user.getUname() + "'");
		}
		if (user.getUid() != 0) {
			sb.append(" and uid = " + user.getUid());
		}
		//邮箱
		if (user.getUemail()!= null) {
			sb.append(" and uemail = '" + user.getUemail() + "'");
		}
		return db.update(sb.toString(), null);

	}

	// 删除多条记录
	@SuppressWarnings("static-access")
	public int delete(List<User> list) throws SQLException  {
		StringBuffer sb = null;
		if (list.size() == 0) {
			return 0;
		}
		List<String> sqList = new ArrayList<String>();
		for (User user : list) {
			sb = new StringBuffer();
			sb.append("delete from user where 1=1 ");
			if (user.getUminname() != null) {
				sb.append(" and uminname ='" + user.getUminname() + "'");
			}
			if (user.getUphone() != null) {
				sb.append(" and uphone = '" + user.getUphone() + "'");
			}
			if (user.getUname() != null) {
				sb.append(" and uname ='" + user.getUname() + "'");
			}
			if (user.getUid() != 0) {
				sb.append(" and uid = " + user.getUid());
			}
			//邮箱
			if (user.getUemail()!= null) {
				sb.append(" and uemail = '" + user.getUemail() + "'");
			}
			sqList.add(sb.toString());
		}
		return db.update(sqList);
	}

	// 更新
	public int update(User userNew, User userOld) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		if (userNew == null || userOld == null) {
			return 0;
		}
		sb.append("update user set utemp='' ");
		//昵称
		if (userNew.getUminname() != null && !userNew.getUminname().isEmpty()) {
			sb.append(" , uminname ='" + userNew.getUminname() + "'");
		}
		//用户名
		if (userNew.getUname() != null && !userNew.getUname().isEmpty()) {
			sb.append(" , uname ='" + userNew.getUname() + "'");
		}
		//电话
		if (userNew.getUphone() != null && !userNew.getUphone().isEmpty()) {
			sb.append(" , uphone ='" + userNew.getUphone() + "'");
		}
		//大学
		if (userNew.getUniversity() != null && !userNew.getUniversity().isEmpty()) {
			sb.append(" , university ='" + userNew.getUniversity() + "'");
		}
		//学院
		if (userNew.getUcollege() != null && !userNew.getUcollege().isEmpty()) {
			sb.append(" , ucollege ='" + userNew.getUcollege() + "'");
		}
		//专业
		if (userNew.getUmajor() != null && !userNew.getUmajor().isEmpty()) {
			sb.append(" , umajor ='" + userNew.getUmajor() + "'");
		}
		//状态
		if (userNew.getUstate() != 0) {
			sb.append(" , ustate = " + userNew.getUstate());
		}
		//年级
		if (userNew.getUclass() != null && !userNew.getUclass().isEmpty()) {
			sb.append(" , uclass = '" + userNew.getUclass() + "'");
		}
		//类型
		if (userNew.getUtype() != 0) {
			sb.append(" , utype = " + userNew.getUtype());
		}
		//年龄
		if (userNew.getUage() != 0) {
			sb.append(" , uage = " + userNew.getUage());
		}
		//性别
		if (userNew.getUsex() != 0) {
			sb.append(" , usex = " + userNew.getUsex());
		}
		//邮箱
		if (userNew.getUemail() != null && !userNew.getUemail().isEmpty()) {
			sb.append(" , uemail = '" + userNew.getUemail() + "'");
		}
		//密码
		if (userNew.getUpassword() != null && !userNew.getUpassword().isEmpty()) {
			sb.append(" , upassword = '" + userNew.getUpassword() + "'");
		}
		//备用
		if (userNew.getUtemp() != null && !userNew.getUtemp().isEmpty()) {
			sb.append(" , utemp = '" + userNew.getUtemp() + "'");
		}
		//时间
		if (userNew.getUtime() != null && !userNew.getUtime().isEmpty()) {
			sb.append(" , utime = '" + userNew.getUtime() + "'");
		}
		
		sb.append(" where 1=1 ");
		
		if (userOld.getUname() != null) {
			sb.append(" and uname ='" + userOld.getUname() + "'");
		}
		if (userOld.getUid() != 0) {
			sb.append(" and uid = " + userOld.getUid());
		}
		return DbHelper.update(sb.toString(), null);
	}

	// 更新多条
	public int update(List<User> list) throws SQLException  {
		StringBuffer sb = new StringBuffer();
		List<String> sqList = new ArrayList<String>();
		if (list.size()== 0) {
			return 0;
		}
		for (User user  : list) {
			sb.append("update user set utemp='' ");
			if (user.getUstate() != 0) {
				sb.append(" , ustate = " + user.getUstate());
			}
			sb.append(" where 1=1 ");
			if (user.getUid() != 0) {
				sb.append(" and uid = " + user.getUid());
			}
			sqList.add(sb.toString());
		}
		return DbHelper.update(sqList);
	}
	// 其他
}
