package com.example.demo.controller;

import com.example.demo.entiy.Comment;
import com.example.demo.entiy.Res;
import com.example.demo.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 */
@RestController
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;



    // 新增
    @PostMapping("/add")
    @ResponseBody
    public Res add(@RequestBody Comment comment){
        return commentService.addComment(comment);
    }


    @PostMapping("/find")
    @ResponseBody
    public Res find(@RequestBody Integer flowerId){
        return commentService.findComment(flowerId);
    }


    // 删除
    @PostMapping("/del")
    @ResponseBody
    public Res delete(@RequestBody Comment comment){
        return commentService.delComment(comment);
    }




}
