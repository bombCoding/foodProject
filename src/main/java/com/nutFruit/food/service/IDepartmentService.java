package com.nutFruit.food.service;

import com.nutFruit.food.domain.Department;

import java.util.List;

public interface IDepartmentService {

    int deleteByPrimaryKey(Long id);

    int insert(Department record);

    Department selectByPrimaryKey(Long id);

    List<Department> selectAll(String keyword);

    int updateByPrimaryKey(Department record);
}
