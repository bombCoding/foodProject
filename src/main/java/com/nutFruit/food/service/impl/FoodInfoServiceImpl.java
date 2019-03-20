package com.nutFruit.food.service.impl;

import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.mapper.FoodInfoMapper;
import com.nutFruit.food.service.IFoodInfoService;
import com.sun.tools.javac.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田宝军 on 2019/3/20.
 */

public class FoodInfoServiceImpl implements IFoodInfoService {

    @Autowired
    private FoodInfoMapper mapper;
    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(FoodInfo record) {
        if (record != null) {
            return mapper.insert(record);
        }
        return 0;
    }

    @Override
    public FoodInfo selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<FoodInfo> selectAll() {
        return null;
    }

    @Override
    public int updateByPrimaryKey(FoodInfo record) {
        return mapper.updateByPrimaryKey(record);
    }
}
