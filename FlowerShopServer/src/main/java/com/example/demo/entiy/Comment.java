package com.example.demo.entiy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Comment {

  private int commentId;
  private String commentContent; //评价
  private int orderId; // 订单id
  private int userId; //用户id
  private User user; //用户
  private int flowerId; //商品id


}
