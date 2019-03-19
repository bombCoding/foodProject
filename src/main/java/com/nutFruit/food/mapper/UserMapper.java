package com.nutFruit.food.mapper;

import com.nutFruit.food.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    User selectByPrimaryKey(Long id);

    User selectByLogin(@Param("loginname") String loginname, @Param("password") String password);

    List<User> selectAll(@Param("keyword1") String keyword1, @Param("keyword2") String keyword2);

    int updateByPrimaryKey(User record);


    List<User> selectPageResult(@Param("page") int page, @Param("pageLimit") int pageLimit);
}