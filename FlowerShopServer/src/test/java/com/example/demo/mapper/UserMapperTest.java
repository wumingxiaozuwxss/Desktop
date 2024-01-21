package com.example.demo.mapper;


import com.example.demo.DemoApplicationTests;
import com.example.demo.entiy.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class UserMapperTest extends DemoApplicationTests {

    @Autowired
    private UserMapper  userMapper;


}