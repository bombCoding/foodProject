package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.DownloadDco;

import java.util.List;

public interface DownloadDcoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DownloadDco record);

    DownloadDco selectByPrimaryKey(Long id);

    List<DownloadDco> selectAll();

    int updateByPrimaryKey(DownloadDco record);
}