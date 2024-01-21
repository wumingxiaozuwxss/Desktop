package com.example.demo.service;

import com.example.demo.entiy.Comment;
import com.example.demo.entiy.Res;
import com.example.demo.mapper.CommentMapper;
import com.example.demo.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 *
 */
@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private OrderMapper orderMapper;


    public Res addComment(Comment comment){
        String time = "" + System.currentTimeMillis();
        String substring = time.substring(5, 13);
        comment.setCommentId(Integer.valueOf("6"+substring));
        int i = commentMapper.insertComment(comment);
        int i1 = orderMapper.updateOrderCommentState(comment.getOrderId());
        return new Res(200, "新增成功", comment);
    }

    public Res delComment(Comment comment){
        int i = commentMapper.delComment(comment);
        return new Res(200, "新增成功", comment);
    }


    public Res findComment(Integer flowerId) {
        List<Comment> comment = commentMapper.findComment(flowerId);
        return new Res(200, "查询成功", comment);
    }
}
