package com.yc.favorite.biz;

import org.apache.ibatis.session.SqlSession;

import com.yc.favorite.bean.Favorite;
import com.yc.favorite.bean.Tag;
import com.yc.favorite.dao.FavoriteMapper;
import com.yc.favorite.dao.TagMapper;
import com.yc.favorite.util.MyBatisHelper;

public class FavoriteBiz {

	public String addFavorite(Favorite f){
		
		SqlSession session = MyBatisHelper.getSession();
		try {
			TagMapper tm = session.getMapper(TagMapper.class);
			FavoriteMapper fm = session.getMapper(FavoriteMapper.class);
			
			if(f.getfTags()!=null) {
				String[] 	tags = f.getfTags().split("[,，；;]");
				for(String tag : tags){
					if( tm.update(tag) == 0){
						Tag t = new Tag();
						t.settCount(1);
						t.settName(tag);
						tm.insert(t);
					}
				}
			}
			
			
			fm.insert(f);
			session.commit();
			
			return 	"{code:1,msg:'添加成功!'}";
		}catch(Exception e){
			e.printStackTrace();
			
			session.rollback();
			return "{code:-1,msg:'系统繁忙，请稍后再试'}";
		}finally{
			session.close();
		}


	}

}