package com.nutFruit.food.service;

import com.nutFruit.food.domain.DocTest;

import java.util.List;

public interface IDocTestService {
    int deleteByPrimaryKey(Long id);

    int insert(DocTest record);

    DocTest selectByPrimaryKey(Long id);

    List<DocTest> selectAll();

    int updateByPrimaryKey(DocTest record);
}
