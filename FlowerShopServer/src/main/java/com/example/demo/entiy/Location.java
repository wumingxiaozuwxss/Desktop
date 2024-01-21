package com.example.demo.entiy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Location {

  private int locationId; //地址id
  private String locationName; //地址
  private int userId;// 用户名
  private int locationState; //是否是默认地址



}
