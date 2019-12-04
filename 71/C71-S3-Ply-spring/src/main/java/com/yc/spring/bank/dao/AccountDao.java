package com.yc.spring.bank.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
	/**
	 * 账户检查，账户当前余额 = 期初余额 + 转入 + 转出（负数）- 手续费
	 * 
	 */
	public List<Map<String,Object>> selectCheckAccount(){
		String sql = "SELECT" +
				"	*" +
				" FROM" +
				"	account a" +
				" JOIN (" +
				"	SELECT" +
				"		accountid," +
				"		sum(opmoney - charge) money" +
				"	FROM" +
				"		oprecord" +
				"	GROUP BY" +
				"		accountid" +
				") b ON a.accountid = b.accountid";
		return jdbcTemplate.queryForList(sql);
	}

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

	/**
	   * 更新账号表的余额，如果传入的 money 是负数，则表示取款，要判断余额是否大于取款金额
	 * @param accountid		存取款账号
	 * @param money			存取款金额
	 * @return				返回结果表示更新到的记录行数，1更新成功，0未更新
	 */
	public int update(int accountid, float money) {
		// 小于0就是取款
		if(money>0) {
			String sql = "update account set balance = balance + ? where accountid = ?";
			return jdbcTemplate.update(sql, money, accountid);
		} else if (money <0) {
			String sql = "update account set balance = balance + ?"
					+ " where accountid = ? and balance >= -?";
			return jdbcTemplate.update(sql, money, accountid, money);
		} else {
			return 0;
		}
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
	
	public int countAll() {
		String sql = "select count(*) from account";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

}
