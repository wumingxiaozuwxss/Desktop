package com.example.demo.service;

import com.example.demo.entiy.Location;
import com.example.demo.entiy.Res;
import com.example.demo.entiy.Order;
import com.example.demo.mapper.LocationMapper;
import com.example.demo.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 *
 */
@Service
public class OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private LocationMapper locationMapper;


    public Res addOrder(List<Order> orders){
        String time = "" + System.currentTimeMillis();
        String substring = time.substring(6, 13);
        int index = 1;
        for (Order order : orders) {
            order.setOrderNo(Integer.valueOf("6"+substring));
            order.setOrderId(Integer.valueOf("6"+substring + index));
            index++;
            orderMapper.insertOrder(order);
        }
//        String time = "" + System.currentTimeMillis();
//        String substring = time.substring(5, 13);
//        order.setOrderId(Integer.valueOf("6"+substring));
//        Location locationState = locationMapper.findLocationState(order.getUserId());
//        order.setLocationId(locationState.getLocationId());
//        int i = orderMapper.insertOrder(order);
        return new Res(200, "新增成功", orders);
    }

    public Res delOrder(Order order){
        int i = orderMapper.delOrder(order);
        return new Res(200, "新增成功", order);
    }


    public Res findOrder(Integer userId) {
        List<Order> orders = orderMapper.findOrderUserId(userId);
        return new Res(200, "查询成功", orders);
    }
}
