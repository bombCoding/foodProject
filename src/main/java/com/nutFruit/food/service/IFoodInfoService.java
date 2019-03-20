package com.nutFruit.food.service;

import com.nutFruit.food.domain.FoodInfo;

import java.util.List;

/**
 * Created by 田宝军 on 2019/3/20.
 */
public interface IFoodInfoService {

    int deleteByPrimaryKey(Long id);

    int insert(FoodInfo record);

    FoodInfo selectByPrimaryKey(Long id);

    List<FoodInfo> selectAll(Integer pageNum ,Integer pageSize);

    int updateByPrimaryKey(FoodInfo record);

}
