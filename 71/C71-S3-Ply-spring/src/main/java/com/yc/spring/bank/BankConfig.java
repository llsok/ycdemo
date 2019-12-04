package com.yc.spring.bank;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan("com.yc.spring.bank")
/**
 * 划重点：使用注解开启事务，要在配置类上加入下面的注解
 */
@EnableTransactionManagement
public class BankConfig {
	
	@Bean("dataSource")
	public DriverManagerDataSource getDataSource() {
		DriverManagerDataSource ret = new DriverManagerDataSource();
		ret.setDriverClassName("com.mysql.jdbc.Driver");
		ret.setUrl("jdbc:mysql://127.0.0.1/bank");
		ret.setUsername("root");
		ret.setPassword("a");
		return ret;
	}
	
	@Resource
	private DataSource dataSource;
	
	@Bean("jdbcTemplate")
	public JdbcTemplate getJdbcTemplate() {
		JdbcTemplate ret = new JdbcTemplate();
		ret.setDataSource(dataSource);
		return ret;
	}
	
	@Bean("txManager")
	public DataSourceTransactionManager getDataSourceTransactionManager() {
		DataSourceTransactionManager ret = new DataSourceTransactionManager();
		ret.setDataSource(dataSource);
		return ret;
	}

}
