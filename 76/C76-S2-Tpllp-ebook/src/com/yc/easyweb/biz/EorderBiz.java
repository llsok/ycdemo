package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.Eorder;
import com.yc.easyweb.bean.OrderDetial;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.dao.EorderDao;

/**
 * 操作Eorder表的事务类
 * 
 * @author psq
 *
 */
public class EorderBiz {

	private EorderDao dao = new EorderDao();

	// 查询所有
	public List<Eorder> selectAll(Eorder eorder) throws IOException, BizException  {
		if(eorder == null){
			throw new BizException("请输入订单信息");
		}
		return dao.selectAll(eorder);
	}

	// 查询单个
	public Eorder selectSingle(Eorder eorder) throws IOException, BizException  {
		if(eorder == null){
			throw new BizException("请输入订单信息");
		}
		if(eorder.getEoid() ==null && eorder.getUid() ==0 && eorder.getEostate() == 0 && eorder.getUname() == null){
			throw new BizException("请输入需要查询的订单信息");
		}
		return dao.selectSingle(eorder);
	}

	// 查询订单详情
	public List<OrderDetial> selectAllDetail(OrderDetial detial) throws IOException, BizException  {
		if(detial == null){
			throw new BizException("请输入订单信息");
		}
		return dao.selectAllDetail(detial);
	}
	// 查询单个订单详情
		public OrderDetial selectSingleDetail(OrderDetial detial) throws IOException, BizException   {
			if(detial == null){
				throw new BizException("请输入订单信息");
			}
			if(detial.getBid() == 0 && detial.getEoid() == null && detial.getUid() ==0 && detial.getUname() == null && detial.getEotemp() == null ){
				throw new BizException("请输入需要查询的订单信息");
			}
			return dao.selectSingleDetail(detial);
		}
	// 添加
	public int insert(Eorder eorder) throws SQLException, BizException  {
		if(eorder == null){
			throw new BizException("请输入订单信息！！!");
		}
		if(eorder.getEoaddr() == null ){
			throw new BizException("请输入收获地址！！！");
		}else if(eorder.getEoaddr().isEmpty()){
			throw new BizException("请输入收获地址！！！");
		}
		
		
		if(eorder.getEotime() == null ){
			throw new BizException("请输入下单时间！！！");
		}else if(eorder.getEotime().isEmpty() ){
			throw new BizException("请输入下单时间！！！");
		}
		
		if(eorder.getUname() ==null ){
			throw new BizException("请输入收货人！！！");
		}else if(eorder.getUname().isEmpty()){
			throw new BizException("请输入收货人！！！");
		}
		
		if(eorder.getEotype() == null ){
			throw new BizException("请选择支付类型！！！");
		}else if(eorder.getEotype().isEmpty()){
			throw new BizException("请选择支付类型！！！");
		}
		
		if(eorder.getEopaytypeid() == 0){
			throw new BizException("请输入支付方式！！！");
		}
		
		if(eorder.getEoid() == null ){
			throw new BizException("请输入订单号！！！");
		}else if(eorder.getEoid().isEmpty()){
			throw new BizException("请输入订单号！！！");
		}
		
		if(eorder.getUid() == 0){
			throw new BizException("请输入订单所有者！！！");
		}
		
		if(eorder.getEostate() == 0){
			throw new BizException("请输入订单状态！！！");
		}
		return dao.insert(eorder);

	}

	// 删除
	public int delete(Eorder eorder) throws SQLException, BizException  {
		if(eorder == null){
			throw new BizException("请输入订单信息！！！");
		}
		if(eorder.getEoid() == null && eorder.getUid() == 0 && eorder.getUname() == null){
			throw new BizException("请选择需要删除的订单信息！！！");
		}
	
		return dao.delete(eorder);

	}

	// 删除多个
	public int delete(List<Eorder> list) throws SQLException, BizException  {
		if(list.size() == 0){
			throw new BizException("请输入订单信息！！！");
		}
		for(Eorder eorder : list){
			if(eorder.getEoid() == null && eorder.getUid() == 0 && eorder.getUname() == null){
				throw new BizException("请选择需要删除的订单信息！！！");
			}
		}
		return dao.delete(list);

	}

	// 更新
	public int update(Eorder eorderNew, Eorder eorderOld) throws SQLException, BizException  {
		if(eorderNew == null){
			throw new BizException("请输入修改的订单信息！！！");
		}
		if(eorderOld == null){
			throw new BizException("请输入需要修改的订单！！！");
		}
		if(eorderOld.getEoid() == null && eorderOld.getUid() == 0 && eorderOld.getUname() == null){
			throw new BizException("请选择需要需改的订单信息！！！");
		}
		return dao.update(eorderNew, eorderOld);
	}
	//分页
	public Page<Eorder> eorderPage(int page, int rows,Eorder eorder) throws IOException, BizException {
		if(eorder == null){
			throw new BizException("请输入订单信息！！！");
		}
		return dao.eorderPage(page, rows, eorder);
	}
	public Page<OrderDetial> eorderPage(int page, int rows,OrderDetial eorder) throws IOException, BizException {
		if(eorder == null){
			throw new BizException("请输入订单信息！！！");
		}
		return dao.orderPage(page, rows, eorder);
	}
	// 其他
}
