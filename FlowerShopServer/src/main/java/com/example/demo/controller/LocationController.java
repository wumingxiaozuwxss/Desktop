package com.example.demo.controller;

import com.example.demo.entiy.Location;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.service.LocationService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@RestController
@RequestMapping("/location")
public class LocationController {

    @Autowired
    private LocationService locationService;



    // 新增
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody Location location){
        return locationService.addLocation(location);
    }
    // 查询
    @PostMapping("/find")
    @ResponseBody
    public Res find(@RequestBody Integer userId){
        return locationService.findLocation(userId);
    }

    // 修改
    @PostMapping("/cheng")
    @ResponseBody
    public Res cheng(@RequestBody Location location){
        return locationService.chengLocation(location);
    }

    // 删除
    @PostMapping("/del")
    @ResponseBody
    public Res delete(@RequestBody Integer locationId){
        return locationService.delLocation(locationId);
    }




}
