package com.yc.ebuy.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.ebuy.bean.EasybuyUser;
import com.yc.ebuy.bean.EasybuyUserExample;
import com.yc.ebuy.dao.EasybuyUserMapper;

@Service
public class UserBiz {

	@Resource
	EasybuyUserMapper eum;
	
	public EasybuyUser login(EasybuyUser user) throws BizException {
		EasybuyUserExample eue = new EasybuyUserExample();
		eue.createCriteria().andLoginnameEqualTo(user.getLoginname())
			.andPasswordEqualTo(user.getPassword());
		List<EasybuyUser> list = eum.selectByExample(eue);
		if(list.size()!=1) {
			throw new BizException("用户名或密码错误!");
		}
		return list.get(0);
	}

}
