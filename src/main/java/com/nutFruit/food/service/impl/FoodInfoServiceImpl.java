package com.nutFruit.food.service.impl;

import com.nutFruit.food.domain.FoodInfo;
import com.nutFruit.food.domain.FoodPic;
import com.nutFruit.food.mapper.FoodInfoMapper;
import com.nutFruit.food.mapper.FoodPicMapper;
import com.nutFruit.food.service.IFoodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * Created by 田宝军 on 2019/3/20.
 */

@Service
public class FoodInfoServiceImpl implements IFoodInfoService {

    @Autowired
    private FoodInfoMapper foodInfoMapper;

    @Autowired
    private FoodPicMapper foodPicMapper;


    @Override
    public int deleteByPrimaryKey(Long id) {
        return foodInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(FoodInfo record) {
        return foodInfoMapper.insertSelective(record);
    }

    @Override
    public int insertSelective(FoodInfo record) {
        return foodInfoMapper.insertSelective(record);
    }

    @Override
    public int insertFoodInfo(FoodInfo record) {
        int index =foodInfoMapper.insertSelective(record);
        String pics = record.getPicStr();
        String pic [] = pics.split(",");
        for(int i =0; i<pic.length;i++){
            if(!StringUtils.isEmpty(pic[i])){
                FoodPic foodPic = new FoodPic();
                foodPic.setFoodId(record.getId());
                foodPic.setImgUrl(pic[i]);
                foodPic.setStatus(1);
                foodPic.setType(1);
                foodPicMapper.insertSelective(foodPic);
            }
        }
        return index;
    }

    @Override
    public FoodInfo selectByPrimaryKey(Long id) {
        return foodInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(FoodInfo record) {
        return foodInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(FoodInfo record) {
        return foodInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(FoodInfo record) {
        return foodInfoMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public List<FoodInfo> selectAll(Integer pageNum ,Integer pageSize,Integer type) {
        Integer startIndex = (pageNum-1)*pageSize;
        return foodInfoMapper.selectAllInfo(startIndex,pageSize,type);
    }

    @Override
    public int getAllCountNum() {
        return foodInfoMapper.getAllCountNum();
    }

    @Override
    public int updateFoodInfo(FoodInfo foodInfo, Long userId) {
        foodInfo.setUpdateUserId(userId.toString());
        foodInfo.setUpdateTime(new Date());
        int index = foodInfoMapper.updateByPrimaryKeySelective(foodInfo);
        //先删除之前的图片
        index = foodPicMapper.deleteByFoodId(foodInfo.getId());
        System.err.println("----------------------删除"+index +"条数据");
        //插入新的图片
        String pics = foodInfo.getPicStr();
        String pic [] = pics.split(",");
        for(int i =0; i<pic.length;i++){
            if(!StringUtils.isEmpty(pic[i])){
                FoodPic foodPic = new FoodPic();
                foodPic.setFoodId(foodInfo.getId());
                foodPic.setImgUrl(pic[i]);
                foodPic.setStatus(1);
                foodPic.setType(1);
                foodPicMapper.insertSelective(foodPic);
            }
        }
        return index;
    }
}
