package com.yc.ebuy.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.yc.ebuy.bean.EasybuyUser;
import com.yc.ebuy.biz.BizException;
import com.yc.ebuy.biz.UserBiz;

@RestController
@SessionAttributes("loginedUser")
public class IndexAction {

	@Resource
	IEbuyBackAction eba;
	
	@Resource
	UserBiz ubiz;
	
	/*@ModelAttribute
	public void init() {
		
	}*/

	@GetMapping({ "/", "index", "index.html" })
	public ModelAndView index(ModelAndView mav) {
		// 通过远程服务调用方式获取分类信息
		mav.addObject("pclist", eba.getPc());
		mav.addObject("hplist", eba.getHotP());
		mav.addObject("nlist", eba.getNews());
		if(mav.getViewName()!=null) {
			mav.setViewName("index");
		}
		return mav;
	}
	
	@GetMapping("tologin")
	public ModelAndView tologin(ModelAndView mav) {
		mav.setViewName("Login");
		return mav;
	}
	
	@PostMapping("login")
	public ModelAndView login(EasybuyUser user, ModelAndView mav, 
			@SessionAttribute(name="uri",required=false) String uri,
			HttpSession session) {
		
		System.out.println("session id: " + session.getId());
		System.out.println("11111uri: " + uri);
		System.out.println("22222uri: " + session.getAttribute("uri"));
		try {
			EasybuyUser dbuser = ubiz.login(user);
			// 将用户对象添加到会话
			mav.addObject("loginedUser", dbuser);
			if(uri != null) {
				System.out.println("===========2==========");
				// 这是拦截登录的情况
				mav.setViewName("redirect:" + uri);
			} else {
				System.out.println("===========1==========");
				// 这是用户的主动登录
				mav.setViewName("index");
			}
			return index(mav);
		} catch (BizException e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.setViewName("Login");
		}
		return mav;
	}
	
	@GetMapping("product")
	public ModelAndView product(int id, ModelAndView mav) {
		// 要展示的商品
		mav.addObject("product", eba.product(id));
		// 商品分类
		mav.addObject("pclist", eba.getPc());
		mav.setViewName("product");
		return mav;
	}
	
	@GetMapping("addCart")
	public ModelAndView addCart(ModelAndView mav) {
		mav.setViewName("BuyCar");
		return mav;
	}

}
