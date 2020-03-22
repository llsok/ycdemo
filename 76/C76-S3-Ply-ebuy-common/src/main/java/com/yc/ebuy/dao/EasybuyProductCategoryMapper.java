package com.yc.ebuy.dao;

import com.yc.ebuy.bean.EasybuyProductCategory;
import com.yc.ebuy.bean.EasybuyProductCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EasybuyProductCategoryMapper {
    long countByExample(EasybuyProductCategoryExample example);

    int deleteByExample(EasybuyProductCategoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EasybuyProductCategory record);

    int insertSelective(EasybuyProductCategory record);

    List<EasybuyProductCategory> selectByExample(EasybuyProductCategoryExample example);

    EasybuyProductCategory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EasybuyProductCategory record, @Param("example") EasybuyProductCategoryExample example);

    int updateByExample(@Param("record") EasybuyProductCategory record, @Param("example") EasybuyProductCategoryExample example);

    int updateByPrimaryKeySelective(EasybuyProductCategory record);

    int updateByPrimaryKey(EasybuyProductCategory record);
}