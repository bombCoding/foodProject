package com.nutFruit.food.service;

import com.nutFruit.food.domain.VideoInfo;

import java.util.List;

/**
 * Created by Lenovo on 2019/3/21.
 */
public interface FoodVideoService {

    int deleteByPrimaryKey(Long id);

    int insert(VideoInfo record);

    int insertSelective(VideoInfo record);

    VideoInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VideoInfo record);

    int updateByPrimaryKey(VideoInfo record);

    List<VideoInfo> selectAll(Integer pageNum,Integer pageSize);
}
