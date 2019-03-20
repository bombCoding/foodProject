package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.FoodInfo;

public interface FoodInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FoodInfo record);

    int insertSelective(FoodInfo record);

    FoodInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodInfo record);

    int updateByPrimaryKeyWithBLOBs(FoodInfo record);

    int updateByPrimaryKey(FoodInfo record);
}