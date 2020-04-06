package com.yc.ebuy.dao;

import com.yc.ebuy.bean.EasybuyProduct;
import com.yc.ebuy.bean.EasybuyProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EasybuyProductMapper {
    long countByExample(EasybuyProductExample example);

    int deleteByExample(EasybuyProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EasybuyProduct record);

    int insertSelective(EasybuyProduct record);

    List<EasybuyProduct> selectByExample(EasybuyProductExample example);

    EasybuyProduct selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EasybuyProduct record, @Param("example") EasybuyProductExample example);

    int updateByExample(@Param("record") EasybuyProduct record, @Param("example") EasybuyProductExample example);

    int updateByPrimaryKeySelective(EasybuyProduct record);

    int updateByPrimaryKey(EasybuyProduct record);
}