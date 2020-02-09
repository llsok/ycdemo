package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.PayType;
import com.yc.easyweb.dao.PayTypeDao;

/**
 * 操作PayType表的事务类
 * 
 * @author psq
 *
 */
public class PayTypeBiz {

	private PayTypeDao dao = new PayTypeDao();

	// 查询所有
	public List<PayType> selectAll(PayType payType) throws IOException, BizException {
		if (payType == null) {
			throw new BizException("请输入支付类型信息！！！");
		}
		return dao.selectAll(payType);
	}

	// 添加
	public int insert(PayType payType) throws SQLException, BizException {
		if (payType == null) {
			throw new BizException("请输入支付类型信息！！！");
		}
		if (payType.getEopayname() == null ) {
			throw new BizException("请输入支付类型信息！！！");
		}else if(payType.getEopayname().isEmpty()){
			throw new BizException("请输入支付类型信息！！！");
		}
		return dao.insert(payType);
	}

	// 删除
	public int delete(PayType payType) throws SQLException, BizException {
		if (payType == null) {
			throw new BizException("请指定支付类型信息！！！");
		}
		if (payType.getEopayname() == null && payType.getEopaytypeid() == 0) {
			throw new BizException("请指定支付类型信息！！！");
		}
		return dao.delete(payType);

	}
	//更新
	public int update (PayType payTypeNew,PayType  payTypeOld) throws BizException {
		if (payTypeOld == null || payTypeNew == null) {
			throw new BizException("请输入支付类型信息！！！");
		}
		if (payTypeOld.getEopayname() == null && !payTypeOld.getEopayname().isEmpty()) {
			throw new BizException("请输入支付类型信息！！！");
		}
		return dao.update(payTypeNew, payTypeOld); 
	}
	 
}
