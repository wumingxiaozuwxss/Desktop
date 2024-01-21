package com.example.demo.controller;

import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    // 请求测试
    @PostMapping("/test")
    @ResponseBody
    public String one(String name){
        return "接受信息++" + name ;
    }

    // 登录用户
    @PostMapping("/login")
    @ResponseBody
    public Res login(@RequestBody User user){
        return userService.loginUser(user);
    }

    // 新增用户
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody User user){
        return userService.insertUser(user);
    }




}
