package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.FoodPic;

public interface FoodPicMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FoodPic record);

    int insertSelective(FoodPic record);

    FoodPic selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodPic record);

    int updateByPrimaryKey(FoodPic record);
}