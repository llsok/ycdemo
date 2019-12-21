package com.yc.springboot.C71S3PlyBlog.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.yc.springboot.C71S3PlyBlog.bean.ArticleExample;
import com.yc.springboot.C71S3PlyBlog.bean.ArticleExample.Criteria;
import com.yc.springboot.C71S3PlyBlog.dao.ArticleMapper;

@Controller
@SessionAttributes("page")
public class IndexAction {
	
	//首页分页每页行数
	private final static int PAGE_SIZE = 5;

	@Resource
	private ArticleMapper am;

	@GetMapping(path = { "/", "index", "index.do" })
	public String index(String next, Model m,
			@SessionAttribute(name="page",required=false) Integer page) {
		// next 为空，表示是从地址栏发起的请求，否则是无限加载插件发起的请求
		if(next == null) {
			page = 1;
		}
		
		// 查所有记录（分页插件）
		// 设定分页查询条件
		PageHelper.startPage(page,PAGE_SIZE);
		// xxxxWithBLOBs 该方法用于查询 blob clob （longtext）字段
		m.addAttribute("alist", am.selectByExampleWithBLOBs(null));
		
		// 重新设置分页页码
		m.addAttribute("page",page+1);
		
		/**
		 * 条件查询 , 例子
		 */
		/*ArticleExample ae = new ArticleExample();
		// 构建条件
		Criteria c = ae.createCriteria();
		c.andReadcntGreaterThanOrEqualTo(50);  	// readcnt >= 50
		c.andCategoryidEqualTo(3);				// and categroy=3
		am.selectByExampleWithBLOBs(ae);*/
		
		return "index";
	}
	
	// 没有返回值，那么SpringMVC会将请求地址作为视图名
	@GetMapping("article")
	public void article(Integer id, Model m){
		m.addAttribute(am.selectByPrimaryKey(id));
	}
	
	/**
	 * 富文本编辑 CKEditor 的使用
	 */

}
