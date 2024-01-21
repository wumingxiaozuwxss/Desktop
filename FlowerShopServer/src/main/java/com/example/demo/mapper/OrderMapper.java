package com.example.demo.mapper;


import com.example.demo.entiy.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {

    int insertOrder(Order order);

    int delOrder(Order order);

    int updateOrderCommentState(Integer order);

    List<Order> findOrderUserId(Integer userId);

    Order findOrderId (Integer orderId);
}
