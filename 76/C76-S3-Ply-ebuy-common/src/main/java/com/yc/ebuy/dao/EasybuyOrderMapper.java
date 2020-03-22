package com.yc.ebuy.dao;

import com.yc.ebuy.bean.EasybuyOrder;
import com.yc.ebuy.bean.EasybuyOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EasybuyOrderMapper {
    long countByExample(EasybuyOrderExample example);

    int deleteByExample(EasybuyOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EasybuyOrder record);

    int insertSelective(EasybuyOrder record);

    List<EasybuyOrder> selectByExample(EasybuyOrderExample example);

    EasybuyOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EasybuyOrder record, @Param("example") EasybuyOrderExample example);

    int updateByExample(@Param("record") EasybuyOrder record, @Param("example") EasybuyOrderExample example);

    int updateByPrimaryKeySelective(EasybuyOrder record);

    int updateByPrimaryKey(EasybuyOrder record);
}