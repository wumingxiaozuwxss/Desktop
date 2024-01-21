package com.example.demo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DemoApplicationTests {

    @Test
    void contextLoads() {
        int i = (int) (1 + Math.random() * (20 - 1 + 1))*10;
        int i2 = (int) ((int) i*1.2);
        System.out.println(i + "--"+ i2);
    }

}
