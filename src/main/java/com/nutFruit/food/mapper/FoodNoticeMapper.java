package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.FoodNotice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FoodNoticeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FoodNotice record);

    int insertSelective(FoodNotice record);

    FoodNotice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodNotice record);

    int updateByPrimaryKeyWithBLOBs(FoodNotice record);

    int updateByPrimaryKey(FoodNotice record);

    List<FoodNotice> selectAll(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize, @Param("type") Integer type);

    int getAllCountNum();
}