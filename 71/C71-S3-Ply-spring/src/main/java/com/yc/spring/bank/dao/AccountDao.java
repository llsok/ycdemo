package com.yc.spring.bank.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.yc.spring.bank.bean.Account;

/**
 * 
 * @Component  通用的组件注解
 * Spring 语义组件注解 
 * @Service 服务组件注解 用于标注 业务类 xxxBiz xxxService... 
 * @Repository 注解访问组件注解 用于标注 Dao类 xxxDao 
 * @Controller 控制器注解 用于标注 web 控制（类似servlet） xxxAction xxxController
 * 
   *     银行账户表
 *
 */
@Repository
public class AccountDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	public void insert(int accountid, float balance) {
		String sql = "insert into account values (?,?)";
		jdbcTemplate.update(sql, accountid, balance);
	}

	public List<Account> selectAll() {
		String sql = "select * from account";
		return jdbcTemplate.query(sql, new RowMapper<Account>() {

			@Override
			public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
				// RowMapper 不需要执行 rs.next()
				Account account = new Account();
				account.setAccountid(rs.getInt("accountid"));
				account.setBalance(rs.getFloat("balance"));
				return account;
			}

		});

	}

	public void update(int accountid, float money) {
		String sql = "update account set balance = balance + ? where accountid = ?";
		jdbcTemplate.update(sql, money, accountid);
	}

	public Account selectById(int accountid) {
		String sql = "select * from account where accountid=?";
		Object[] args = { accountid };
		return jdbcTemplate.query(sql, args, new ResultSetExtractor<Account>() {

			@Override
			public Account extractData(ResultSet rs) throws SQLException, DataAccessException {
				// ResultSetExtractor 必须执行next方法
				rs.next();
				Account account = new Account();
				account.setAccountid(rs.getInt("accountid"));
				account.setBalance(rs.getFloat("balance"));
				return account;
			}
		});
	}

	public void deleteAll() {
		String sql = "delete from account";
		jdbcTemplate.update(sql);
	}

	public void delete(int account) {
		String sql = "delete from account where accountid = ?";
		jdbcTemplate.update(sql, account);
	}

}
