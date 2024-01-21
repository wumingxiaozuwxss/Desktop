package com.example.demo.mapper;

import com.example.demo.entiy.Flower;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FlowerMapper {
    // 新增鲜花
     int insertFlower(Flower flower);

     int count();

     List<Flower> findFlower();

    Flower findFlowerById(String flowerId);

    // List<Flower> findFlowerPage(Integer page);
}
