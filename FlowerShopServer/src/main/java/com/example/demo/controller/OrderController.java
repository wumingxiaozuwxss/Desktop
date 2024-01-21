package com.example.demo.controller;

import com.example.demo.entiy.Res;
import com.example.demo.entiy.Order;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 */
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;



    // 新增
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody List<Order> orders){
        return orderService.addOrder(orders);
    }

    @PostMapping("/find")
    @ResponseBody
    public Res find(@RequestBody Integer userId){
        return orderService.findOrder(userId);
    }

    // 删除
    @PostMapping("/del")
    @ResponseBody
    public Res delete(@RequestBody Order order){
        return orderService.delOrder(order);
    }




}
