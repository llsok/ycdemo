package com.yc.easyweb.biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.yc.easyweb.bean.Usercontrol;
import com.yc.easyweb.dao.UsercontrolDao;

/**
 * 操作UsercontrolBiz表的事务类
 * 
 * @author psq
 *
 */
public class UsercontrolBiz {

	private UsercontrolDao dao = new UsercontrolDao();

	// 查询所有
	public List<Usercontrol> selectAll(Usercontrol usercontrol) throws IOException, BizException {
		if(usercontrol == null){
			throw new BizException("请填写用户权限信息！！！");
		}
		return dao.selectAll(usercontrol);
	}

	// 查询单个
	public Usercontrol selectSingle(Usercontrol usercontrol) throws IOException, BizException {
		if(usercontrol == null){
			throw new BizException("请填写用户权限信息！！！");
		}
		if(usercontrol.getConid() == 0 && usercontrol.getUid() == 0 && usercontrol.getUcon() ==0){
			throw new BizException("请填写用户权限信息！！！");
		}
		return dao.selectSingle(usercontrol);
	}

	// 添加
	public int insert(Usercontrol usercontrol) throws SQLException, BizException {
		if(usercontrol == null){
			throw new BizException("请填写用户权限信息！！！");
		}
		if(usercontrol.getUid() == 0){
			throw new BizException("请选择管理员！！！");
		}
		if(usercontrol.getUcon() == 0){
			throw new BizException("请选择权限！！！");
		}
		return dao.insert(usercontrol);

	}

	// 删除
	public int delete(Usercontrol usercontrol) throws SQLException, BizException {
		if(usercontrol == null){
			throw new BizException("请填写用户权限信息！！！");
		}
		if(usercontrol.getConid() == 0 && usercontrol.getUid() == 0 && usercontrol.getUcon() ==0){
			throw new BizException("请填写需要删除的用户权限信息！！！");
		}
		return dao.delete(usercontrol);

	}

	// 删除多条
	public int deleteAll(List<Usercontrol> list) throws SQLException, BizException {
		if(list.size() == 0){
			throw new BizException("请填写用户权限信息！！！");
		}
		for (Usercontrol usercontrol : list) {
			if(usercontrol.getConid() == 0 && usercontrol.getUid() == 0 && usercontrol.getUcon() ==0){
				throw new BizException("请填写需要删除的用户权限信息！！！");
			}
		}
		return dao.delete(list);

	}

	// 更新
	public int update(Usercontrol usercontrolNew, Usercontrol usercontrolOld) throws SQLException, BizException {
		if(usercontrolNew == null){
			throw new BizException("请填写修改的用户权限信息！！！");
		}
		if(usercontrolOld == null){
			throw new BizException("请填写需要修改的用户权限！！！");
		}
		if(usercontrolOld.getConid() == 0 && usercontrolOld.getUid() == 0 && usercontrolOld.getUcon() ==0){
			throw new BizException("请填写需要修改的用户权限信息！！！");
		}
		return dao.update(usercontrolNew, usercontrolOld);

	}
	// 其他
}
