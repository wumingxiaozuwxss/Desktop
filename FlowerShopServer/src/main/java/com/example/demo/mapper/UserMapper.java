package com.example.demo.mapper;

import com.example.demo.entiy.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    // 新增用户
     int insertUser(User user);

    User findUser(User user);

    User findOne(User user);
}
