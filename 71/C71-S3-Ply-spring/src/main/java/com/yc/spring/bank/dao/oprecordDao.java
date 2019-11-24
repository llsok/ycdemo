package com.yc.spring.bank.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * 银行流水表
 */
@Repository
public class oprecordDao {
	
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	public void insert(int accountid, float money){
		String sql = "insert into oprecord values (null,?,?,now())";
		jdbcTemplate.update(sql, accountid, money);
	}
	

}
