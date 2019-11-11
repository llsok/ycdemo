package com.sjy.favorite.biz;

import org.apache.ibatis.session.SqlSession;

import com.sjy.favorite.bean.Favorite;
import com.sjy.favorite.bean.Tag;
import com.sjy.favorite.dao.FavoriteMapper;
import com.sjy.favorite.dao.TagMapper;
import com.sjy.favorite.util.MyBatisHelper;

public class FavoriteBiz {

	public int addFavorite(Favorite f) {
		SqlSession session = MyBatisHelper.getSession();
		int result=0;
		try {
			TagMapper tm = session.getMapper(TagMapper.class);
			FavoriteMapper fm = session.getMapper(FavoriteMapper.class);

			String[] tags = f.getfTags().split("[,，;；]");
			for (String tag : tags) {
				if(tm.update(tag)==0) {
					Tag tag2=new Tag();
					tag2.settCount(1);
					tag2.settName(tag);
					tm.insert(tag2);
				}
			}
			fm.insert(f);
			session.commit();
			result=1;
		} catch (Exception e) {
			session.rollback();
			result=0;
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
}
