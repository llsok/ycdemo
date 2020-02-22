package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.User;
import com.yc.easyweb.dao.UserDao;

/**
 * 操作User表的事务类
 * 
 * @author psq
 *
 */
public class UserBiz {

	private UserDao dao = new UserDao();

	// 查询所有
	public List<User> selectAll(User user) throws IOException, BizException {
		if (user == null) {
			throw new BizException("请输入用户信息");
		}
		return dao.selectAll(user);
	}

	// 添加
	public int insert(User user) throws SQLException, BizException {
		if (user == null) {
			throw new BizException("请输入用户信息");
		}
		if(user.getUemail() == null && user.getUphone() == null){
			throw new BizException("请输入您的邮箱或电话号码，方便以后验证");
		}else if(user.getUemail().isEmpty() && user.getUphone().isEmpty() ){
			throw new BizException("请输入您的邮箱或电话号码，方便以后验证");
		}
		if(user.getUname() == null ){
			throw new BizException("请输入您的用户名");
		}else if(user.getUname().isEmpty()){
			throw new BizException("请输入您的用户名");
		}
		if(user.getUpassword() == null ){
			throw new BizException("请输入您的密码");
		}else if( user.getUpassword().isEmpty() ){
			throw new BizException("请输入您的密码");
		}
		return dao.insert(user);
	}

	// 更新
	public int update(User userNew, User userOld) throws SQLException, BizException {
		if (userNew == null) {
			throw new BizException("请输入用户信息");
		}
		if (userOld == null) {
			throw new BizException("请输入需要修改的用户");
		}
		if(userOld.getUcollege() == null && userOld.getUid() == 0 && userOld.getUminname() ==null && 
				userOld.getUname() == null && userOld.getUphone() == null 
				&& userOld.getUemail() == null){
			throw new BizException("请输入需要修改的用户信息");
		}
		return dao.update(userNew, userOld);

	}
	// 更新多个

	public int update(List<User> list) throws SQLException, BizException {
		if (list.size() == 0) {
			throw new BizException("请输入用户信息");
		}
		for(User user : list){
			if( user.getUid() == 0 && user.getUminname() ==null && 
					user.getUname() == null && user.getUphone() == null 
					&& user.getUemail() == null && user.getUstate() == 0){
				throw new BizException("请输入需要修改的用户信息");
			}
		}
		return dao.update(list);
	}

	// 查询单个
	public User selectSingle(User user) throws IOException, BizException {
		if (user == null) {
			throw new BizException("请输入用户信息");
		}
		if(user.getUcollege() == null && user.getUid() == 0 && user.getUminname() ==null && 
				user.getUname() == null && user.getUphone() == null 
				&& user.getUemail() == null){
			throw new BizException("请输入需要查询的用户信息");
		}
		return dao.selectSingle(user);
	}
}
