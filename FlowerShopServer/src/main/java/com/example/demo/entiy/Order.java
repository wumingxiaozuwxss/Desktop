package com.example.demo.entiy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Order {

  private int orderId;//订单id
  private int orderNo; //订单编号
  private int flowerId;//花的id
  private Flower flower; //花的详情
  private int orderNumber;//订单数量
  private double orderPrice;// 订单价格
  private int locationId; //位置id
  private Location location;// 位置的地址
  private int userId; // 用户id
  private int commentState; // 是否评价
  private Comment comment;// 评价



}
