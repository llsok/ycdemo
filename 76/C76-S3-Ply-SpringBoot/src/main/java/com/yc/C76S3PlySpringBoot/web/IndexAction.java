package com.yc.C76S3PlySpringBoot.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.C76S3PlySpringBoot.bean.Favorite;
import com.yc.C76S3PlySpringBoot.bean.Tag;
import com.yc.C76S3PlySpringBoot.biz.FavoriteBiz;
import com.yc.C76S3PlySpringBoot.dao.FavoriteMapper;
import com.yc.C76S3PlySpringBoot.dao.TagMapper;

@Controller
public class IndexAction {

	@Resource
	private TagMapper tm;
	@Autowired
	private FavoriteMapper fm;
	@Resource
	FavoriteBiz fBiz;

	@GetMapping(path = { "/", "index.s" })
	public String index(String tId, String flag, Model m) {
		List<Tag> list = tm.selectAll();
		/**
		 * 查找要展示的标签
		 */
		if (tId != null) {
			for (Tag t : list) {
				// 判断 tId 参数值是否 == 当前的标签 tId
				if (tId.equals("" + t.gettId())) {
					m.addAttribute("showTag", t);
					break;
				}
			}
		} else if (flag != null) {
			List<Favorite> fList = fm.selectByFlag(flag);
			m.addAttribute("fList", fList);
		}
		m.addAttribute("tList", list);
		return "index";
	}
	
	@RequestMapping("saveFavorite.s")
	public String addFavorite(Favorite f, Model m) {
		try {
			fBiz.addFavorite(f);
			// 响应重定向
			return "redirect:index.s";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "添加失败，请联系客服");
			return "edit";
		}
	}
	
	@RequestMapping("toedit")
	public String toEdit() {
		return "edit";
	}

}
