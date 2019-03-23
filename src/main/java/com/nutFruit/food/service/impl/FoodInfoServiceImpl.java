package com.nutFruit.food.service.impl;

import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.mapper.FoodInfoMapper;
import com.nutFruit.food.service.IFoodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田宝军 on 2019/3/20.
 */

@Service
public class FoodInfoServiceImpl implements IFoodInfoService {

    @Autowired
    private FoodInfoMapper foodInfoMapper;


    @Override
    public int deleteByPrimaryKey(Long id) {
        return foodInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(FoodInfo record) {
        if (record != null) {
            return foodInfoMapper.insertSelective(record);
        }
        return 0;
    }

    @Override
    public FoodInfo selectByPrimaryKey(Long id) {
        return foodInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<FoodInfo> selectAll(Integer pageNum ,Integer pageSize) {
        Integer startIndex = (pageNum-1)*pageSize;
        return foodInfoMapper.selectAllInfo(startIndex,pageSize);
    }

    @Override
    public int updateByPrimaryKey(FoodInfo record) {

        return foodInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(FoodInfo record) {
        return foodInfoMapper.updateByPrimaryKeyWithBLOBs(record);
    }
}
