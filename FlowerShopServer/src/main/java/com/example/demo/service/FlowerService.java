package com.example.demo.service;

import com.example.demo.entiy.Flower;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.mapper.FlowerMapper;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;


/**
 *
 */
@Service
public class FlowerService {

    @Autowired
    private FlowerMapper flowerMapper;

    //鲜花新增
    public Res insertFlower(Flower flower){


        String time = "" + System.currentTimeMillis();
        String substring = time.substring(5, 13);

        flower.setFlowerId(Integer.valueOf(2+substring));

        int i = (int) (1 + Math.random() * (20 - 1 + 1))*10;
        int i2 = (int) ((int) i*1.2);

        flower.setFlowerPrice(i);
        flower.setFlowerPriced(i2);

        int count = flowerMapper.count() + 1;
        String img = "http://localhost:8080/static/"+ count +".jpg";
        flower.setFlowerImg(img);

        //销量
        flower.setFlowerSales(i*10+i2*5);
        flower.setFlowerSpecification("一束");
        String img1 = "http://localhost:8080/static/t1.jpg";
        String img2 = "http://localhost:8080/static/t2.jpg";
        String img3 = "http://localhost:8080/static/t3.jpg";
        flower.setFlowerDetail1(img1);
        flower.setFlowerDetail2(img2);
        flower.setFlowerDetail3(img3);


        flowerMapper.insertFlower(flower);
        return new Res(200,"插入成功",flower);
    }

    public Res findFlower() {
        List<Flower> flower = flowerMapper.findFlower();
        return new Res(200, "查询成功", flower);
    }

    public Res findFlowerById(String flowerId) {
        Flower flower = flowerMapper.findFlowerById(flowerId);
        return new Res(200, "鲜花详情", flower);
    }
}
