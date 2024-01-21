package com.example.demo.entiy;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Flower {

  private int flowerId;
  private String flowerName; //花名
  private double flowerPrice; //价格
  private double flowerPriced; //原价
  private String flowerImg; //花图片
  private int flowerSales; //销量
  private String flowerSpecification; //规格
  private String flowerDetail1; //详情图片1
  private String flowerDetail2; //详情图片2
  private String flowerDetail3; //详情图片3

}
