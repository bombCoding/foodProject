package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.Picandvideos;

public interface PicandvideosMapper {
    int deleteByPrimaryKey(String id);

    int insert(Picandvideos record);

    int insertSelective(Picandvideos record);

    Picandvideos selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Picandvideos record);

    int updateByPrimaryKey(Picandvideos record);
}