package com.example.demo.mapper;


import com.example.demo.entiy.ShopCart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopCartMapper {

    int insertShopCart(ShopCart shopCart);

    int delShopCart(Integer shopId);

    List<ShopCart> findShopCart(Integer userId);

    ShopCart findShopCartType(ShopCart shopCart);

    int upShopCart(ShopCart shopCartType);
}
