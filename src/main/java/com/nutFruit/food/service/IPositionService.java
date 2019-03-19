package com.nutFruit.food.service;

import com.nutFruit.food.domain.Position;

import java.util.List;

public interface IPositionService {

    int deleteByPrimaryKey(Long id);

    int insert(Position record);

    Position selectByPrimaryKey(Long id);

    List<Position> selectAll(String keyword);

    int updateByPrimaryKey(Position record);
}
