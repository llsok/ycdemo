package com.yc.ebuy.dao;

import com.yc.ebuy.bean.EasybuyOrderDetail;
import com.yc.ebuy.bean.EasybuyOrderDetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EasybuyOrderDetailMapper {
    long countByExample(EasybuyOrderDetailExample example);

    int deleteByExample(EasybuyOrderDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EasybuyOrderDetail record);

    int insertSelective(EasybuyOrderDetail record);

    List<EasybuyOrderDetail> selectByExample(EasybuyOrderDetailExample example);

    EasybuyOrderDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EasybuyOrderDetail record, @Param("example") EasybuyOrderDetailExample example);

    int updateByExample(@Param("record") EasybuyOrderDetail record, @Param("example") EasybuyOrderDetailExample example);

    int updateByPrimaryKeySelective(EasybuyOrderDetail record);

    int updateByPrimaryKey(EasybuyOrderDetail record);
}