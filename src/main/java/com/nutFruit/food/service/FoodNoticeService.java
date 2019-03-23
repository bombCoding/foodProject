package com.nutFruit.food.service;

import com.nutFruit.food.domain.FoodNotice;

import java.util.List;

/**
 * Created by Sun JinShuang on 2019/3/23.
 */
public interface FoodNoticeService {

    int deleteByPrimaryKey(Long id);

    int insert(FoodNotice record);

    int insertSelective(FoodNotice record);

    FoodNotice selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodNotice record);

    int updateByPrimaryKeyWithBLOBs(FoodNotice record);

    int updateByPrimaryKey(FoodNotice record);

    List<FoodNotice> selectAll(Integer pageNum , Integer pageSize, Integer type);

    int getAllCountNum();
}
