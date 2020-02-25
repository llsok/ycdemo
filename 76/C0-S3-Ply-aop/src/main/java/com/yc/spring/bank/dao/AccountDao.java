package com.yc.spring.bank.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yc.spring.bank.bean.Account;
import com.yc.spring.common.dao.BaseDao;

@Repository
public class AccountDao extends BaseDao<Account> {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(Account e) {
		super.insert(e);
	}

	@Override
	public void update(Account e) {
		jdbcTemplate.update(
				"update account set balance = balance + ? where accountid = ?", 
				e.getMoney() , e.getId());
	}

	@Override
	public void delete(Account e) {
		super.delete(e);
	}

	@Override
	public Account selectById(Object id) {
		return super.selectById(id);
	}

	@Override
	public List<Account> selectByObject(Account e) {
		return super.selectByObject(e);
	}

	
	
}
