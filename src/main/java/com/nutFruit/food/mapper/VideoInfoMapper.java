package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.VideoInfo;

public interface VideoInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(VideoInfo record);

    int insertSelective(VideoInfo record);

    VideoInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VideoInfo record);

    int updateByPrimaryKey(VideoInfo record);
}