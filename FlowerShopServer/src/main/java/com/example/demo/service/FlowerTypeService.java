package com.example.demo.service;

import com.example.demo.entiy.Flower;
import com.example.demo.entiy.FlowerType;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.User;
import com.example.demo.mapper.FlowerMapper;
import com.example.demo.mapper.FlowerTypeMapper;
import com.example.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 *
 */
@Service
public class FlowerTypeService {

    @Autowired
    private FlowerTypeMapper flowerTypeMapper;

    @Autowired
    private FlowerMapper flowerMapper;


    public Res insertFlowerType(FlowerType flowerType) {

        //名字
        String time = "" + System.currentTimeMillis();
        String substring = time.substring(5, 13);
        flowerType.setTypeId(Integer.valueOf(3+substring));
        int[] ints = {297024091,297061880,297071792,297082869,297109811,297122924,297133642,297178368,297185995};
        int index = (int) (Math.random() * 8)+1;
        flowerType.setFlowerId(ints[index]);
        flowerTypeMapper.insertFlowerType(flowerType);
        return new Res(200, "品类新增成功", flowerType);
    }

    public Res findFlowerType(String typeName) {

        ArrayList<FlowerType> flowerTypeList = flowerTypeMapper.findFlowerTypeList(typeName);

        return new Res(200, "查询成功", flowerTypeList);
    }

//    public Res findFlowerTypeList() {
//        List<FlowerType> flowerTypes = flowerTypeMapper.findFlowerTypes();
//        return new Res(200, "查询成功", flowerTypes);
//    }

    public Res findFlowerTypeList() {
        List<Flower> flowers = flowerMapper.findFlower();
        ArrayList<FlowerType> flowerTypes = new ArrayList<>();
        String[] types = {"创意鲜花" ,"婚庆鲜花" ,"开业鲜花", "爆款推荐", "爱情鲜花" , "生日鲜花"  ,"祝福鲜花" ,"表白鲜花" ,"长辈鲜花" };
        int i = 0;
        for (String type : types) {
            if (i > flowers.size()){
                return new Res(200, "查询成功", flowerTypes);
            }else {
                Flower flower = flowers.get(i);
                flowerTypes.add(new FlowerType(0, type, flower.getFlowerId(),flower ));
                ++i;
            }
        }
        return new Res(200, "查询成功", flowerTypes);
    }
}
