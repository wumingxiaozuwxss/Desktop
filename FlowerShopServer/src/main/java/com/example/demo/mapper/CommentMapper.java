package com.example.demo.mapper;


import com.example.demo.entiy.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    int insertComment(Comment comment);

    int delComment(Comment comment);

    List<Comment> findComment(Integer flowerId);
}
