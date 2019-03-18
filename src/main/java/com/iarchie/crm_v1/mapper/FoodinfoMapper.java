package com.iarchie.crm_v1.mapper;

import com.iarchie.crm_v1.domain.Foodinfo;

public interface FoodinfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(Foodinfo record);

    int insertSelective(Foodinfo record);

    Foodinfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Foodinfo record);

    int updateByPrimaryKey(Foodinfo record);
}