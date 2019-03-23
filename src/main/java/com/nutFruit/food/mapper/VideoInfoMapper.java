package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.VideoInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VideoInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(VideoInfo record);

    int insertSelective(VideoInfo record);

    VideoInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VideoInfo record);

    int updateByPrimaryKey(VideoInfo record);

    List<VideoInfo> selectAllInfo(@Param("startIndex") Integer startIndex,@Param("pageSize") Integer pageSize,@Param("type") Integer type);

    int getAllCountNum();
}