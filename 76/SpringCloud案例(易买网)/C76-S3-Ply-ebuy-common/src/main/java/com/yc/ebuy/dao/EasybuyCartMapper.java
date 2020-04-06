package com.yc.ebuy.dao;

import com.yc.ebuy.bean.EasybuyCart;
import com.yc.ebuy.bean.EasybuyCartExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface EasybuyCartMapper {
	
	@Update("update Easybuy_Cart set count = count + 1 where uid=#{uid} and pid=#{pid}")
	int addCount(EasybuyCart record);
	
    long countByExample(EasybuyCartExample example);

    int deleteByExample(EasybuyCartExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EasybuyCart record);

    int insertSelective(EasybuyCart record);

    List<EasybuyCart> selectByExample(EasybuyCartExample example);

    EasybuyCart selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EasybuyCart record, @Param("example") EasybuyCartExample example);

    int updateByExample(@Param("record") EasybuyCart record, @Param("example") EasybuyCartExample example);

    int updateByPrimaryKeySelective(EasybuyCart record);

    int updateByPrimaryKey(EasybuyCart record);
}