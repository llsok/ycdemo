package com.yc.ebuy.dao;

import com.yc.ebuy.bean.EasybuyUser;
import com.yc.ebuy.bean.EasybuyUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EasybuyUserMapper {
    long countByExample(EasybuyUserExample example);

    int deleteByExample(EasybuyUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EasybuyUser record);

    int insertSelective(EasybuyUser record);

    List<EasybuyUser> selectByExample(EasybuyUserExample example);

    EasybuyUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EasybuyUser record, @Param("example") EasybuyUserExample example);

    int updateByExample(@Param("record") EasybuyUser record, @Param("example") EasybuyUserExample example);

    int updateByPrimaryKeySelective(EasybuyUser record);

    int updateByPrimaryKey(EasybuyUser record);
}