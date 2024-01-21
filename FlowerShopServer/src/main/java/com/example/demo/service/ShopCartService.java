package com.example.demo.service;

import com.example.demo.entiy.ShopCart;
import com.example.demo.entiy.Res;
import com.example.demo.mapper.ShopCartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 *
 */
@Service
public class ShopCartService {

    @Autowired
    private ShopCartMapper shopCartMapper;


    public Res addShopCart(ShopCart shopCart){

        // 先查询有没有相同的参数
        ShopCart shopCartType = shopCartMapper.findShopCartType(shopCart);
        if (shopCartType != null){
            shopCartType.setShopNumber(shopCartType.getShopNumber() + shopCart.getShopNumber());
            int i = shopCartMapper.upShopCart(shopCartType);
            return new Res(200, "数量成功", shopCartType);
        }
        String time = "" + System.currentTimeMillis();
        String substring = time.substring(5, 13);
        shopCart.setShopId(Integer.valueOf("5"+substring));
        int i = shopCartMapper.insertShopCart(shopCart);
        return new Res(200, "新增成功", shopCart);
    }

    public Res delShopCart(Integer shopId){
        int i = shopCartMapper.delShopCart(shopId);
        return new Res(200, "新增成功", i);
    }


    public Res findShopCart(Integer userId) {
        List<ShopCart> shopCart = shopCartMapper.findShopCart(userId);
        return new Res(200, "查询成功", shopCart);
    }
}
