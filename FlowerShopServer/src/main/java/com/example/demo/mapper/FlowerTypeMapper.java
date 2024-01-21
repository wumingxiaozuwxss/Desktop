package com.example.demo.mapper;

import com.example.demo.entiy.FlowerType;
import com.example.demo.entiy.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface FlowerTypeMapper {

    ArrayList<FlowerType> findFlowerTypeList(String name);

    int insertFlowerType(FlowerType flowerType);

    // 查询鲜花种类
    List<FlowerType> findFlowerTypes();

}
