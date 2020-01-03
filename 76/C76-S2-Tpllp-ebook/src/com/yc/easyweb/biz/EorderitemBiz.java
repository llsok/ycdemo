package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.Bought;
import com.yc.easyweb.bean.Eorderitem;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.dao.EorderitemDao;

/**
 * 操作Eorderritem表的事务类
 * 
 * @author psq
 *
 */
public class EorderitemBiz {

	private EorderitemDao dao = new EorderitemDao();

	// 查询所有
	public List<Eorderitem> selectAll(Eorderitem eorderitem) throws IOException, BizException {
		if(eorderitem == null){
			throw new BizException("请填写购物车信息！！！");
		}
		return dao.selectAll(eorderitem);

	}
	//查询单个
	public Eorderitem selectSingle(Eorderitem eorderitem) throws IOException, BizException {
		if(eorderitem == null){
			throw new BizException("请填写购物车信息！！！");
		}
		if(eorderitem.getBid() == 0 && eorderitem.getEoid() == null && eorderitem.getItemid() == null && eorderitem.getUid() == 0){
			throw new BizException("请填写需要查询的购物车信息！！！");
		}
		return dao.selectSingle(eorderitem);
	}

	// 添加
	public int insert(Eorderitem eorderitem) throws SQLException, BizException {
		if(eorderitem == null){
			throw new BizException("请填写购物车信息！！！");
		}
		if(eorderitem.getBid() == 0){
			throw new BizException("请选择加入购物车的书籍！！！");
		}
		if(eorderitem.getCarttime() == null){
			throw new BizException("请填写加入购物车的时间！！！");
		}else if( eorderitem.getCarttime().isEmpty()){
			throw new BizException("请填写加入购物车的时间！！！");
		}
		if(eorderitem.getCount() == 0){
			throw new BizException("请填写书本数量！！！");
		}
		if(eorderitem.getItemid() == null){
			throw new BizException("请填写购物车号！！！");
		}else if( eorderitem.getItemid().isEmpty()){
			throw new BizException("请填写购物车号！！！");
		}
		
		if(eorderitem.getTotal() == 0){
			throw new BizException("请填写总价！！！");
		}
		if(eorderitem.getUid() == 0){
			throw new BizException("请填写用户id！！！");
		}
		return dao.insert(eorderitem);
	}

	// 删除
	public int delete(Eorderitem eorderitem) throws SQLException, BizException {
		if(eorderitem == null){
			throw new BizException("请填写购物车信息！！！");
		}
		if(eorderitem.getBid() == 0 && eorderitem.getEoid() == null && eorderitem.getItemid() == null && eorderitem.getUid() == 0){
			throw new BizException("请填写需要删除的购物车信息！！！");
		}
		return dao.delete(eorderitem);

	}

	// 删除
	public int delete(List<Eorderitem> list) throws SQLException, BizException {
		if(list.size() == 0){
			throw new BizException("请填写购物车信息！！！");
		}
		for(Eorderitem eorderitem : list){
			if(eorderitem.getBid() == 0 && eorderitem.getEoid() == null && eorderitem.getItemid() == null && eorderitem.getUid() == 0){
				throw new BizException("请填写需要查询的购物车信息！！！");
			}
		}
		return dao.delete(list);
	}

	// 更新
	public int update(Eorderitem eoNew, Eorderitem eoOld) throws SQLException, BizException {
		if(eoNew == null){
			throw new BizException("请填写购物车信息！！！");
		}
		if(eoOld == null){
			throw new BizException("请填写需要修改的购物车！！");
		}
		if(eoOld.getBid() == 0 && eoOld.getEoid() == null && eoOld.getItemid() == null && eoOld.getUid() == 0){
			throw new BizException("请填写需要修改的购物车信息！！！");
		}
		return dao.update(eoNew, eoOld);
	}
	//购物车分页
	public Page<Bought> ePage(int page, int rows,Bought bought) throws IOException, BizException {
		if(bought == null){
			throw new BizException("请输入购物车信息！！！");
		}
		return dao.eoPage(page, rows, bought);
	}
	//查询购物车详情
	public List<Bought> selectAllCart(Bought bought) throws IOException, BizException{
		if(bought == null){
			throw new BizException("请输入购物车信息！！！");
		}
		return dao.selectAll(bought);
	}
	//查询单个
	public Bought selectSingleCart(Bought bought) throws IOException, BizException{
		if(bought == null){
			throw new BizException("请输入购物车信息！！！");
		}
		if(bought.getBid() == 0  && bought.getItemid() == null && bought.getUid() == 0){
			throw new BizException("请填写需要查询的购物车信息！！！");
		}
		return dao.selectSingle(bought);
	}
	// 其他
}
