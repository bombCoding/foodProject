package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.Foodinfo;

public interface FoodinfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(Foodinfo record);

    int insertSelective(Foodinfo record);

    Foodinfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Foodinfo record);

    int updateByPrimaryKey(Foodinfo record);
}