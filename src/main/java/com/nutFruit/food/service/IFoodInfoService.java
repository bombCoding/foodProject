package com.nutFruit.food.service;

import com.nutFruit.food.domain.FoodInfo;

import java.util.List;

/**
 * Created by Tbj on 2019/3/20.
 */
public interface IFoodInfoService {


    int deleteByPrimaryKey(Long id);

    int insert(FoodInfo record);

    int insertSelective(FoodInfo record);

    int insertFoodInfo(FoodInfo record);

    FoodInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodInfo record);

    int updateByPrimaryKeyWithBLOBs(FoodInfo record);

    int updateByPrimaryKey(FoodInfo record);


    /**
     * 按类型查找列表  type  1 app请求   2后台管理请求
     * @Author: sun JinShuang
     * @Date: 2019/3/23
     */
    List<FoodInfo> selectAll(Integer pageNum ,Integer pageSize,Integer type);

    int getAllCountNum();

    int updateFoodInfo(FoodInfo foodInfo,Long userId);

}
