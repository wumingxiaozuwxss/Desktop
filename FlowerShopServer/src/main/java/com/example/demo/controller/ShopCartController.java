package com.example.demo.controller;

import com.example.demo.entiy.ShopCart;
import com.example.demo.entiy.Res;
import com.example.demo.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@RestController
@RequestMapping("/shopCart")
public class ShopCartController {

    @Autowired
    private ShopCartService shopCartService;



    // 新增
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody ShopCart shopCart){
        return shopCartService.addShopCart(shopCart);
    }

    // 查询
    @PostMapping("/find")
    @ResponseBody
    public Res find(@RequestBody Integer userId){
        return shopCartService.findShopCart(userId);
    }

    // 删除
    @PostMapping("/del")
    @ResponseBody
    public Res delete(@RequestBody Integer shopId){
        return shopCartService.delShopCart(shopId);
    }




}
