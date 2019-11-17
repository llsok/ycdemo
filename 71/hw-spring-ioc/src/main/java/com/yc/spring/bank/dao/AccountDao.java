package com.yc.spring.bank.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yc.spring.bank.bean.Account;

public interface AccountDao extends BaseDao<Account> {

	@Override
	@Insert("insert into bank_account (name,money) values(#{name}, #{money})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	void insert(Account t);

	@Override
	@Update("update bank_account set money = money + #{money} where id=#{id}")
	void update(Account t);

	@Override
	@Select("select * from bank_account where id=#{id}")
	Account selectById(Integer id);

}
