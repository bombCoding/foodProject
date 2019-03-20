package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.FoodInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.compiler.ast.IntConst;

import java.util.List;
import java.util.Map;

public interface FoodInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FoodInfo record);

    int insertSelective(FoodInfo record);

    FoodInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FoodInfo record);

    int updateByPrimaryKeyWithBLOBs(FoodInfo record);

    int updateByPrimaryKey(FoodInfo record);

    List<FoodInfo> selectAllInfo(@Param("startIndex")Integer startIndex , @Param("pageSize")Integer pageSize);
}