package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.Control;
import com.yc.easyweb.dao.ControlDao;

/**
 * 操作Control表的事务类
 * 
 * @author psq
 *
 */
public class ControlBiz {

	private ControlDao dao = new ControlDao();

	// 查询所有
	public List<Control> selectAll(Control control) throws   IOException, BizException {
		if(control == null){
			throw new BizException("请填写管理权限信息！！！");
		}
		return dao.selectAll(control);
	}
	// 查询单个
	public Control selectSingle(Control control) throws IOException, BizException {
		if(control == null){
			throw new BizException("请填写管理权限信息！！！");
		}
		if(control.getConid() == 0 && control.getConame() == null && control.getUid() == 0){
			throw new BizException("请指定查询的管理权限！！！");
		}
		return dao.selectSingle(control);
	}

	// 添加
	public int insert(Control control) throws SQLException, BizException {
		if(control == null){
			throw new BizException("请填写管理权限信息！！！");
		}
		if(control.getConame() == null ){
			throw new BizException("请填写管理主类权限信息！！！");
		}else if(control.getConame().isEmpty() ){
			throw new BizException("请填写管理主类权限信息！！！");
		}
		if(control.getConamesecond() == null  ){
			throw new BizException("请填写管理副类权限信息！！！");
		}else if(control.getConamesecond().isEmpty()){
			throw new BizException("请填写管理副类权限信息！！！");
		}
		return dao.insert(control);

	}

	// 删除
	public int delete(Control control) throws SQLException, BizException {
		if(control == null){
			throw new BizException("请填写管理权限信息！！！");
		}
		if(control.getConid() ==0  && control.getConame() == null && control.getConamesecond() == null){
			throw new BizException("请指定删除的管理权限！！！");
		}
		
		return dao.delete(control);

	}

	// 删除
	public int deleteAll(List<Control> list) throws SQLException, BizException {
		if(list.size() == 0){
			throw new BizException("请填写管理权限信息！！！");
		}
		for(Control control : list){
			if(control.getConid() ==0  && control.getConame() == null && control.getConamesecond() == null){
				throw new BizException("请指定删除的管理权限！！！");
			}
		}
		return dao.delete(list);

	}

	// 更新
	public int update(Control controlNew, Control controlOld) throws SQLException, BizException {
		if(controlNew == null){
			throw new BizException("请填写修改的管理权限信息！！！");
		}
		if(controlOld == null){
			throw new BizException("请填写需要的管理权限！！！");
		}
		if(controlOld.getConid() ==0  && controlOld.getConame() == null && controlOld.getConamesecond() == null){
			throw new BizException("请指定修改的管理权限！！！");
		}
		return dao.update(controlNew, controlOld);
	}
	// 其他
}
