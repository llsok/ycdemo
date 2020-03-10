package com.yc.blog.dao;

import com.yc.blog.bean.Flink;
import com.yc.blog.bean.FlinkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlinkMapper {
    long countByExample(FlinkExample example);

    int deleteByExample(FlinkExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Flink record);

    int insertSelective(Flink record);

    List<Flink> selectByExample(FlinkExample example);

    Flink selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Flink record, @Param("example") FlinkExample example);

    int updateByExample(@Param("record") Flink record, @Param("example") FlinkExample example);

    int updateByPrimaryKeySelective(Flink record);

    int updateByPrimaryKey(Flink record);
}