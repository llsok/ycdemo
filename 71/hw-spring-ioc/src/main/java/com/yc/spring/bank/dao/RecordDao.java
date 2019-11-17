package com.yc.spring.bank.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yc.spring.bank.bean.Record;

public interface RecordDao extends BaseDao<Record>{
	@Override
	@Update("insert into bank_record values(null, #{accountId}, #{money})")
	void insert(Record t);

	@Select("select * from bank_record where accountid=#{accountId}")
	List<Record> selectByAccountId(Integer id);
}
