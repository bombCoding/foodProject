package com.iarchie.crm_v1.mapper;

import com.iarchie.crm_v1.domain.Picandvideos;

public interface PicandvideosMapper {
    int deleteByPrimaryKey(String id);

    int insert(Picandvideos record);

    int insertSelective(Picandvideos record);

    Picandvideos selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Picandvideos record);

    int updateByPrimaryKey(Picandvideos record);
}