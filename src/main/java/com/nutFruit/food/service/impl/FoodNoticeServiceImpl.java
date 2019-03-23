package com.nutFruit.food.service.impl;

import com.nutFruit.food.domain.FoodNotice;
import com.nutFruit.food.mapper.FoodNoticeMapper;
import com.nutFruit.food.service.FoodNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Sun JinShuang on 2019/3/23.
 */
@Service
public class FoodNoticeServiceImpl implements FoodNoticeService {

    @Autowired
    private FoodNoticeMapper foodNoticeMapper;


    @Override
    public int deleteByPrimaryKey(Long id) {
        return foodNoticeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(FoodNotice record) {
        return foodNoticeMapper.insert(record);
    }

    @Override
    public int insertSelective(FoodNotice record) {
        return foodNoticeMapper.insertSelective(record);
    }

    @Override
    public FoodNotice selectByPrimaryKey(Long id) {
        return foodNoticeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(FoodNotice record) {
        return foodNoticeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(FoodNotice record) {
        return foodNoticeMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(FoodNotice record) {
        return foodNoticeMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<FoodNotice> selectAll(Integer pageNum, Integer pageSize, Integer type) {
        Integer startIndex = (pageNum-1)*pageSize;
        return foodNoticeMapper.selectAll(startIndex,pageSize,type);
    }

    @Override
    public int getAllCountNum() {
        return foodNoticeMapper.getAllCountNum();
    }
}
