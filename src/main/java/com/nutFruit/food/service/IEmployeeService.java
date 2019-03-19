package com.nutFruit.food.service;

import com.nutFruit.food.domain.Employee;

import java.util.List;

public interface IEmployeeService {

    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);
}
