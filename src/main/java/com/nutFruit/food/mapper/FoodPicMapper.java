package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.FoodPic;

import java.util.List;

public interface FoodPicMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FoodPic record);

    int insertSelective(FoodPic record);

    FoodPic selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodPic record);

    int updateByPrimaryKey(FoodPic record);

    List<FoodPic> selectByFoodId(Long foodId);

    int deleteByFoodId(Long foodId);
}