package com.example.demo.controller;

import com.example.demo.entiy.Flower;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.service.FlowerService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@RestController
@RequestMapping("/flower")
public class FlowerController {

    @Autowired
    private FlowerService flowerService;

    // 新增鲜花
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody Flower flower){
        return flowerService.insertFlower(flower);
    }
    // 查询鲜花
    @PostMapping("/find")
    @ResponseBody
    public Res find(){
        return flowerService.findFlower();
    }

    @PostMapping("/findById")
    @ResponseBody
    public Res findById(@RequestBody String flowerId){
        return flowerService.findFlowerById(flowerId);
    }

}
