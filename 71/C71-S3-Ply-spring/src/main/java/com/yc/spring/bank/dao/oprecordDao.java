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
	
	/**
	   *   不带手续的流水记录，取款用
	 * @param accountid
	 * @param money
	 */
	public void insert(int accountid, float money){
		String sql = "insert into oprecord values (null,?,?,0,now())";
		jdbcTemplate.update(sql, accountid, money);
	}
	
	/**
	   *   带手续的流水记录，转账用
	 * @param accountid
	 * @param money
	 * @param charge
	 */
	public void insert(int accountid, float money, float charge){
		String sql = "insert into oprecord values (null,?,?,?,now())";
		jdbcTemplate.update(sql, accountid, money, charge);
	}
	
	/**
	   * 清除记录，测试方法用
	 */
	public void deleteAll() {
		String sql = "delete from oprecord";
		jdbcTemplate.update(sql);
	}
	
	public int countAll() {
		String sql = "select count(*) from oprecord";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	public float sumCharge() {
		String sql = "select sum(charge) from oprecord";
		return jdbcTemplate.queryForObject(sql, float.class);
	}
}
