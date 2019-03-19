package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.DocTest;
import java.util.List;

public interface DocTestMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DocTest record);

    DocTest selectByPrimaryKey(Long id);

    List<DocTest> selectAll();

    int updateByPrimaryKey(DocTest record);
}