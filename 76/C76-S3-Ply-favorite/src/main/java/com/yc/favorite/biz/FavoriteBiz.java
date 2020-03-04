package com.yc.favorite.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.favorite.bean.Favorite;
import com.yc.favorite.dao.FavoriteMapper;
import com.yc.favorite.dao.TagMapper;

@Service
@Transactional
public class FavoriteBiz {
	@Resource
	private TagMapper tm;
	@Resource
	private FavoriteMapper fm;
	
	/**
	 * 添加新的收藏地址
	 * @param favorite
	 */
	public void addFavorite(Favorite favorite) {
		/**
		 * 1、将 favorite 写入数据库
		 * 2、解析f_tags 字段
		 * 3、循环分类 tags
		 * 4、如果 tag 不存在，那么要新增该 tag
		 * 5、如果 tag 存在，则修改该 tag 的 count ， count ++
		 */
		fm.insert(favorite);
		String[] tNames = favorite.getfTags().split("[；;，,\\s]");
		for(String tName : tNames) {
			int ret = tm.updateCount(tName);
			if(ret == 0) {
				tm.insert(tName);
			}
		}
	}

}
