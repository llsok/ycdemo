package com.yc.easyweb.biz;

import java.io.IOException;
import java.util.List;

import com.yc.easyweb.bean.Notice;
import com.yc.easyweb.bean.Page;
import com.yc.easyweb.dao.NoticeDao;

/**
 * 操作Notice表的事务类
 * 
 * @author psq
 *
 */
public class NoticeBiz {

	private NoticeDao dao = new NoticeDao();

	// 查询所有
	public List<Notice> selectAll(Notice notice) throws IOException, BizException  {
		if(notice == null){
			throw new BizException("请填写公告信息！！！");
		}
		return dao.selectAll(notice);
	}

	// 查询单个
	public Notice selectSingle(Notice notice) throws BizException, IOException  {
		if(notice == null){
			throw new BizException("请填写公告信息！！！");
		}
		if(notice.getNid() ==0 && notice.getNtitle() == null && notice.getNtime() == null){
			throw new BizException("请填写需要查询的公告信息！！！");
		}
		return dao.selectSingle(notice);
	}

	// 添加
	public int insert(Notice notice) throws BizException {
		if(notice == null){
			throw new BizException("请填写需要添加的公告信息！！！");
		}
		if(notice.getNtime() == null ){
			throw new BizException("请填写公告的发布时间！！！");
		}else if(notice.getNtime().isEmpty() ){
			throw new BizException("请填写公告的发布时间！！！");
		}
		
		if (notice.getNcontent() == null ) {
			throw new BizException("请填写公告的发布内容！！！");
		}else if(notice.getNcontent().isEmpty()){
			throw new BizException("请填写公告的发布内容！！！");
		}
		
		if (notice.getNauthor() == null ) {
			throw new BizException("请填写公告的发布者！！！");
		}else if(notice.getNauthor().isEmpty()){
			throw new BizException("请填写公告的发布标题！！！");
		}
		
		if (notice.getNtitle()== null ) {
			throw new BizException("请填写公告的发布标题！！！");
		}else if(notice.getNtitle().isEmpty()){
			throw new BizException("请填写公告的发布标题！！！");
		}
		return dao.insert(notice);
	}

	// 删除
	public int delete(Notice notice) throws BizException {
		if(notice == null){
			throw new BizException("请填写需要删除的公告信息！！！");
		}
		if (notice.getNtitle()== null && notice.getNauthor() == null && notice.getNtime() == null && notice.getNid() == 0) {
			throw new BizException("请填写需要删除的公告信息！！！");
		}
		return dao.delete(notice);
	}

	// 更新
	public int update(Notice noticeOld, Notice noticeNew) throws BizException {
		if(noticeNew ==null || noticeOld == null){
			throw new BizException("请填写需要更新的公告！！！");
		}
		if(noticeOld.getNid() == 0 && noticeOld.getNtitle() == null){
			throw new BizException("请填写需要更新的公告信息！！！");
		}
		return dao.update(noticeOld, noticeNew);

	}
	//公告分页
		public Page<Notice> noticePage(int page, int rows,Notice notice) throws IOException, BizException {
			if(notice == null){
				throw new BizException("请填写需要删除的公告信息！！！");
			}
			return dao.noticePage(page, rows, notice);
		}
	// 其他
}
