package com.example.demo.service;

import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;


/**
 *
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    //用户注册
    public Res insertUser(User user){


        User one = userMapper.findOne(user);
        Res res = new Res(200, "注册成功", user);
        if (one == null) {
            String time = "" + System.currentTimeMillis();
            String substring = time.substring(5, 13);
            // 设置9位随机书
           user.setUserId(Integer.valueOf("1" + substring));
           int i = userMapper.insertUser(user);
        }else {
            res = new Res(201, "用户名重复", user);
        }
        return res;
    }

    //用户登录
    public Res loginUser(User user){
        User user1 = userMapper.findUser(user);
        return new Res(200,"登录成功",user1);
    }


}
