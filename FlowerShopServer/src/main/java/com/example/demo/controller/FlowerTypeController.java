package com.example.demo.controller;

import com.example.demo.entiy.FlowerType;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.service.FlowerTypeService;
import com.example.demo.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@RestController
@RequestMapping("/flowerType")
public class FlowerTypeController {

    @Autowired
    private FlowerTypeService flowerTypeService;



    // 新增品类
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody FlowerType flowerType){
        return flowerTypeService.insertFlowerType(flowerType);
    }
    // 修改品类

    // 查询品类
    @PostMapping("/find")
    @ResponseBody
    public Res find(@RequestBody String typeName){
        return flowerTypeService.findFlowerType(typeName);
    }

    // 查询有多少品类
    @PostMapping("/findType")
    @ResponseBody
    public Res findType(){
        return flowerTypeService.findFlowerTypeList();
    }




}
