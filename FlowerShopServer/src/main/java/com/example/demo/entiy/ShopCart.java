package com.example.demo.entiy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ShopCart {

  private int shopId; //购物车id 开头是5
  private int shopNumber;//购物数量
  private int flowerId; //鲜花id
  private Flower flower;// 鲜花详情
  private int userId; // 用户id





}
