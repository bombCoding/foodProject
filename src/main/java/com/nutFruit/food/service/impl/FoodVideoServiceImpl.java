package com.nutFruit.food.service.impl;

import com.nutFruit.food.domain.VideoInfo;
import com.nutFruit.food.mapper.VideoInfoMapper;
import com.nutFruit.food.service.FoodVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lenovo on 2019/3/21.
 */
@Service
public class FoodVideoServiceImpl implements FoodVideoService {

    @Autowired
    private VideoInfoMapper videoInfoMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return videoInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(VideoInfo record) {
        return videoInfoMapper.insert(record);
    }

    @Override
    public int insertSelective(VideoInfo record) {
        return videoInfoMapper.insertSelective(record);
    }

    @Override
    public VideoInfo selectByPrimaryKey(Long id) {
        return videoInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(VideoInfo record) {
        return videoInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(VideoInfo record) {
        return videoInfoMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<VideoInfo> selectAll(Integer pageNum, Integer pageSize, Integer type) {
        Integer startIndex = (pageNum-1)*pageSize;
        return videoInfoMapper.selectAllInfo(startIndex,pageSize,type);
    }

    @Override
    public int getAllCountNum() {
        return videoInfoMapper.getAllCountNum();
    }

}
