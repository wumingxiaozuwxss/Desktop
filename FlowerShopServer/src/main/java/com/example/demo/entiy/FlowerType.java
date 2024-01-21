package com.example.demo.entiy;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;



@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FlowerType {

  private int typeId;//分类id
  private String typeName; //分类名称
  private int flowerId; // 花名
  private Flower flower; // 鲜花详情




}
