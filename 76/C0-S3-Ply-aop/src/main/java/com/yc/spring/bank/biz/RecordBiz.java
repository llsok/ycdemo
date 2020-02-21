package com.yc.spring.bank.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yc.spring.bank.bean.Record;
import com.yc.spring.bank.dao.RecordDao;

@Service
public class RecordBiz {

	private RecordDao rDao;

	public List<Record> queryByAccountId(int accountId) {
		Record record = new Record();
		record.setAccountId(accountId);
		return rDao.selectByObject(record);
	}

}
