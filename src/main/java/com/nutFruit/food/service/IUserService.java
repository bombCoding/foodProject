package com.nutFruit.food.service;

import com.nutFruit.food.domain.User;

import java.util.List;

public interface IUserService {

    List<User> selectAll(String keyword1,String keyword2);
    List<User> selectPageResult(int page,int pageLimit);
    int insert(User record);
    int deleteByPrimaryKey(Long id);
    User selectByLogin( String loginname,String password);
    int updateByPrimaryKey(User record);
}
